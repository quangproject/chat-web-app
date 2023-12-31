const { Participant } = require('../models/Participant')
const { Conversation } = require('../models/Conversation')

class ConversationController {
    async create(req, res) {
        // get friendId from req.body
        const { friendId } = req.body
        // get userId from session
        const userId = req.session.user.user_id

        // how to check if conversation exist?
        const isExist = await Conversation.isExist(friendId, userId)

        if (isExist.rowCount == 1) {
            return res.status(200).json({ message: 'Conversation already exist.', conversationId: isExist.rows[0].conversation_id });
        }

        // create conversation
        const conversation = await Conversation.create()
        if (conversation.rowCount == 0) {
            return res.status(500).json({ error: 'Error creating conversation.' });
        }
        const conversationId = conversation.rows[0].conversation_id
        // create participant
        const participant = await Participant.create(userId, conversationId)
        if (participant.rowCount == 0) {
            return res.status(500).json({ error: 'Error creating participant.' });
        }
        const participantFriend = await Participant.create(friendId, conversationId)
        if (participantFriend.rowCount == 0) {
            return res.status(500).json({ error: 'Error creating participant.' });
        }
        return res.status(200).json({ message: 'Conversation created successfully.', conversationId });
    }

    async remove(req, res) {
        // get conversationId from req.params
        const { conversationId } = req.params
        // delete conversation
        const conversation = await Conversation.delete(conversationId)
        if (conversation.rowCount == 0) {
            return res.status(500).json({ error: 'Error deleting conversation.' });
        }
        // get all conversation of user
        Conversation.findAll(req.session.user.user_id)
            .then((data) => {
                return res.status(200).json({ message: 'Conversation deleted successfully.', numberOfConversation: data.rowCount });
            })
            .catch(() => {
                return res.status(500).json({ error: 'Error deleting conversation.' });
            });
    }
}

module.exports = new ConversationController