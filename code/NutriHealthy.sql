PGDMP         	                 y            NutriHealthy    13.0    13.0     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16453    NutriHealthy    DATABASE     j   CREATE DATABASE "NutriHealthy" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE "NutriHealthy";
                postgres    false            ?            1259    16478    nourritures    TABLE        CREATE TABLE public.nourritures (
    id smallint NOT NULL,
    ingredient text,
    quantite integer,
    calories integer
);
    DROP TABLE public.nourritures;
       public         heap    postgres    false            ?            1259    16476    nourriture_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.nourriture_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.nourriture_id_seq;
       public          postgres    false    205            ?           0    0    nourriture_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.nourriture_id_seq OWNED BY public.nourritures.id;
          public          postgres    false    204            ?            1259    16467    sports    TABLE     t   CREATE TABLE public.sports (
    id integer NOT NULL,
    activite text,
    temps integer,
    calories integer
);
    DROP TABLE public.sports;
       public         heap    postgres    false            ?            1259    16465    sport_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.sport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sport_id_seq;
       public          postgres    false    203            ?           0    0    sport_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.sport_id_seq OWNED BY public.sports.id;
          public          postgres    false    202            ?            1259    16456    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    email text,
    password text,
    nourriture integer[] NOT NULL,
    sport integer[] NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16454    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            3           2604    16481    nourritures id    DEFAULT     o   ALTER TABLE ONLY public.nourritures ALTER COLUMN id SET DEFAULT nextval('public.nourriture_id_seq'::regclass);
 =   ALTER TABLE public.nourritures ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            2           2604    16470 	   sports id    DEFAULT     e   ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sport_id_seq'::regclass);
 8   ALTER TABLE public.sports ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            1           2604    16459    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            ?          0    16478    nourritures 
   TABLE DATA           I   COPY public.nourritures (id, ingredient, quantite, calories) FROM stdin;
    public          postgres    false    205   ?       ?          0    16467    sports 
   TABLE DATA           ?   COPY public.sports (id, activite, temps, calories) FROM stdin;
    public          postgres    false    203   1       ?          0    16456    users 
   TABLE DATA           G   COPY public.users (id, email, password, nourriture, sport) FROM stdin;
    public          postgres    false    201   ?       ?           0    0    nourriture_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.nourriture_id_seq', 3, true);
          public          postgres    false    204            ?           0    0    sport_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sport_id_seq', 5, true);
          public          postgres    false    202            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
          public          postgres    false    200            9           2606    16486    nourritures nourriture_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.nourritures
    ADD CONSTRAINT nourriture_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.nourritures DROP CONSTRAINT nourriture_pkey;
       public            postgres    false    205            7           2606    16475    sports sport_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sport_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sports DROP CONSTRAINT sport_pkey;
       public            postgres    false    203            5           2606    16464    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            ?   )   x?3?H,I-?440?446?2?Ȭ?J???̸b???? ???      ?   H   x?3??M,J?H?4?422?2?̅p?8M??9??K??A?@?	?k?ih??rz?'f?T?t?b???? O?e      ?   ?   x?5?1?0  g??Fi???P?D?F!.???4??s?w?@?6L???2???^?\?O??k??L??e,?n??iŤ|m*&:?u?D<???XA<?&p?3?	?z@??ڶ?
?
䓠,t??鼲?I???J=d??t?z2߽!?=T?r?3 ?9?3O     