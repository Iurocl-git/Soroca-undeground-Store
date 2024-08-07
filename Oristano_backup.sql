PGDMP  *    +                 |           Oristano    16.2    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    16590    Oristano    DATABASE     l   CREATE DATABASE "Oristano" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "Oristano";
                postgres    false            �            1259    16614    ads    TABLE     �   CREATE TABLE public.ads (
    id integer NOT NULL,
    title character varying(30) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    16613 
   ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.ads_id_seq;
       public          postgres    false    219            #           0    0 
   ads_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;
          public          postgres    false    218            �            1259    16599    products    TABLE     j  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    price numeric(10,2),
    description text,
    user_username character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    image_name character varying(40),
    genre character varying(30),
    rating numeric(4,2)
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16598    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    217            $           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    216            �            1259    16591    users    TABLE     �   CREATE TABLE public.users (
    username character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    family character varying(20) NOT NULL,
    email character varying(40) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ~           2604    16617    ads id    DEFAULT     `   ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);
 5   ALTER TABLE public.ads ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            |           2604    16602    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16614    ads 
   TABLE DATA           A   COPY public.ads (id, title, description, created_at) FROM stdin;
    public          postgres    false    219                    0    16599    products 
   TABLE DATA           v   COPY public.products (id, name, price, description, user_username, created_at, image_name, genre, rating) FROM stdin;
    public          postgres    false    217                    0    16591    users 
   TABLE DATA           H   COPY public.users (username, password, name, family, email) FROM stdin;
    public          postgres    false    215   �       %           0    0 
   ads_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.ads_id_seq', 4, true);
          public          postgres    false    218            &           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 48, true);
          public          postgres    false    216            �           2606    16622    ads ads_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    219            �           2606    16606    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    217            �           2606    16690    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    16597    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16607 $   products products_user_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_username_fkey FOREIGN KEY (user_username) REFERENCES public.users(username) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_user_username_fkey;
       public          postgres    false    215    217    3459               �  x�M�K��0���)�=����L�H#ЀĆ�ۮn$vd;���� n���~��]�뫯\gp�W��'%�'PxT���IR@��0��F"-����	@p|>�Ƀ����A�,�Q���'k��f�\�]�(��п�	�޺Q��i��=�&��0
v����)�@�S�)��=:&�8!�YS5]Q���������i��]W�uy�����'<�	��ȏ�=��ޚ����w�)��Ij8��( D�1y��PJ��CĹR���	���O�^�|��I������h6���]_������6���{C8�GgN��;K�,�r1�/R+���̷PЀl�Kf'5o3�)��Z²A����(�w<̞���d�g�u�+mi������~��;&���p����-�]��c�j2�`˅�hX(O}����[�ΎI?��,�!M(vqC�9���O̲�^�<I;����7��_�7E�]��u�j��o�e����	�         w  x����N�0���S�$J�ې�ABբ��e/n2�#\��Y�ӯӮX?�d�f<ߧ�ŵczq��i��� �M�4����@)��`�7�@v�CpD��8�� ]Df2FC�r^���B�R�e��
*�P����ZIU;��'���Ŭ�j�ݷ0���~�`tH�@�m��t��2k;@�y����#��n���T�?�;1O.y;�	E3��_1�����#���'��?�[g܆zm`���<Ҙ⏓[��B3��b���V�?����H�$Y��vpI� JT�4���Hf�v�i�0�q�Z�g�����kǴ����<���n,m�AH5�,1��aԖ�'�lQ��,���Ύ�m�wϛ��Ȳ�/~�6         b   x���/)J-�.�43�0����O���eyz�P�CqIiJj^�^iq�^Q>WPi1X���S~zJb�.X3X8	,PdZ�8��&f��%��r��qqq �&�     