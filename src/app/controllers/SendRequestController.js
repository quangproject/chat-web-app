const { User } = require('../models/User');
const { FriendRequest } = require('../models/FriendRequest');
const { FriendShip } = require('../models/FriendShip');

class SendRequestController {
    index(req, res) {
        res.render('send-request/index', {
            title: "Send Request",
            style: "send-request.css",
            script: "sendRequest.js"
        })
    }

    async sendRequest(req, res) {
        const { friendUsername, message } = req.body
        // Check if friend username is user
        if (friendUsername === req.session.user.username) {
            return res.status(400).json({ error: "You can't send request to yourself" })
        }

        const friendObj = await User.getOne(friendUsername)
        if (friendObj.rowCount == 0) {
            return res.status(400).json({ error: "User not found" })
        }

        const friend = friendObj.rows[0]
        const senderId = req.session.user.user_id
        const receiverId = friend.user_id

        // Check if user and friend already friend
        const checkFriend = await FriendShip.getOne(senderId, receiverId)
        if (checkFriend.rowCount > 0) {
            return res.status(400).json({ error: "You and this user already friend" })
        }

        // Check if user already send request to friend
        const checkRequestWasSend = await FriendRequest.checkRequestWasSend(senderId, receiverId)
        if (checkRequestWasSend.rowCount > 0) {
            return res.status(400).json({ error: "You already send request to this user" })
        }

        // Check if friend already send request to user
        const checkRequestWasReceive = await FriendRequest.checkRequestWasReceive(receiverId, senderId)
        if (checkRequestWasReceive.rowCount > 0) {
            return res.status(400).json({ error: "This user already send request to you" })
        }

        // Create friend request
        const requestObj = await FriendRequest.create(senderId, receiverId, message)
        if (requestObj.rowCount > 0) {
            return res.status(200).json({ message: "Send request successfully" })
        } else {
            return res.status(400).json({ error: "Send request failed" })
        }
    }
}

module.exports = new SendRequestController