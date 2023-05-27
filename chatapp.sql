PGDMP     (    !                {            chatapp    15.2    15.2 A    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16790    chatapp    DATABASE     �   CREATE DATABASE chatapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE chatapp;
                postgres    false            �            1259    16811    conversations    TABLE     ~   CREATE TABLE public.conversations (
    conversation_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);
 !   DROP TABLE public.conversations;
       public         heap    postgres    false            �            1259    16810 !   Conversations_conversation_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Conversations_conversation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Conversations_conversation_id_seq";
       public          postgres    false    217            H           0    0 !   Conversations_conversation_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Conversations_conversation_id_seq" OWNED BY public.conversations.conversation_id;
          public          postgres    false    216            �            1259    16842    messages    TABLE     �   CREATE TABLE public.messages (
    message_id integer NOT NULL,
    conversation_id integer NOT NULL,
    sender_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    16841    Messages_message_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messages_message_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Messages_message_id_seq";
       public          postgres    false    221            I           0    0    Messages_message_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Messages_message_id_seq" OWNED BY public.messages.message_id;
          public          postgres    false    220            �            1259    16825    participants    TABLE     �   CREATE TABLE public.participants (
    participant_id integer NOT NULL,
    user_id integer NOT NULL,
    conversation_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);
     DROP TABLE public.participants;
       public         heap    postgres    false            �            1259    16824    Participants_participant_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Participants_participant_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Participants_participant_id_seq";
       public          postgres    false    219            J           0    0    Participants_participant_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Participants_participant_id_seq" OWNED BY public.participants.participant_id;
          public          postgres    false    218            �            1259    16861    receipts    TABLE     �   CREATE TABLE public.receipts (
    receipt_id integer NOT NULL,
    message_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);
    DROP TABLE public.receipts;
       public         heap    postgres    false            �            1259    16860    Receipts_receipt_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Receipts_receipt_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Receipts_receipt_id_seq";
       public          postgres    false    223            K           0    0    Receipts_receipt_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Receipts_receipt_id_seq" OWNED BY public.receipts.receipt_id;
          public          postgres    false    222            �            1259    16792    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    gender boolean,
    birthday date NOT NULL,
    address text,
    telephone character varying(12),
    avatar text,
    status character varying(20) NOT NULL,
    is_admin boolean NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16791    Users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Users_user_id_seq";
       public          postgres    false    215            L           0    0    Users_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public.users.user_id;
          public          postgres    false    214            �            1259    16895    friend_requests    TABLE     �   CREATE TABLE public.friend_requests (
    request_id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    message text NOT NULL
);
 #   DROP TABLE public.friend_requests;
       public         heap    postgres    false            �            1259    16894    friend_requests_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friend_requests_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.friend_requests_request_id_seq;
       public          postgres    false    227            M           0    0    friend_requests_request_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.friend_requests_request_id_seq OWNED BY public.friend_requests.request_id;
          public          postgres    false    226            �            1259    16878    friendships    TABLE     �   CREATE TABLE public.friendships (
    friendship_id integer NOT NULL,
    user_id integer NOT NULL,
    friend_id integer NOT NULL
);
    DROP TABLE public.friendships;
       public         heap    postgres    false            �            1259    16877    friendships_friendship_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendships_friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.friendships_friendship_id_seq;
       public          postgres    false    225            N           0    0    friendships_friendship_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.friendships_friendship_id_seq OWNED BY public.friendships.friendship_id;
          public          postgres    false    224            �           2604    16814    conversations conversation_id    DEFAULT     �   ALTER TABLE ONLY public.conversations ALTER COLUMN conversation_id SET DEFAULT nextval('public."Conversations_conversation_id_seq"'::regclass);
 L   ALTER TABLE public.conversations ALTER COLUMN conversation_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16898    friend_requests request_id    DEFAULT     �   ALTER TABLE ONLY public.friend_requests ALTER COLUMN request_id SET DEFAULT nextval('public.friend_requests_request_id_seq'::regclass);
 I   ALTER TABLE public.friend_requests ALTER COLUMN request_id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    16881    friendships friendship_id    DEFAULT     �   ALTER TABLE ONLY public.friendships ALTER COLUMN friendship_id SET DEFAULT nextval('public.friendships_friendship_id_seq'::regclass);
 H   ALTER TABLE public.friendships ALTER COLUMN friendship_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16845    messages message_id    DEFAULT     |   ALTER TABLE ONLY public.messages ALTER COLUMN message_id SET DEFAULT nextval('public."Messages_message_id_seq"'::regclass);
 B   ALTER TABLE public.messages ALTER COLUMN message_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16828    participants participant_id    DEFAULT     �   ALTER TABLE ONLY public.participants ALTER COLUMN participant_id SET DEFAULT nextval('public."Participants_participant_id_seq"'::regclass);
 J   ALTER TABLE public.participants ALTER COLUMN participant_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16864    receipts receipt_id    DEFAULT     |   ALTER TABLE ONLY public.receipts ALTER COLUMN receipt_id SET DEFAULT nextval('public."Receipts_receipt_id_seq"'::regclass);
 B   ALTER TABLE public.receipts ALTER COLUMN receipt_id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16795    users user_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public."Users_user_id_seq"'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    215    215            7          0    16811    conversations 
   TABLE DATA           D   COPY public.conversations (conversation_id, created_at) FROM stdin;
    public          postgres    false    217   �Q       A          0    16895    friend_requests 
   TABLE DATA           V   COPY public.friend_requests (request_id, sender_id, receiver_id, message) FROM stdin;
    public          postgres    false    227   9R       ?          0    16878    friendships 
   TABLE DATA           H   COPY public.friendships (friendship_id, user_id, friend_id) FROM stdin;
    public          postgres    false    225   VR       ;          0    16842    messages 
   TABLE DATA           _   COPY public.messages (message_id, conversation_id, sender_id, content, created_at) FROM stdin;
    public          postgres    false    221   �R       9          0    16825    participants 
   TABLE DATA           \   COPY public.participants (participant_id, user_id, conversation_id, created_at) FROM stdin;
    public          postgres    false    219   ZT       =          0    16861    receipts 
   TABLE DATA           O   COPY public.receipts (receipt_id, message_id, user_id, created_at) FROM stdin;
    public          postgres    false    223   �T       5          0    16792    users 
   TABLE DATA           �   COPY public.users (user_id, username, password, email, first_name, last_name, gender, birthday, address, telephone, avatar, status, is_admin) FROM stdin;
    public          postgres    false    215   �U       O           0    0 !   Conversations_conversation_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Conversations_conversation_id_seq"', 17, true);
          public          postgres    false    216            P           0    0    Messages_message_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Messages_message_id_seq"', 42, true);
          public          postgres    false    220            Q           0    0    Participants_participant_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."Participants_participant_id_seq"', 25, true);
          public          postgres    false    218            R           0    0    Receipts_receipt_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Receipts_receipt_id_seq"', 20, true);
          public          postgres    false    222            S           0    0    Users_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Users_user_id_seq"', 39, true);
          public          postgres    false    214            T           0    0    friend_requests_request_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.friend_requests_request_id_seq', 58, true);
          public          postgres    false    226            U           0    0    friendships_friendship_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.friendships_friendship_id_seq', 32, true);
          public          postgres    false    224            �           2606    16816     conversations Conversations_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT "Conversations_pkey" PRIMARY KEY (conversation_id);
 L   ALTER TABLE ONLY public.conversations DROP CONSTRAINT "Conversations_pkey";
       public            postgres    false    217            �           2606    16849    messages Messages_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (message_id);
 B   ALTER TABLE ONLY public.messages DROP CONSTRAINT "Messages_pkey";
       public            postgres    false    221            �           2606    16830    participants Participants_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.participants
    ADD CONSTRAINT "Participants_pkey" PRIMARY KEY (participant_id);
 J   ALTER TABLE ONLY public.participants DROP CONSTRAINT "Participants_pkey";
       public            postgres    false    219            �           2606    16866    receipts Receipts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT "Receipts_pkey" PRIMARY KEY (receipt_id);
 B   ALTER TABLE ONLY public.receipts DROP CONSTRAINT "Receipts_pkey";
       public            postgres    false    223            �           2606    16799    users Users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public            postgres    false    215            �           2606    16900 $   friend_requests friend_requests_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_pkey PRIMARY KEY (request_id);
 N   ALTER TABLE ONLY public.friend_requests DROP CONSTRAINT friend_requests_pkey;
       public            postgres    false    227            �           2606    16883    friendships friendships_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (friendship_id);
 F   ALTER TABLE ONLY public.friendships DROP CONSTRAINT friendships_pkey;
       public            postgres    false    225            �           2606    16916    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    16914    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    215            �           2606    16850 &   messages Messages_conversation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "Messages_conversation_id_fkey" FOREIGN KEY (conversation_id) REFERENCES public.conversations(conversation_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.messages DROP CONSTRAINT "Messages_conversation_id_fkey";
       public          postgres    false    3217    217    221            �           2606    16855     messages Messages_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "Messages_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.messages DROP CONSTRAINT "Messages_sender_id_fkey";
       public          postgres    false    215    3211    221            �           2606    16836 .   participants Participants_conversation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participants
    ADD CONSTRAINT "Participants_conversation_id_fkey" FOREIGN KEY (conversation_id) REFERENCES public.conversations(conversation_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.participants DROP CONSTRAINT "Participants_conversation_id_fkey";
       public          postgres    false    217    219    3217            �           2606    16831 &   participants Participants_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participants
    ADD CONSTRAINT "Participants_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.participants DROP CONSTRAINT "Participants_user_id_fkey";
       public          postgres    false    215    219    3211            �           2606    16867 !   receipts Receipts_message_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT "Receipts_message_id_fkey" FOREIGN KEY (message_id) REFERENCES public.messages(message_id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.receipts DROP CONSTRAINT "Receipts_message_id_fkey";
       public          postgres    false    223    221    3221            �           2606    16872    receipts Receipts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT "Receipts_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.receipts DROP CONSTRAINT "Receipts_user_id_fkey";
       public          postgres    false    215    3211    223            �           2606    16906 0   friend_requests friend_requests_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.friend_requests DROP CONSTRAINT friend_requests_receiver_id_fkey;
       public          postgres    false    227    215    3211            �           2606    16901 .   friend_requests friend_requests_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.friend_requests DROP CONSTRAINT friend_requests_sender_id_fkey;
       public          postgres    false    215    227    3211            �           2606    16889 &   friendships friendships_friend_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_friend_id_fkey FOREIGN KEY (friend_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.friendships DROP CONSTRAINT friendships_friend_id_fkey;
       public          postgres    false    215    3211    225            �           2606    16884 $   friendships friendships_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.friendships DROP CONSTRAINT friendships_user_id_fkey;
       public          postgres    false    215    225    3211            7   K   x�]̱�0D�OA�bٗ��d����
!���;j1���)��� g��/�/�O[�-�op��<�E      A      x������ � �      ?   2   x�32�46�46�2� �@6��%XĜ�� H�D��R@#��W� 
�      ;   �  x�m��N�0�י�0�.(��w]A7 ���qI$&F��o_'�Hm�r���{�R�#��*�+���
Ё( K����Tv�����ɧ5����Z&����td�P����u`���,��v(�����i[ۯ"įaL��� N:��F��2��{~����rb-�ۍ���c��6AN*��s�T��S���B�i�^. Xx������x{����4�� ��I���Y��O�oO�0��?�4���z�	�ea�Ρ��!�S��%K��#nk����=��y�=h��ӕ�M�}.�����* >(��9��LS=���)��o��d�����6<�5K��d��
�V\��>�m@�4�:���C�{��?jT���\���s��/�6�I�I��?��u�c���f�1�꟱U�[�'Uވ$��p&�n���/��      9   l   x�u�1�0�Y~E�"�D������h�,A$���@��@��W:S��l0��3/��)����(x��|���@�mc}�'�M=G��`Y-�5�c����#*�      =     x�m�A�!��+��1��[���X��d�=#���m���0~ħ�Qf�!�<.4X�~R>9i����o:�}��C�X�5���(bG�.��#d�M	��d����+����Dy\�)�d�;}��ŵjVG�عJ$GǛ�JϽ�EI��"�S��d��R鋭O����K��ap#dw4�C>0��Rof�{K�Kρ	��d�����t�kl�L�"������)Ϣ�՜��5�.�6&�R�>��������}�ϣ�5)����_���͸��      5   �  x���IS�P���_��KovaTPVY��V	ӯ�V;jW�"�����s�s.� v��LB��}�����9lKy�sC��>�%��3�|zr}_M�x����u$�G���n]-t���Mw�5�/��q���X3�� �ס�C��֊Ⱖ�%q�����T/' ��R`,(hX{+��]q� Q�`��sBU�H�ы�b)9�ܳ-Z|ȱ�$�r�ͩG��k �ɢ��+��En��S(�~�o�ӥ�F��I2t�g�H�4Lh��cS��,b����찘����Q���d����>��q�k�ÚF`�j�,����h�a��V�ִqI�6�r͈vY9Ń�k�0��Qv*`h(!\��u&S̘��b��َ�zBp	=�2�A�⊒(���G7/l����0������z���t��(��+ƺ��@$p �x�pB�|�f3��F���V�c�w�|>ِ:���"��q���d��۲��~�9����;t��Eް8z�֓}0>�v��k��rF�rل�s�M��ʝWn��E�R1)C�-}���N�*�~�2B"�0�
+���R�V�J��
�Q��F��D5Q�׫$@|�p	�&MJj#w�J�.�C���vuژ[�XDK�~we9|�hN�1ܚ�/��2J'��WY�Jz���K���\rI���0~_b������7qe�g����7�S[     