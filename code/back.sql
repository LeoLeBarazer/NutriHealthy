PGDMP     	    '                 y            NutriHealthy    13.1    13.1     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16406    NutriHealthy    DATABASE     j   CREATE DATABASE "NutriHealthy" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE "NutriHealthy";
                postgres    false            ?            1259    16407    nourritures    TABLE        CREATE TABLE public.nourritures (
    id smallint NOT NULL,
    ingredient text,
    quantite integer,
    calories integer
);
    DROP TABLE public.nourritures;
       public         heap    postgres    false            ?            1259    16413    nourriture_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.nourriture_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.nourriture_id_seq;
       public          postgres    false    200            ?           0    0    nourriture_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.nourriture_id_seq OWNED BY public.nourritures.id;
          public          postgres    false    201            ?            1259    16415    sports    TABLE     t   CREATE TABLE public.sports (
    id integer NOT NULL,
    activite text,
    temps integer,
    calories integer
);
    DROP TABLE public.sports;
       public         heap    postgres    false            ?            1259    16421    sport_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.sport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sport_id_seq;
       public          postgres    false    202            ?           0    0    sport_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.sport_id_seq OWNED BY public.sports.id;
          public          postgres    false    203            ?            1259    16423    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    email text,
    password text,
    nourriture integer[] NOT NULL,
    sport integer[] NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16429    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    204            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    205            1           2604    16431    nourritures id    DEFAULT     o   ALTER TABLE ONLY public.nourritures ALTER COLUMN id SET DEFAULT nextval('public.nourriture_id_seq'::regclass);
 =   ALTER TABLE public.nourritures ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            2           2604    16432 	   sports id    DEFAULT     e   ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sport_id_seq'::regclass);
 8   ALTER TABLE public.sports ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            3           2604    16433    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            5           2606    16435    nourritures nourriture_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.nourritures
    ADD CONSTRAINT nourriture_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.nourritures DROP CONSTRAINT nourriture_pkey;
       public            postgres    false    200            7           2606    16437    sports sport_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sport_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sports DROP CONSTRAINT sport_pkey;
       public            postgres    false    202            9           2606    16439    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204           