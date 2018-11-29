--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.22
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_menu (
    id integer NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    title character varying(50) NOT NULL,
    icon character varying(50) NOT NULL,
    uri character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_menu OWNER TO postgres;

--
-- Name: admin_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_menu_id_seq OWNER TO postgres;

--
-- Name: admin_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_menu_id_seq OWNED BY public.admin_menu.id;


--
-- Name: admin_operation_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_operation_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    path character varying(255) NOT NULL,
    method character varying(10) NOT NULL,
    ip character varying(15) NOT NULL,
    input text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_operation_log OWNER TO postgres;

--
-- Name: admin_operation_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_operation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_operation_log_id_seq OWNER TO postgres;

--
-- Name: admin_operation_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_operation_log_id_seq OWNED BY public.admin_operation_log.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    http_method character varying(255),
    http_path text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_role_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_menu (
    role_id integer NOT NULL,
    menu_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_role_menu OWNER TO postgres;

--
-- Name: admin_role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_role_permissions OWNER TO postgres;

--
-- Name: admin_role_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_users (
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_role_users OWNER TO postgres;

--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_user_permissions (
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_user_permissions OWNER TO postgres;

--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    username character varying(190) NOT NULL,
    password character varying(60) NOT NULL,
    name character varying(255) NOT NULL,
    avatar character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: angles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.angles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    "position" character varying(255) NOT NULL,
    direction character varying(255) NOT NULL,
    up character varying(255) NOT NULL,
    is_public character varying(255) DEFAULT '1'::character varying NOT NULL,
    is_comment character varying(255) DEFAULT '1'::character varying NOT NULL,
    again_share character varying(255) DEFAULT '1'::character varying NOT NULL,
    is_followed character varying(255) DEFAULT '1'::character varying NOT NULL,
    comment_count integer,
    followed_count integer,
    share_count integer,
    view_count integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT angles_again_share_check CHECK (((again_share)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT angles_is_comment_check CHECK (((is_comment)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT angles_is_followed_check CHECK (((is_followed)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT angles_is_public_check CHECK (((is_public)::text = ANY ((ARRAY['1'::character varying, '2'::character varying, '3'::character varying])::text[])))
);


ALTER TABLE public.angles OWNER TO postgres;

--
-- Name: COLUMN angles.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.user_id IS '用户id';


--
-- Name: COLUMN angles.is_public; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.is_public IS '1是私有，2公有，3公开给某一类';


--
-- Name: COLUMN angles.is_comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.is_comment IS '1是不能评论，2可以评论';


--
-- Name: COLUMN angles.again_share; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.again_share IS '1是不能再次分享，2可以';


--
-- Name: COLUMN angles.is_followed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.is_followed IS '1是不能被关注，2可以';


--
-- Name: COLUMN angles.comment_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.comment_count IS '被评论的数量';


--
-- Name: COLUMN angles.followed_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.followed_count IS '被收藏的数量';


--
-- Name: COLUMN angles.share_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.share_count IS '被分享的数量';


--
-- Name: COLUMN angles.view_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.angles.view_count IS '被查看的数量';


--
-- Name: angles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.angles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.angles_id_seq OWNER TO postgres;

--
-- Name: angles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.angles_id_seq OWNED BY public.angles.id;


--
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buildings (
    id integer NOT NULL,
    geom public.geometry(Polygon,4326),
    name character varying,
    build_no character varying,
    real_estate_id character varying,
    build_bot_height double precision,
    build_top_height double precision,
    guid character varying(64),
    floor_sum integer,
    upfloor_sum integer,
    underfloor_sum integer,
    completion_date character varying,
    design_life character varying,
    construction_unit character varying,
    design_unit character varying,
    project_unit character varying,
    qllx character varying,
    qlxz character varying,
    qlxz1 character varying,
    qlxz2 character varying,
    yt character varying,
    yt1 character varying,
    yt2 character varying,
    jzmj double precision,
    supervision_unit character varying,
    unit integer,
    realestate_id integer,
    createtime character varying,
    updatetime character varying,
    discardtime character varying
);


ALTER TABLE public.buildings OWNER TO postgres;

--
-- Name: COLUMN buildings.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.id IS '自增编号';


--
-- Name: COLUMN buildings.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.geom IS '图形字段';


--
-- Name: COLUMN buildings.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.name IS '楼栋名称';


--
-- Name: COLUMN buildings.build_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.build_no IS '楼栋号';


--
-- Name: COLUMN buildings.build_bot_height; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.build_bot_height IS '楼底高';


--
-- Name: COLUMN buildings.build_top_height; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.build_top_height IS '楼顶高';


--
-- Name: COLUMN buildings.guid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.guid IS '唯一编码';


--
-- Name: COLUMN buildings.floor_sum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.floor_sum IS '建筑层数';


--
-- Name: COLUMN buildings.upfloor_sum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.upfloor_sum IS '地上层数';


--
-- Name: COLUMN buildings.underfloor_sum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.underfloor_sum IS '地下层数';


--
-- Name: COLUMN buildings.completion_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.completion_date IS '竣工日期';


--
-- Name: COLUMN buildings.design_life; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.design_life IS '设计使用年限';


--
-- Name: COLUMN buildings.construction_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.construction_unit IS '施工单位';


--
-- Name: COLUMN buildings.design_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.design_unit IS '设计单位';


--
-- Name: COLUMN buildings.project_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.project_unit IS '建设单位';


--
-- Name: COLUMN buildings.qllx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.qllx IS '权利类型';


--
-- Name: COLUMN buildings.qlxz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.qlxz IS '权利性质';


--
-- Name: COLUMN buildings.qlxz1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.qlxz1 IS '权利性质1';


--
-- Name: COLUMN buildings.qlxz2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.qlxz2 IS '权利性质2';


--
-- Name: COLUMN buildings.yt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.yt IS '用途';


--
-- Name: COLUMN buildings.yt1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.yt1 IS '用途1';


--
-- Name: COLUMN buildings.yt2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.yt2 IS '用途2';


--
-- Name: COLUMN buildings.jzmj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.jzmj IS '建筑面积';


--
-- Name: COLUMN buildings.supervision_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.supervision_unit IS '监理单位';


--
-- Name: COLUMN buildings.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.unit IS '单元数';


--
-- Name: COLUMN buildings.realestate_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.realestate_id IS '小区编号';


--
-- Name: COLUMN buildings.createtime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.createtime IS '创建时间';


--
-- Name: COLUMN buildings.updatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.updatetime IS '更新时间';


--
-- Name: COLUMN buildings.discardtime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.buildings.discardtime IS '废弃时间';


--
-- Name: buildPolygon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."buildPolygon_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."buildPolygon_id_seq" OWNER TO postgres;

--
-- Name: buildPolygon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."buildPolygon_id_seq" OWNED BY public.buildings.id;


--
-- Name: build_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.build_types (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.build_types OWNER TO postgres;

--
-- Name: build_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.build_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.build_types_id_seq OWNER TO postgres;

--
-- Name: build_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.build_types_id_seq OWNED BY public.build_types.id;


--
-- Name: builds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.builds (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    hierarchy text NOT NULL,
    build_type_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.builds OWNER TO postgres;

--
-- Name: builds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.builds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.builds_id_seq OWNER TO postgres;

--
-- Name: builds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.builds_id_seq OWNED BY public.builds.id;


--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    title character varying(255) NOT NULL,
    type character varying(255),
    description character varying(255),
    floor character varying(255),
    url character varying(255)
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: COLUMN business.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.business.title IS '商家名称';


--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    res_id integer,
    res_type character varying(255),
    from_u character varying(255),
    to_u character varying(255),
    parent_id integer DEFAULT 0 NOT NULL,
    content text NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    vote_up integer DEFAULT 0 NOT NULL,
    vote_down integer DEFAULT 0 NOT NULL,
    commented_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT comments_active_check CHECK (((active)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: COLUMN comments.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments.parent_id IS '多级分类父ID';


--
-- Name: COLUMN comments.active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments.active IS '0是未同意展示的,1是同意';


--
-- Name: COLUMN comments.commented_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments.commented_count IS '被回复数';


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT event_types_type_check CHECK (((type)::text = ANY ((ARRAY['-1'::character varying, '0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- Name: COLUMN event_types.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_types.type IS '-1过期0为处理１处理';


--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_types_id_seq OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    grid character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    "position" character varying(255) NOT NULL,
    event_type_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: household; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.household (
    id integer NOT NULL,
    bsm character varying(255),
    ywh character varying(255),
    qlbsm character varying(255),
    qlbm character varying(255),
    bdcdyh character varying(255),
    bdcqzh character varying(255),
    gyqk character varying(255),
    zl character varying(255),
    qllx character varying(255),
    qlxz character varying(255),
    qlxz1 character varying(255),
    qlxz2 character varying(255),
    yt character varying(255),
    yt1 character varying(255),
    yt2 character varying(255),
    mj character varying(255),
    mj1 character varying(255),
    mj2 character varying(255),
    syqx character varying(255),
    fj character varying(255),
    fzjc character varying(255),
    fzdq character varying(255),
    fznf character varying(255),
    fzbm character varying(255),
    fzxh character varying(255),
    fzgbh character varying(255),
    gxsj character varying(255),
    build_no character varying(255),
    floor_num character varying(255),
    room_num character varying(255),
    room_alias character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.household OWNER TO postgres;

--
-- Name: COLUMN household.bsm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.bsm IS '标识码';


--
-- Name: COLUMN household.ywh; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.ywh IS '业务号';


--
-- Name: COLUMN household.qlbsm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qlbsm IS '权利标识码';


--
-- Name: COLUMN household.qlbm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qlbm IS 'qlbm';


--
-- Name: COLUMN household.bdcdyh; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.bdcdyh IS '不动产单元号';


--
-- Name: COLUMN household.bdcqzh; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.bdcqzh IS '不动产权证号';


--
-- Name: COLUMN household.gyqk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.gyqk IS '共有情况';


--
-- Name: COLUMN household.zl; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.zl IS '坐落';


--
-- Name: COLUMN household.qllx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qllx IS '权利类型';


--
-- Name: COLUMN household.qlxz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qlxz IS '权利性质';


--
-- Name: COLUMN household.qlxz1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qlxz1 IS '权利性质1';


--
-- Name: COLUMN household.qlxz2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.qlxz2 IS '权利性质2';


--
-- Name: COLUMN household.yt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.yt IS '用途';


--
-- Name: COLUMN household.yt1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.yt1 IS '用途1';


--
-- Name: COLUMN household.yt2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.yt2 IS '用途2';


--
-- Name: COLUMN household.mj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.mj IS '面积';


--
-- Name: COLUMN household.mj1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.mj1 IS '面积1';


--
-- Name: COLUMN household.mj2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.mj2 IS '面积2';


--
-- Name: COLUMN household.syqx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.syqx IS '使用权限';


--
-- Name: COLUMN household.fj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.fj IS '附加';


--
-- Name: COLUMN household.fzjc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.fzjc IS '发证省';


--
-- Name: COLUMN household.fzdq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.fzdq IS '发证地区';


--
-- Name: COLUMN household.fznf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.fznf IS '发证年份';


--
-- Name: COLUMN household.fzbm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.fzbm IS '发证编码';


--
-- Name: COLUMN household.gxsj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.gxsj IS '更新时间';


--
-- Name: COLUMN household.build_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.build_no IS '楼栋号';


--
-- Name: COLUMN household.floor_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.floor_num IS '层';


--
-- Name: COLUMN household.room_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.room_num IS '室';


--
-- Name: COLUMN household.room_alias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household.room_alias IS '单元';


--
-- Name: household_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.household_maps (
    id integer NOT NULL,
    geom public.geometry(PolygonZ,4326),
    realestate_id integer,
    build_guid character varying,
    build_no character varying,
    room_no character varying,
    build_id integer
);


ALTER TABLE public.household_maps OWNER TO postgres;

--
-- Name: COLUMN household_maps.realestate_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household_maps.realestate_id IS '关联小区编号';


--
-- Name: COLUMN household_maps.build_guid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household_maps.build_guid IS '楼栋唯一编码';


--
-- Name: COLUMN household_maps.build_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household_maps.build_no IS '楼号';


--
-- Name: COLUMN household_maps.room_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household_maps.room_no IS '房间号';


--
-- Name: COLUMN household_maps.build_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.household_maps.build_id IS '楼栋自增编码';


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    layer character varying(255),
    style character varying(255),
    format character varying(255),
    tilematrixsetid character varying(255),
    description character varying(255),
    level character varying(255),
    visiblelevel character varying(255),
    type character varying(255),
    ellipsoid character varying(255),
    img character varying(255),
    maxlevel character varying(255),
    per integer DEFAULT 1 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: measures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measures (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    _id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.measures OWNER TO postgres;

--
-- Name: COLUMN measures.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.measures.title IS '标题';


--
-- Name: COLUMN measures._id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.measures._id IS 'ID 这个表示该标题的Dom ID';


--
-- Name: measures_bts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measures_bts (
    id integer NOT NULL,
    measures_id integer NOT NULL,
    name character varying(255) NOT NULL,
    img character varying(255),
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.measures_bts OWNER TO postgres;

--
-- Name: measures_bts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measures_bts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measures_bts_id_seq OWNER TO postgres;

--
-- Name: measures_bts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measures_bts_id_seq OWNED BY public.measures_bts.id;


--
-- Name: measures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measures_id_seq OWNER TO postgres;

--
-- Name: measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measures_id_seq OWNED BY public.measures.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: monomers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monomers (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    tileset_id character varying(255) NOT NULL,
    operator character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.monomers OWNER TO postgres;

--
-- Name: COLUMN monomers.table_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.monomers.table_name IS '表名';


--
-- Name: COLUMN monomers.tileset_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.monomers.tileset_id IS '场景ID';


--
-- Name: COLUMN monomers.operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.monomers.operator IS '操作者';


--
-- Name: monomers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monomers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monomers_id_seq OWNER TO postgres;

--
-- Name: monomers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monomers_id_seq OWNED BY public.monomers.id;


--
-- Name: new_household_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_household_maps (
    id integer NOT NULL,
    geom public.geometry(PolygonZ,4326),
    "Id" integer,
    estate_id character varying,
    build_id character varying,
    build_no character varying,
    room_no character varying
);


ALTER TABLE public.new_household_maps OWNER TO postgres;

--
-- Name: new_household_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_household_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_household_maps_id_seq OWNER TO postgres;

--
-- Name: new_household_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_household_maps_id_seq OWNED BY public.new_household_maps.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: pattern_dirs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_dirs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pattern_dirs OWNER TO postgres;

--
-- Name: pattern_dirs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pattern_dirs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pattern_dirs_id_seq OWNER TO postgres;

--
-- Name: pattern_dirs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pattern_dirs_id_seq OWNED BY public.pattern_dirs.id;


--
-- Name: patterns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patterns (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    size character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    orgin_type character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(2) DEFAULT '0'::character varying
);


ALTER TABLE public.patterns OWNER TO postgres;

--
-- Name: patterns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patterns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patterns_id_seq OWNER TO postgres;

--
-- Name: patterns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patterns_id_seq OWNED BY public.patterns.id;


--
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_role (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.permission_role OWNER TO postgres;

--
-- Name: permission_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_user (
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.permission_user OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255),
    description character varying(255),
    res_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: poi_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poi_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.poi_types OWNER TO postgres;

--
-- Name: poi_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poi_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poi_types_id_seq OWNER TO postgres;

--
-- Name: poi_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poi_types_id_seq OWNED BY public.poi_types.id;


--
-- Name: pois; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pois (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    lon character varying(255) NOT NULL,
    lat character varying(255) NOT NULL,
    alt character varying(255) NOT NULL,
    poi_type_id character varying(255) NOT NULL,
    "desc" character varying(255),
    link character varying(255),
    media character varying(255),
    is_public character varying(255) DEFAULT '1'::character varying NOT NULL,
    is_comment character varying(255) DEFAULT '1'::character varying NOT NULL,
    again_share character varying(255) DEFAULT '1'::character varying NOT NULL,
    is_followed character varying(255) DEFAULT '1'::character varying NOT NULL,
    comment_count integer,
    followed_count integer,
    share_count integer,
    view_count integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pois_again_share_check CHECK (((again_share)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT pois_is_comment_check CHECK (((is_comment)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT pois_is_followed_check CHECK (((is_followed)::text = ANY ((ARRAY['1'::character varying, '2'::character varying])::text[]))),
    CONSTRAINT pois_is_public_check CHECK (((is_public)::text = ANY ((ARRAY['1'::character varying, '2'::character varying, '3'::character varying])::text[])))
);


ALTER TABLE public.pois OWNER TO postgres;

--
-- Name: COLUMN pois.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.name IS '名字';


--
-- Name: COLUMN pois.lon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.lon IS '经度';


--
-- Name: COLUMN pois.lat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.lat IS '纬度';


--
-- Name: COLUMN pois.alt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.alt IS '高度';


--
-- Name: COLUMN pois.poi_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.poi_type_id IS '类型';


--
-- Name: COLUMN pois."desc"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois."desc" IS '描述';


--
-- Name: COLUMN pois.link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.link IS '链接';


--
-- Name: COLUMN pois.media; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.media IS '媒体,可以是多个';


--
-- Name: COLUMN pois.is_public; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.is_public IS '1是私有，2公有，3公开给某一类';


--
-- Name: COLUMN pois.is_comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.is_comment IS '1是不能评论，2可以评论';


--
-- Name: COLUMN pois.again_share; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.again_share IS '1是不能再次分享，2可以';


--
-- Name: COLUMN pois.is_followed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.is_followed IS '1是不能被关注，2可以';


--
-- Name: COLUMN pois.comment_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.comment_count IS '被评论的数量';


--
-- Name: COLUMN pois.followed_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.followed_count IS '被收藏的数量';


--
-- Name: COLUMN pois.share_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.share_count IS '被分享的数量';


--
-- Name: COLUMN pois.view_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pois.view_count IS '被查看的数量';


--
-- Name: pois_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pois_id_seq OWNER TO postgres;

--
-- Name: pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pois_id_seq OWNED BY public.pois.id;


--
-- Name: real_estate_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_maps (
    id integer NOT NULL,
    real_estate_id integer NOT NULL,
    build_name character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.real_estate_maps OWNER TO postgres;

--
-- Name: COLUMN real_estate_maps.real_estate_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estate_maps.real_estate_id IS '小区ID';


--
-- Name: COLUMN real_estate_maps.build_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estate_maps.build_name IS '楼栋名';


--
-- Name: COLUMN real_estate_maps.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estate_maps.content IS '楼栋的底图坐标';


--
-- Name: real_estate_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_maps_id_seq OWNER TO postgres;

--
-- Name: real_estate_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_maps_id_seq OWNED BY public.real_estate_maps.id;


--
-- Name: real_estates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estates (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    guid character varying(64),
    address character varying(255),
    map character varying(255),
    estate_company character varying(255),
    building_num character varying(255),
    parking_num character varying(255),
    greening_rate character varying(255),
    build_type character varying(255),
    year_limit character varying(255),
    average_price character varying(255),
    property_company character varying(255),
    build_time character varying(255),
    business_time character varying(255),
    comment character varying(1024),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    area_rate double precision
);


ALTER TABLE public.real_estates OWNER TO postgres;

--
-- Name: COLUMN real_estates.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.name IS '小区名称';


--
-- Name: COLUMN real_estates.street; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.street IS '所在街道';


--
-- Name: COLUMN real_estates.guid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.guid IS '小区编号';


--
-- Name: COLUMN real_estates.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.address IS '详细地址';


--
-- Name: COLUMN real_estates.map; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.map IS '小区图形';


--
-- Name: COLUMN real_estates.estate_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.estate_company IS '开发商';


--
-- Name: COLUMN real_estates.building_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.building_num IS '拥有的楼栋数';


--
-- Name: COLUMN real_estates.parking_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.parking_num IS '停车位';


--
-- Name: COLUMN real_estates.greening_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.greening_rate IS '绿化率';


--
-- Name: COLUMN real_estates.build_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.build_type IS '建筑类型/住宅,高层';


--
-- Name: COLUMN real_estates.year_limit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.year_limit IS '使用年限';


--
-- Name: COLUMN real_estates.average_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.average_price IS '均价';


--
-- Name: COLUMN real_estates.property_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.property_company IS '小区物业';


--
-- Name: COLUMN real_estates.build_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.build_time IS '小区建造时间';


--
-- Name: COLUMN real_estates.business_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.business_time IS '小区开始经营时间';


--
-- Name: COLUMN real_estates.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.comment IS '小区的描述';


--
-- Name: COLUMN real_estates.area_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.real_estates.area_rate IS '容积率';


--
-- Name: real_estates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estates_id_seq OWNER TO postgres;

--
-- Name: real_estates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estates_id_seq OWNED BY public.real_estates.id;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_user (
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.role_user OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255),
    description character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schemes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    model text,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    description character varying,
    status character(1) DEFAULT '0'::bpchar,
    _points text,
    points text
);


ALTER TABLE public.schemes OWNER TO postgres;

--
-- Name: schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schemes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schemes_id_seq OWNER TO postgres;

--
-- Name: schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schemes_id_seq OWNED BY public.schemes.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id integer,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: shui_shang_m_ds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shui_shang_m_ds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shui_shang_m_ds_id_seq OWNER TO postgres;

--
-- Name: shui_shang_m_ds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shui_shang_m_ds_id_seq OWNED BY public.household.id;


--
-- Name: shuishagnmingdu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shuishagnmingdu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shuishagnmingdu_id_seq OWNER TO postgres;

--
-- Name: shuishagnmingdu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shuishagnmingdu_id_seq OWNED BY public.household_maps.id;


--
-- Name: terrains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terrains (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    description character varying(255),
    watermask character varying(255),
    vertexnormals character varying(255),
    ellipsoid character varying(255),
    type character varying(255),
    img character varying(255),
    per integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.terrains OWNER TO postgres;

--
-- Name: terrains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terrains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terrains_id_seq OWNER TO postgres;

--
-- Name: terrains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terrains_id_seq OWNED BY public.terrains.id;


--
-- Name: tileset_build; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tileset_build (
    tileset_id integer NOT NULL,
    build_id integer NOT NULL
);


ALTER TABLE public.tileset_build OWNER TO postgres;

--
-- Name: tileset_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tileset_groups (
    id integer NOT NULL,
    name text NOT NULL,
    display_name text NOT NULL,
    per integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tileset_groups OWNER TO postgres;

--
-- Name: COLUMN tileset_groups.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tileset_groups.name IS '组名';


--
-- Name: COLUMN tileset_groups.display_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tileset_groups.display_name IS '别名';


--
-- Name: tileset_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tileset_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tileset_groups_id_seq OWNER TO postgres;

--
-- Name: tileset_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tileset_groups_id_seq OWNED BY public.tileset_groups.id;


--
-- Name: tilesets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tilesets (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    description character varying(255),
    icon character varying(255),
    img character varying(255),
    per integer DEFAULT 1 NOT NULL,
    group_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tilesets OWNER TO postgres;

--
-- Name: tilesets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tilesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tilesets_id_seq OWNER TO postgres;

--
-- Name: tilesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tilesets_id_seq OWNED BY public.tilesets.id;


--
-- Name: toolbar_bts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.toolbar_bts (
    id integer NOT NULL,
    toolbar_id integer NOT NULL,
    name character varying(255) NOT NULL,
    btn_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.toolbar_bts OWNER TO postgres;

--
-- Name: toolbar_bts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.toolbar_bts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.toolbar_bts_id_seq OWNER TO postgres;

--
-- Name: toolbar_bts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.toolbar_bts_id_seq OWNED BY public.toolbar_bts.id;


--
-- Name: toolbars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.toolbars (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    icon character varying(255),
    img character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.toolbars OWNER TO postgres;

--
-- Name: COLUMN toolbars.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.toolbars.type IS 'Toolbar类型';


--
-- Name: toolbars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.toolbars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.toolbars_id_seq OWNER TO postgres;

--
-- Name: toolbars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.toolbars_id_seq OWNED BY public.toolbars.id;


--
-- Name: user_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_files (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    file_size character varying(255),
    file_type character varying(255),
    "position" character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    origin character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.user_files OWNER TO postgres;

--
-- Name: COLUMN user_files."position"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_files."position" IS '增加position字段,我也不知道用来干嘛，就是需要';


--
-- Name: user_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_files_id_seq OWNER TO postgres;

--
-- Name: user_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_files_id_seq OWNED BY public.user_files.id;


--
-- Name: user_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_login (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ip character varying(255),
    location json,
    browser_name character varying(255),
    browser_version character varying(255),
    platform character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_login OWNER TO postgres;

--
-- Name: user_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_login_id_seq OWNER TO postgres;

--
-- Name: user_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_login_id_seq OWNED BY public.user_login.id;


--
-- Name: user_pois; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_pois (
    id integer NOT NULL,
    user_id integer NOT NULL,
    poi_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_pois OWNER TO postgres;

--
-- Name: user_pois_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_pois_id_seq OWNER TO postgres;

--
-- Name: user_pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_pois_id_seq OWNED BY public.user_pois.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    avatar character varying(255) DEFAULT 'images/default/avatar.jpg'::character varying NOT NULL,
    sex character varying(255) DEFAULT '2'::character varying NOT NULL,
    phone character varying(255),
    active character varying(255) DEFAULT '0'::character varying NOT NULL,
    api_token character varying(60) NOT NULL,
    angle_count integer DEFAULT 0 NOT NULL,
    poi_count integer DEFAULT 0 NOT NULL,
    share_count integer DEFAULT 0 NOT NULL,
    pic_count integer DEFAULT 0 NOT NULL,
    file_count integer DEFAULT 0 NOT NULL,
    following_count integer DEFAULT 0 NOT NULL,
    followed_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    comment_count integer DEFAULT 0 NOT NULL,
    login_count integer DEFAULT 0 NOT NULL,
    login_type character varying(255) DEFAULT 'name'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT users_active_check CHECK (((active)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[]))),
    CONSTRAINT users_sex_check CHECK (((sex)::text = ANY ((ARRAY['0'::character varying, '1'::character varying, '2'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.avatar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.avatar IS '用户的头像地址';


--
-- Name: COLUMN users.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.sex IS '0男1女,2未知或者保密';


--
-- Name: COLUMN users.active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.active IS '是否激活';


--
-- Name: COLUMN users.following_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.following_count IS '关注数';


--
-- Name: COLUMN users.followed_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.followed_count IS '被关注数';


--
-- Name: COLUMN users.like_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.like_count IS '用户标注为喜欢的东西';


--
-- Name: COLUMN users.comment_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.comment_count IS '评论数';


--
-- Name: COLUMN users.login_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.login_count IS '用户登录的次数';


--
-- Name: COLUMN users.login_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.login_type IS '登录的类型';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_menu ALTER COLUMN id SET DEFAULT nextval('public.admin_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_operation_log ALTER COLUMN id SET DEFAULT nextval('public.admin_operation_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angles ALTER COLUMN id SET DEFAULT nextval('public.angles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_types ALTER COLUMN id SET DEFAULT nextval('public.build_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings ALTER COLUMN id SET DEFAULT nextval('public."buildPolygon_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.builds ALTER COLUMN id SET DEFAULT nextval('public.builds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.household ALTER COLUMN id SET DEFAULT nextval('public.shui_shang_m_ds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.household_maps ALTER COLUMN id SET DEFAULT nextval('public.shuishagnmingdu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measures ALTER COLUMN id SET DEFAULT nextval('public.measures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measures_bts ALTER COLUMN id SET DEFAULT nextval('public.measures_bts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monomers ALTER COLUMN id SET DEFAULT nextval('public.monomers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_household_maps ALTER COLUMN id SET DEFAULT nextval('public.new_household_maps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_dirs ALTER COLUMN id SET DEFAULT nextval('public.pattern_dirs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patterns ALTER COLUMN id SET DEFAULT nextval('public.patterns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poi_types ALTER COLUMN id SET DEFAULT nextval('public.poi_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pois ALTER COLUMN id SET DEFAULT nextval('public.pois_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_maps ALTER COLUMN id SET DEFAULT nextval('public.real_estate_maps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estates ALTER COLUMN id SET DEFAULT nextval('public.real_estates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes ALTER COLUMN id SET DEFAULT nextval('public.schemes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terrains ALTER COLUMN id SET DEFAULT nextval('public.terrains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tileset_groups ALTER COLUMN id SET DEFAULT nextval('public.tileset_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tilesets ALTER COLUMN id SET DEFAULT nextval('public.tilesets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toolbar_bts ALTER COLUMN id SET DEFAULT nextval('public.toolbar_bts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toolbars ALTER COLUMN id SET DEFAULT nextval('public.toolbars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_files ALTER COLUMN id SET DEFAULT nextval('public.user_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login ALTER COLUMN id SET DEFAULT nextval('public.user_login_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_pois ALTER COLUMN id SET DEFAULT nextval('public.user_pois_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_menu (id, parent_id, "order", title, icon, uri, created_at, updated_at) FROM stdin;
9	0	6	用户数据管理	fa-align-center	\N	2018-10-25 10:53:23	2018-10-26 14:01:42
10	9	7	兴趣点管理	fa-youtube-square	\N	2018-10-25 10:54:03	2018-10-26 14:01:42
11	10	8	兴趣列表	fa-bars	/pois/index	2018-10-25 10:54:23	2018-10-26 14:01:42
12	10	9	兴趣点分类管理	fa-youtube	/pois/type	2018-10-25 10:55:41	2018-10-26 14:01:42
13	9	10	用户文件管理	fa-bars	/file_system	2018-10-25 10:56:31	2018-10-26 14:01:42
14	9	11	视角管理	fa-yelp	/angles	2018-10-25 10:56:46	2018-10-26 14:01:42
15	9	12	模型方案管理	fa-bars	\N	2018-10-25 10:57:56	2018-10-26 14:01:42
28	15	13	模型管理	fa-yc-square	/patterns	2018-10-26 13:45:30	2018-10-26 14:01:42
19	0	14	地图资源管理	fa-500px	\N	2018-10-25 11:06:27	2018-10-26 14:01:42
20	19	15	影像管理	fa-balance-scale	/resource/images	2018-10-25 11:07:13	2018-10-26 14:01:42
21	19	16	地形管理	fa-birthday-cake	/resource/terrains	2018-10-25 11:07:45	2018-10-26 14:01:42
22	19	17	倾斜场景管理	fa-archive	\N	2018-10-25 11:08:41	2018-10-26 14:01:42
23	22	18	倾斜场景	fa-calendar	/resource/tilesets	2018-10-25 11:09:18	2018-10-26 14:01:42
27	23	19	场景组	fa-bars	/resource/tileset-group	2018-10-26 13:14:08	2018-10-26 14:01:42
25	0	1	主页	fa-bars	\N	2018-10-25 11:12:41	2018-10-25 11:12:48
26	23	20	场景列表	fa-bars	/resource/tilesets	2018-10-26 13:12:23	2018-10-26 14:01:42
6	0	2	用户管理	fa-users	/users/index	2018-10-25 10:48:01	2018-10-25 11:12:48
7	0	3	角色管理	fa-user-secret	/users/role	2018-10-25 10:51:21	2018-10-25 11:12:48
24	22	21	场景对象化	fa-bitbucket-square	\N	2018-10-25 11:09:57	2018-10-26 14:01:42
29	0	4	权限中心	fa-yahoo	/users/permission	2018-10-26 14:01:27	2018-10-26 14:04:17
30	0	22	工具按钮	fa-bars	/toolbars	2018-10-26 14:33:56	2018-10-26 14:34:05
16	0	23	系统监听	fa-bars	\N	2018-10-25 10:58:20	2018-10-26 14:34:05
17	16	24	登录监听	fa-bookmark	/login-info	2018-10-25 11:00:51	2018-10-26 14:34:05
18	16	25	操作日志	fa-asterisk	/auth/logs	2018-10-25 11:02:29	2018-10-26 14:34:05
1	0	26	后台设置	fa-tasks	\N	\N	2018-10-26 14:34:05
2	1	28	后台用户	fa-tasks	auth/users	\N	2018-10-27 11:25:43
3	1	29	后台角色	fa-tasks	auth/roles	\N	2018-10-27 11:25:43
4	1	30	后台权限	fa-tasks	auth/permissions	\N	2018-10-27 11:25:43
5	1	31	后台菜单	fa-tasks	auth/menu	\N	2018-10-27 11:25:43
31	1	27	默认配置	fa-bars	/web-config	2018-10-27 11:25:28	2018-10-27 11:26:14
8	0	5	用户配置	fa-android	/settings	2018-10-25 10:51:52	2018-10-26 14:01:42
\.


--
-- Name: admin_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_menu_id_seq', 32, true);


--
-- Data for Name: admin_operation_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_operation_log (id, user_id, path, method, ip, input, created_at, updated_at) FROM stdin;
1	2	PopCity/auth/logs	GET	192.168.3.22	[]	2018-10-25 11:02:53	2018-10-25 11:02:53
2	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:02:57	2018-10-25 11:02:57
3	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:02:59	2018-10-25 11:02:59
4	2	PopCity/auth/logs	GET	192.168.3.22	[]	2018-10-25 11:04:04	2018-10-25 11:04:04
5	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:06	2018-10-25 11:04:06
6	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:07	2018-10-25 11:04:07
7	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:08	2018-10-25 11:04:08
8	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:08	2018-10-25 11:04:08
9	2	PopCity/setUserPicMaxUpload	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","num":"2048"}	2018-10-25 11:04:14	2018-10-25 11:04:14
10	2	PopCity/setUserFileMaxUpload	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","num":"2085"}	2018-10-25 11:04:22	2018-10-25 11:04:22
11	2	PopCity/setUserLoginMethon	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","field":"name"}	2018-10-25 11:04:24	2018-10-25 11:04:24
12	2	PopCity/setUserLoginMethon	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","field":"email"}	2018-10-25 11:04:26	2018-10-25 11:04:26
13	2	PopCity/setUserCacheData	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","field":"dataCache"}	2018-10-25 11:04:28	2018-10-25 11:04:28
14	2	PopCity/auth/users	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:31	2018-10-25 11:04:31
15	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:04:37	2018-10-25 11:04:37
16	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:28	2018-10-25 11:05:28
17	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:46	2018-10-25 11:05:46
18	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:48	2018-10-25 11:05:48
19	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:50	2018-10-25 11:05:50
20	2	PopCity/auth/users	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:53	2018-10-25 11:05:53
21	2	PopCity/auth/roles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:53	2018-10-25 11:05:53
22	2	PopCity/auth/permissions	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:55	2018-10-25 11:05:55
23	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:05:57	2018-10-25 11:05:57
24	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"0","title":"\\u5730\\u56fe\\u8d44\\u6e90\\u7ba1\\u7406","icon":"fa-500px","uri":null,"roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:06:27	2018-10-25 11:06:27
25	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:06:27	2018-10-25 11:06:27
26	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"19","title":"\\u5f71\\u50cf\\u7ba1\\u7406","icon":"fa-balance-scale","uri":"\\/resource\\/images","roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:07:13	2018-10-25 11:07:13
27	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:07:13	2018-10-25 11:07:13
28	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"20","title":"\\u5730\\u5f62\\u7ba1\\u7406","icon":"fa-birthday-cake","uri":"\\/resource\\/terrains","roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:07:45	2018-10-25 11:07:45
29	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:07:45	2018-10-25 11:07:45
30	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","_order":"[{\\"id\\":6},{\\"id\\":7},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15}]},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21}]}]"}	2018-10-25 11:08:04	2018-10-25 11:08:04
31	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:08:04	2018-10-25 11:08:04
32	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"19","title":"\\u503e\\u659c\\u573a\\u666f\\u7ba1\\u7406","icon":"fa-archive","uri":null,"roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:08:41	2018-10-25 11:08:41
33	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:08:41	2018-10-25 11:08:41
34	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"22","title":"\\u503e\\u659c\\u6570\\u636e","icon":"fa-calendar","uri":"\\/resource\\/tilesets","roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:09:18	2018-10-25 11:09:18
35	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:09:18	2018-10-25 11:09:18
36	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"22","title":"\\u573a\\u666f\\u5bf9\\u8c61\\u5316","icon":"fa-bitbucket-square","uri":null,"roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:09:57	2018-10-25 11:09:57
37	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:09:57	2018-10-25 11:09:57
38	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","_order":"[{\\"id\\":6},{\\"id\\":7},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":24},{\\"id\\":23}]}]},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]"}	2018-10-25 11:10:07	2018-10-25 11:10:07
39	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:10:08	2018-10-25 11:10:08
40	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:10:09	2018-10-25 11:10:09
41	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:09	2018-10-25 11:12:09
42	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:10	2018-10-25 11:12:10
43	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:13	2018-10-25 11:12:13
44	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:16	2018-10-25 11:12:16
45	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:17	2018-10-25 11:12:17
46	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:20	2018-10-25 11:12:20
47	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:25	2018-10-25 11:12:25
48	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:31	2018-10-25 11:12:31
49	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"0","title":"\\u4e3b\\u9875","icon":"fa-bars","uri":null,"roles":[null],"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH"}	2018-10-25 11:12:41	2018-10-25 11:12:41
50	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:12:41	2018-10-25 11:12:41
115	2	PopCity/auth/menu/23	PUT	192.168.3.22	{"parent_id":"22","title":"\\u503e\\u659c\\u573a\\u666f","icon":"fa-calendar","uri":"\\/resource\\/tilesets","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 09:21:15	2018-10-26 09:21:15
116	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 09:21:15	2018-10-26 09:21:15
51	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"kptOa9MqJ39cRI25NieKf1ql1B1ARx9djIAbEfNH","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":24},{\\"id\\":23}]}]},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]"}	2018-10-25 11:12:48	2018-10-25 11:12:48
52	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:48	2018-10-25 11:12:48
53	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-25 11:12:49	2018-10-25 11:12:49
54	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:12:50	2018-10-25 11:12:50
55	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:13:02	2018-10-25 11:13:02
56	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:13:53	2018-10-25 11:13:53
57	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:14:00	2018-10-25 11:14:00
58	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:14:06	2018-10-25 11:14:06
59	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:14:43	2018-10-25 11:14:43
60	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:15:02	2018-10-25 11:15:02
61	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:15:58	2018-10-25 11:15:58
62	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:16:00	2018-10-25 11:16:00
63	2	PopCity	GET	192.168.3.22	[]	2018-10-25 11:16:04	2018-10-25 11:16:04
64	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:16:49	2018-10-25 11:16:49
65	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:16:50	2018-10-25 11:16:50
66	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-25 11:17:03	2018-10-25 11:17:03
67	2	PopCity	GET	192.168.3.22	[]	2018-10-25 12:23:44	2018-10-25 12:23:44
68	2	PopCity	GET	192.168.3.22	[]	2018-10-26 09:10:09	2018-10-26 09:10:09
69	2	PopCity/auth/users	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:24	2018-10-26 09:10:24
70	2	PopCity/auth/roles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:26	2018-10-26 09:10:26
71	2	PopCity/auth/permissions	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:28	2018-10-26 09:10:28
72	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:31	2018-10-26 09:10:31
73	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:34	2018-10-26 09:10:34
74	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:10:35	2018-10-26 09:10:35
75	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container","page":"2"}	2018-10-26 09:10:42	2018-10-26 09:10:42
76	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:11:03	2018-10-26 09:11:03
77	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:11:05	2018-10-26 09:11:05
78	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:11:07	2018-10-26 09:11:07
79	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:13:50	2018-10-26 09:13:50
80	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 09:13:51	2018-10-26 09:13:51
81	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:13:56	2018-10-26 09:13:56
82	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23},{\\"id\\":24}]}]},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]"}	2018-10-26 09:14:02	2018-10-26 09:14:02
83	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:14:02	2018-10-26 09:14:02
84	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:14:10	2018-10-26 09:14:10
85	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:14:12	2018-10-26 09:14:12
86	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 09:14:12	2018-10-26 09:14:12
87	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:15:34	2018-10-26 09:15:34
88	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:17:41	2018-10-26 09:17:41
89	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:17:42	2018-10-26 09:17:42
90	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:15	2018-10-26 09:18:15
91	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:16	2018-10-26 09:18:16
92	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:20	2018-10-26 09:18:20
93	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:22	2018-10-26 09:18:22
94	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:25	2018-10-26 09:18:25
95	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:26	2018-10-26 09:18:26
96	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:28	2018-10-26 09:18:28
97	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:18:29	2018-10-26 09:18:29
98	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:02	2018-10-26 09:19:02
99	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:23	2018-10-26 09:19:23
100	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:34	2018-10-26 09:19:34
101	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:35	2018-10-26 09:19:35
102	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 09:19:35	2018-10-26 09:19:35
103	2	PopCity/resource/tilesets/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:39	2018-10-26 09:19:39
104	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:49	2018-10-26 09:19:49
105	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:50	2018-10-26 09:19:50
106	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:19:54	2018-10-26 09:19:54
107	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:08	2018-10-26 09:20:08
108	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:10	2018-10-26 09:20:10
109	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:11	2018-10-26 09:20:11
110	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:12	2018-10-26 09:20:12
111	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:54	2018-10-26 09:20:54
112	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 09:20:55	2018-10-26 09:20:55
113	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:20:58	2018-10-26 09:20:58
114	2	PopCity/auth/menu/23/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:09	2018-10-26 09:21:09
117	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 09:21:19	2018-10-26 09:21:19
118	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:28	2018-10-26 09:21:28
119	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 09:21:28	2018-10-26 09:21:28
120	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:32	2018-10-26 09:21:32
121	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:33	2018-10-26 09:21:33
122	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:33	2018-10-26 09:21:33
123	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:21:34	2018-10-26 09:21:34
124	2	PopCity	GET	192.168.3.22	[]	2018-10-26 09:41:16	2018-10-26 09:41:16
125	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:41:18	2018-10-26 09:41:18
126	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:41:19	2018-10-26 09:41:19
127	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:41:19	2018-10-26 09:41:19
128	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:41:20	2018-10-26 09:41:20
129	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 09:41:21	2018-10-26 09:41:21
130	2	PopCity/settings	GET	192.168.3.22	[]	2018-10-26 10:22:22	2018-10-26 10:22:22
131	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:22:24	2018-10-26 10:22:24
132	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:22:25	2018-10-26 10:22:25
133	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:22:26	2018-10-26 10:22:26
134	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:22:29	2018-10-26 10:22:29
135	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:22:30	2018-10-26 10:22:30
136	2	PopCity/pois/type	GET	192.168.3.22	[]	2018-10-26 10:56:47	2018-10-26 10:56:47
137	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 10:56:51	2018-10-26 10:56:51
138	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 10:57:12	2018-10-26 10:57:12
139	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 10:57:58	2018-10-26 10:57:58
140	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 10:58:10	2018-10-26 10:58:10
141	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:58:30	2018-10-26 10:58:30
142	2	PopCity/auth/menu/14/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:59:42	2018-10-26 10:59:42
143	2	PopCity/auth/menu/14	PUT	192.168.3.22	{"parent_id":"9","title":"\\u89c6\\u89d2\\u7ba1\\u7406","icon":"fa-bars","uri":"\\/angles","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 10:59:49	2018-10-26 10:59:49
144	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 10:59:49	2018-10-26 10:59:49
145	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 10:59:52	2018-10-26 10:59:52
146	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 10:59:57	2018-10-26 10:59:57
147	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:00:36	2018-10-26 11:00:36
148	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:35:56	2018-10-26 11:35:56
149	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:36:19	2018-10-26 11:36:19
150	2	PopCity/angles/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:50:24	2018-10-26 11:50:24
151	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:50:24	2018-10-26 11:50:24
152	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:50:39	2018-10-26 11:50:39
153	2	PopCity/angles/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:50:41	2018-10-26 11:50:41
154	2	PopCity/angles/create	GET	192.168.3.22	[]	2018-10-26 11:50:41	2018-10-26 11:50:41
155	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:51:06	2018-10-26 11:51:06
156	2	PopCity/angles/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:51:08	2018-10-26 11:51:08
157	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:51:11	2018-10-26 11:51:11
158	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 11:53:39	2018-10-26 11:53:39
159	2	PopCity/angles/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:53:41	2018-10-26 11:53:41
160	2	PopCity/angles/create	GET	192.168.3.22	[]	2018-10-26 11:53:48	2018-10-26 11:53:48
161	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:53:59	2018-10-26 11:53:59
162	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:54:01	2018-10-26 11:54:01
163	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:54:01	2018-10-26 11:54:01
164	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 11:54:03	2018-10-26 11:54:03
165	2	PopCity/angles	GET	192.168.3.22	[]	2018-10-26 12:35:14	2018-10-26 12:35:14
166	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:42:21	2018-10-26 12:42:21
167	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:44:23	2018-10-26 12:44:23
168	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:44:24	2018-10-26 12:44:24
169	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:11	2018-10-26 12:49:11
170	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:13	2018-10-26 12:49:13
171	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:15	2018-10-26 12:49:15
172	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:18	2018-10-26 12:49:18
173	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:19	2018-10-26 12:49:19
174	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:22	2018-10-26 12:49:22
175	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:49:22	2018-10-26 12:49:22
176	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:24	2018-10-26 12:49:24
177	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:49:25	2018-10-26 12:49:25
178	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:49:25	2018-10-26 12:49:25
179	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:52:42	2018-10-26 12:52:42
180	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:52:43	2018-10-26 12:52:43
181	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:52:44	2018-10-26 12:52:44
182	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:52:45	2018-10-26 12:52:45
183	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:54:03	2018-10-26 12:54:03
184	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:54:04	2018-10-26 12:54:04
185	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:54:06	2018-10-26 12:54:06
186	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:54:06	2018-10-26 12:54:06
187	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:54:07	2018-10-26 12:54:07
188	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:54:09	2018-10-26 12:54:09
189	2	PopCity/resource/chanegImageSort	PUT	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","id":"56","num":"8"}	2018-10-26 12:54:12	2018-10-26 12:54:12
190	2	PopCity/resource/images	GET	192.168.3.22	[]	2018-10-26 12:54:14	2018-10-26 12:54:14
191	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:59:02	2018-10-26 12:59:02
192	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:59:02	2018-10-26 12:59:02
193	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:59:29	2018-10-26 12:59:29
194	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:59:30	2018-10-26 12:59:30
195	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 12:59:30	2018-10-26 12:59:30
196	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:59:38	2018-10-26 12:59:38
197	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 12:59:40	2018-10-26 12:59:40
198	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:00:07	2018-10-26 13:00:07
199	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:00:22	2018-10-26 13:00:22
200	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:00:26	2018-10-26 13:00:26
201	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:01:02	2018-10-26 13:01:02
202	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:03:34	2018-10-26 13:03:34
203	2	PopCity	GET	192.168.3.22	[]	2018-10-26 13:03:35	2018-10-26 13:03:35
204	2	PopCity	GET	192.168.3.22	[]	2018-10-26 13:06:27	2018-10-26 13:06:27
205	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:30	2018-10-26 13:06:30
206	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:32	2018-10-26 13:06:32
207	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:33	2018-10-26 13:06:33
208	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:36	2018-10-26 13:06:36
209	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:36	2018-10-26 13:06:36
210	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:39	2018-10-26 13:06:39
211	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:06:39	2018-10-26 13:06:39
212	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:09:44	2018-10-26 13:09:44
213	2	PopCity/users/index/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:09:45	2018-10-26 13:09:45
214	2	PopCity/users/index	POST	192.168.3.22	{"name":"huyouheng","email":"huyouheng@popsmart.cn","phone":null,"password":"123456","role":[null],"permission":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/users\\/index"}	2018-10-26 13:10:10	2018-10-26 13:10:10
215	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:10:10	2018-10-26 13:10:10
216	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:10:18	2018-10-26 13:10:18
217	2	PopCity/users/index/1/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:10:23	2018-10-26 13:10:23
218	2	PopCity/users/index/1	PUT	192.168.3.22	{"name":"huyouheng","email":"huyouheng@popsmart.cn","phone":null,"password":null,"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/users\\/index"}	2018-10-26 13:10:32	2018-10-26 13:10:32
219	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:10:32	2018-10-26 13:10:32
220	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 13:10:33	2018-10-26 13:10:33
221	2	PopCity/showUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:11:32	2018-10-26 13:11:32
222	2	PopCity/addUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:11:33	2018-10-26 13:11:33
223	2	PopCity/showUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:11:41	2018-10-26 13:11:41
224	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:11:50	2018-10-26 13:11:50
225	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:11:50	2018-10-26 13:11:50
226	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:11:56	2018-10-26 13:11:56
227	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"23","title":"\\u573a\\u666f\\u5217\\u8868","icon":"fa-bars","uri":"\\/resource\\/tilesets","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 13:12:23	2018-10-26 13:12:23
228	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:12:23	2018-10-26 13:12:23
229	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:12:29	2018-10-26 13:12:29
230	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:12:31	2018-10-26 13:12:31
231	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:12:36	2018-10-26 13:12:36
232	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:12:39	2018-10-26 13:12:39
233	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:12:39	2018-10-26 13:12:39
234	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:12:52	2018-10-26 13:12:52
235	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:13:24	2018-10-26 13:13:24
236	2	PopCity/resource/tileset-group	GET	192.168.3.22	[]	2018-10-26 13:14:00	2018-10-26 13:14:00
237	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"23","title":"\\u573a\\u666f\\u7ec4","icon":"fa-bars","uri":"\\/resource\\/tileset-group","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 13:14:08	2018-10-26 13:14:08
238	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:14:09	2018-10-26 13:14:09
239	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:14:11	2018-10-26 13:14:11
240	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:14:16	2018-10-26 13:14:16
241	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:14:16	2018-10-26 13:14:16
242	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:14:17	2018-10-26 13:14:17
243	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:14:22	2018-10-26 13:14:22
244	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:14:22	2018-10-26 13:14:22
245	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","name":"\\u4e0a\\u865e","id":"13","select":"71"}	2018-10-26 13:14:34	2018-10-26 13:14:34
246	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:14:35	2018-10-26 13:14:35
247	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:14:35	2018-10-26 13:14:35
248	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:14:38	2018-10-26 13:14:38
249	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:16:33	2018-10-26 13:16:33
250	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:17:33	2018-10-26 13:17:33
251	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:17:35	2018-10-26 13:17:35
252	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:42	2018-10-26 13:18:42
253	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:43	2018-10-26 13:18:43
254	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:43	2018-10-26 13:18:43
255	2	PopCity/showUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:45	2018-10-26 13:18:45
256	2	PopCity/addUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:47	2018-10-26 13:18:47
257	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:50	2018-10-26 13:18:50
258	2	PopCity/users/role/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:18:51	2018-10-26 13:18:51
259	2	PopCity/users/role	POST	192.168.3.22	{"name":"test","display_name":"\\u6d4b\\u8bd5","extra":[null],"description":null,"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/users\\/role"}	2018-10-26 13:19:09	2018-10-26 13:19:09
260	2	PopCity/users/role	GET	192.168.3.22	[]	2018-10-26 13:19:09	2018-10-26 13:19:09
261	2	PopCity/users/role/1/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:19:13	2018-10-26 13:19:13
262	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:19:15	2018-10-26 13:19:15
263	2	PopCity/showRolePer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:19:18	2018-10-26 13:19:18
264	2	PopCity/addRolePer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:19:20	2018-10-26 13:19:20
265	2	PopCity/storeRolePer/1	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","pers":["156","157","160","161","216","218","225","226","227","228","229","230","231","233","234","235","236","237","251","253","261","273"]}	2018-10-26 13:20:02	2018-10-26 13:20:02
266	2	PopCity/showRolePer/1	GET	192.168.3.22	[]	2018-10-26 13:20:02	2018-10-26 13:20:02
267	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:19	2018-10-26 13:20:19
268	2	PopCity/showRolePer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:20	2018-10-26 13:20:20
269	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:21	2018-10-26 13:20:21
270	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:24	2018-10-26 13:20:24
271	2	PopCity/showUserRole/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:26	2018-10-26 13:20:26
272	2	PopCity/addUserRole/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:27	2018-10-26 13:20:27
273	2	PopCity/storeUserRole/1	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","roles":["1"]}	2018-10-26 13:20:30	2018-10-26 13:20:30
274	2	PopCity/showUserRole/1	GET	192.168.3.22	[]	2018-10-26 13:20:30	2018-10-26 13:20:30
275	2	PopCity/showRolePer/1	GET	192.168.3.22	{"_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/showUserRole\\/1","_pjax":"#pjax-container"}	2018-10-26 13:20:31	2018-10-26 13:20:31
276	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:20:34	2018-10-26 13:20:34
277	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:09	2018-10-26 13:23:09
278	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:11	2018-10-26 13:23:11
279	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:12	2018-10-26 13:23:12
280	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:18	2018-10-26 13:23:18
281	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:23:19	2018-10-26 13:23:19
282	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:23:20	2018-10-26 13:23:20
283	2	PopCity/auth/menu/11/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:38	2018-10-26 13:23:38
284	2	PopCity/auth/menu/11	PUT	192.168.3.22	{"parent_id":"10","title":"\\u5174\\u8da3\\u5217\\u8868","icon":"fa-bars","uri":"\\/pois\\/index","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:23:48	2018-10-26 13:23:48
285	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:23:48	2018-10-26 13:23:48
286	2	PopCity/auth/menu/10/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:23:53	2018-10-26 13:23:53
287	2	PopCity/auth/menu/10	PUT	192.168.3.22	{"parent_id":"9","title":"\\u5174\\u8da3\\u70b9\\u7ba1\\u7406","icon":"fa-youtube-square","uri":null,"roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:24:00	2018-10-26 13:24:00
288	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:24:00	2018-10-26 13:24:00
289	2	PopCity/auth/menu/12/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:09	2018-10-26 13:24:09
290	2	PopCity/auth/menu/12	PUT	192.168.3.22	{"parent_id":"10","title":"\\u5174\\u8da3\\u70b9\\u5206\\u7c7b\\u7ba1\\u7406","icon":"fa-youtube","uri":"\\/pois\\/type","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:24:17	2018-10-26 13:24:17
291	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:24:17	2018-10-26 13:24:17
292	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:38	2018-10-26 13:24:38
293	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:39	2018-10-26 13:24:39
294	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:43	2018-10-26 13:24:43
295	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:24:43	2018-10-26 13:24:43
296	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:44	2018-10-26 13:24:44
297	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:45	2018-10-26 13:24:45
298	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:47	2018-10-26 13:24:47
299	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:47	2018-10-26 13:24:47
300	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:24:58	2018-10-26 13:24:58
301	2	PopCity/pois/index	GET	192.168.3.22	[]	2018-10-26 13:25:03	2018-10-26 13:25:03
302	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:25:06	2018-10-26 13:25:06
303	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:25:43	2018-10-26 13:25:43
304	2	PopCity/pois/index	GET	192.168.3.22	[]	2018-10-26 13:26:44	2018-10-26 13:26:44
305	2	PopCity/pois/index	GET	192.168.3.22	{"page":"2","_pjax":"#pjax-container"}	2018-10-26 13:26:48	2018-10-26 13:26:48
306	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container","page":"1"}	2018-10-26 13:26:59	2018-10-26 13:26:59
307	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:02	2018-10-26 13:27:02
308	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:03	2018-10-26 13:27:03
309	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:10	2018-10-26 13:27:10
310	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:15	2018-10-26 13:27:15
311	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:16	2018-10-26 13:27:16
312	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:27:20	2018-10-26 13:27:20
313	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:23	2018-10-26 13:31:23
314	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:24	2018-10-26 13:31:24
315	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:25	2018-10-26 13:31:25
316	2	PopCity/resource/images	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:26	2018-10-26 13:31:26
317	2	PopCity/resource/terrains	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:27	2018-10-26 13:31:27
318	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:30	2018-10-26 13:31:30
319	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 13:31:30	2018-10-26 13:31:30
320	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:31	2018-10-26 13:31:31
321	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:41	2018-10-26 13:31:41
322	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:49	2018-10-26 13:31:49
323	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:53	2018-10-26 13:31:53
324	2	PopCity/showRolePer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:31:55	2018-10-26 13:31:55
325	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:32:00	2018-10-26 13:32:00
326	2	PopCity/pois/type	GET	192.168.3.22	[]	2018-10-26 13:32:07	2018-10-26 13:32:07
327	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:32:12	2018-10-26 13:32:12
328	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:32:13	2018-10-26 13:32:13
329	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:32:15	2018-10-26 13:32:15
330	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:32:48	2018-10-26 13:32:48
331	2	PopCity	GET	192.168.3.22	[]	2018-10-26 13:35:57	2018-10-26 13:35:57
332	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:36:00	2018-10-26 13:36:00
333	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:36:12	2018-10-26 13:36:12
334	2	PopCity/auth/menu/13/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:36:17	2018-10-26 13:36:17
335	2	PopCity/auth/menu/13	PUT	192.168.3.22	{"parent_id":"9","title":"\\u7528\\u6237\\u6587\\u4ef6\\u7ba1\\u7406","icon":"fa-bars","uri":"\\/file--system","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:36:27	2018-10-26 13:36:27
336	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:36:27	2018-10-26 13:36:27
337	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:36:29	2018-10-26 13:36:29
338	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:36:30	2018-10-26 13:36:30
339	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:36:34	2018-10-26 13:36:34
340	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:37:11	2018-10-26 13:37:11
341	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:37:22	2018-10-26 13:37:22
342	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:39:06	2018-10-26 13:39:06
343	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:39:08	2018-10-26 13:39:08
344	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:39:11	2018-10-26 13:39:11
345	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:39:39	2018-10-26 13:39:39
346	2	PopCity/users/role	GET	192.168.3.22	[]	2018-10-26 13:39:55	2018-10-26 13:39:55
347	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:40:03	2018-10-26 13:40:03
348	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:41:17	2018-10-26 13:41:17
349	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:41:27	2018-10-26 13:41:27
350	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:41:32	2018-10-26 13:41:32
351	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:05	2018-10-26 13:43:05
352	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:06	2018-10-26 13:43:06
353	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:07	2018-10-26 13:43:07
354	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:07	2018-10-26 13:43:07
355	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:08	2018-10-26 13:43:08
356	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:11	2018-10-26 13:43:11
357	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:11	2018-10-26 13:43:11
358	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:12	2018-10-26 13:43:12
359	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:13	2018-10-26 13:43:13
360	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:14	2018-10-26 13:43:14
361	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:15	2018-10-26 13:43:15
362	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:16	2018-10-26 13:43:16
363	2	PopCity/angles	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:17	2018-10-26 13:43:17
364	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:43:59	2018-10-26 13:43:59
365	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:44:07	2018-10-26 13:44:07
366	2	PopCity/auth/menu/14/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:44:13	2018-10-26 13:44:13
367	2	PopCity/auth/menu/14	PUT	192.168.3.22	{"parent_id":"9","title":"\\u89c6\\u89d2\\u7ba1\\u7406","icon":"fa-yelp","uri":"\\/angles","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:44:19	2018-10-26 13:44:19
368	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:44:19	2018-10-26 13:44:19
369	2	PopCity/file--system	GET	192.168.3.22	[]	2018-10-26 13:44:22	2018-10-26 13:44:22
370	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:44:30	2018-10-26 13:44:30
371	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"15","title":"\\u6a21\\u578b\\u7ba1\\u7406","icon":"fa-yc-square","uri":"\\/patterns","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 13:45:30	2018-10-26 13:45:30
372	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:45:30	2018-10-26 13:45:30
373	2	PopCity	GET	192.168.3.22	[]	2018-10-26 13:45:31	2018-10-26 13:45:31
374	2	PopCity/patterns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:45:45	2018-10-26 13:45:45
375	2	PopCity/patterns	GET	192.168.3.22	[]	2018-10-26 13:50:43	2018-10-26 13:50:43
376	2	PopCity/patterns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:50:51	2018-10-26 13:50:51
377	2	PopCity/file--system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:54:46	2018-10-26 13:54:46
378	2	PopCity/auth/menu/13/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:55:11	2018-10-26 13:55:11
379	2	PopCity/auth/menu/13	PUT	192.168.3.22	{"parent_id":"9","title":"\\u7528\\u6237\\u6587\\u4ef6\\u7ba1\\u7406","icon":"fa-bars","uri":"\\/file_system","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 13:55:17	2018-10-26 13:55:17
380	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 13:55:17	2018-10-26 13:55:17
381	2	PopCity	GET	192.168.3.22	[]	2018-10-26 13:55:24	2018-10-26 13:55:24
382	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:55:26	2018-10-26 13:55:26
383	2	PopCity/scheme_system	GET	192.168.3.22	[]	2018-10-26 13:56:16	2018-10-26 13:56:16
384	2	PopCity/scheme_system	GET	192.168.3.22	[]	2018-10-26 13:56:49	2018-10-26 13:56:49
385	2	PopCity/scheme_system	GET	192.168.3.22	[]	2018-10-26 13:56:58	2018-10-26 13:56:58
386	2	PopCity/scheme_system	GET	192.168.3.22	[]	2018-10-26 13:57:15	2018-10-26 13:57:15
387	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:57:23	2018-10-26 13:57:23
388	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:57:23	2018-10-26 13:57:23
389	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:57:24	2018-10-26 13:57:24
390	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:57:25	2018-10-26 13:57:25
391	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:59:48	2018-10-26 13:59:48
392	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:59:51	2018-10-26 13:59:51
393	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:59:52	2018-10-26 13:59:52
394	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 13:59:57	2018-10-26 13:59:57
395	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:00:50	2018-10-26 14:00:50
396	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:00:52	2018-10-26 14:00:52
397	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:00:52	2018-10-26 14:00:52
398	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"0","title":"\\u6743\\u9650\\u4e2d\\u5fc3","icon":"fa-bars","uri":"\\/permissions","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 14:01:27	2018-10-26 14:01:27
399	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:01:28	2018-10-26 14:01:28
400	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":29},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15,\\"children\\":[{\\"id\\":28}]}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23,\\"children\\":[{\\"id\\":27},{\\"id\\":26}]},{\\"id\\":24}]}]},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]"}	2018-10-26 14:01:42	2018-10-26 14:01:42
401	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:01:42	2018-10-26 14:01:42
402	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:01:43	2018-10-26 14:01:43
403	2	PopCity/users/index	GET	192.168.3.22	[]	2018-10-26 14:01:45	2018-10-26 14:01:45
404	2	PopCity/auth/menu/29/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:02:07	2018-10-26 14:02:07
405	2	PopCity/auth/menu/29	PUT	192.168.3.22	{"parent_id":"0","title":"\\u6743\\u9650\\u4e2d\\u5fc3","icon":"fa-bars","uri":"\\/users\\/permission","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 14:02:42	2018-10-26 14:02:42
406	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:02:42	2018-10-26 14:02:42
407	2	PopCity	GET	192.168.3.22	[]	2018-10-26 14:02:51	2018-10-26 14:02:51
408	2	PopCity/users/permission	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:03:26	2018-10-26 14:03:26
409	2	PopCity/auth/menu/29/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:03:33	2018-10-26 14:03:33
410	2	PopCity/auth/menu/29	PUT	192.168.3.22	{"parent_id":"0","title":"\\u6743\\u9650\\u4e2d\\u5fc3","icon":"fa-yahoo","uri":"\\/users\\/permission","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu"}	2018-10-26 14:04:17	2018-10-26 14:04:17
411	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:04:17	2018-10-26 14:04:17
412	2	PopCity/users/permission	GET	192.168.3.22	[]	2018-10-26 14:04:28	2018-10-26 14:04:28
413	2	PopCity/users/permission	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:04:31	2018-10-26 14:04:31
414	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:04:32	2018-10-26 14:04:32
415	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:04:34	2018-10-26 14:04:34
416	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:04:35	2018-10-26 14:04:35
417	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:32	2018-10-26 14:05:32
418	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:33	2018-10-26 14:05:33
419	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:35	2018-10-26 14:05:35
420	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:36	2018-10-26 14:05:36
421	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:38	2018-10-26 14:05:38
422	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:05:38	2018-10-26 14:05:38
423	2	PopCity/pois/type	GET	192.168.3.22	[]	2018-10-26 14:22:14	2018-10-26 14:22:14
424	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:22:18	2018-10-26 14:22:18
425	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:22:31	2018-10-26 14:22:31
426	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:22:33	2018-10-26 14:22:33
427	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:25:24	2018-10-26 14:25:24
428	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:25:28	2018-10-26 14:25:28
429	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:25:28	2018-10-26 14:25:28
430	2	PopCity/showUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:25:32	2018-10-26 14:25:32
431	2	PopCity/addUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:25:34	2018-10-26 14:25:34
432	2	PopCity/storeUserPer/1	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","pers":["157"]}	2018-10-26 14:25:37	2018-10-26 14:25:37
433	2	PopCity/showUserPer/1	GET	192.168.3.22	[]	2018-10-26 14:25:37	2018-10-26 14:25:37
434	2	PopCity/delUserPer/1/157	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 14:28:51	2018-10-26 14:28:51
435	2	PopCity/showUserPer/1	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:28:51	2018-10-26 14:28:51
436	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:29:47	2018-10-26 14:29:47
437	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 14:29:47	2018-10-26 14:29:47
438	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:31:16	2018-10-26 14:31:16
439	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:31:19	2018-10-26 14:31:19
440	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:31:20	2018-10-26 14:31:20
441	2	PopCity/resource/tilesets	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:33:17	2018-10-26 14:33:17
442	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"per_page":"20","page":"1","method":"ajax"}	2018-10-26 14:33:17	2018-10-26 14:33:17
443	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:33:45	2018-10-26 14:33:45
444	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"0","title":"\\u5de5\\u5177\\u6309\\u94ae","icon":"fa-bars","uri":"\\/toolbars","roles":[null],"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 14:33:56	2018-10-26 14:33:56
445	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:33:56	2018-10-26 14:33:56
446	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":29},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15,\\"children\\":[{\\"id\\":28}]}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23,\\"children\\":[{\\"id\\":27},{\\"id\\":26}]},{\\"id\\":24}]}]},{\\"id\\":30},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]"}	2018-10-26 14:34:05	2018-10-26 14:34:05
447	2	PopCity/auth/menu	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:34:05	2018-10-26 14:34:05
448	2	PopCity/auth/menu	GET	192.168.3.22	[]	2018-10-26 14:34:06	2018-10-26 14:34:06
449	2	PopCity/toolbars	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:34:09	2018-10-26 14:34:09
450	2	PopCity/toolbars/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:34:25	2018-10-26 14:34:25
451	2	PopCity/toolbars	POST	192.168.3.22	{"type":"terrains","name":"\\u5730\\u5f62","icon":"fa-pencil","img":"fa-pencil","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:34:40	2018-10-26 14:34:40
452	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:34:40	2018-10-26 14:34:40
453	2	PopCity/toolbars-btns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:34:44	2018-10-26 14:34:44
454	2	PopCity/toolbars-btns/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:34:57	2018-10-26 14:34:57
455	2	PopCity/toolbars-btns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:00	2018-10-26 14:35:00
456	2	PopCity/toolbars-btns/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:02	2018-10-26 14:35:02
457	2	PopCity/toolbars-btns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:13	2018-10-26 14:35:13
458	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:16	2018-10-26 14:35:16
459	2	PopCity/toolbars	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:18	2018-10-26 14:35:18
460	2	PopCity/toolbars/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:19	2018-10-26 14:35:19
461	2	PopCity/toolbars	POST	192.168.3.22	{"type":"tilesets","name":"\\u573a\\u666f","icon":"fa-500px","img":"fa-500px","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:35:30	2018-10-26 14:35:30
462	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:35:30	2018-10-26 14:35:30
463	2	PopCity/toolbars/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:33	2018-10-26 14:35:33
464	2	PopCity/toolbars	POST	192.168.3.22	{"type":"images","name":"\\u5f71\\u50cf","icon":"fa-adn","img":"fa-adn","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:35:45	2018-10-26 14:35:45
465	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:35:45	2018-10-26 14:35:45
466	2	PopCity/toolbars-btns	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:48	2018-10-26 14:35:48
467	2	PopCity/toolbars-btns/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:35:57	2018-10-26 14:35:57
468	2	PopCity/toolbars-btns	POST	192.168.3.22	{"toolbar_id":"3","name":"\\u4fe1\\u606f","btn_id":"imageryBtn","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars-btns"}	2018-10-26 14:36:07	2018-10-26 14:36:07
469	2	PopCity/toolbars-btns	GET	192.168.3.22	[]	2018-10-26 14:36:07	2018-10-26 14:36:07
470	2	PopCity/toolbars-btns/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:36:09	2018-10-26 14:36:09
471	2	PopCity/toolbars-btns	POST	192.168.3.22	{"toolbar_id":"3","name":"\\u8bbe\\u7f6e","btn_id":"imagerySetting","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars-btns"}	2018-10-26 14:36:22	2018-10-26 14:36:22
472	2	PopCity/toolbars-btns	GET	192.168.3.22	[]	2018-10-26 14:36:22	2018-10-26 14:36:22
473	2	PopCity/toolbars-btns/create	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:36:30	2018-10-26 14:36:30
474	2	PopCity/toolbars-btns	POST	192.168.3.22	{"toolbar_id":"2","name":"\\u67e5\\u770b","btn_id":"tilesetBtn","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars-btns"}	2018-10-26 14:36:38	2018-10-26 14:36:38
475	2	PopCity/toolbars-btns	GET	192.168.3.22	[]	2018-10-26 14:36:39	2018-10-26 14:36:39
476	2	PopCity/toolbars	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:37:20	2018-10-26 14:37:20
477	2	PopCity/toolbars/1/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:37:22	2018-10-26 14:37:22
478	2	PopCity/toolbars/1	PUT	192.168.3.22	{"type":"terrains","name":"\\u5730\\u5f62","icon":null,"img":null,"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:37:25	2018-10-26 14:37:25
479	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:37:26	2018-10-26 14:37:26
480	2	PopCity/toolbars/3/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:37:28	2018-10-26 14:37:28
481	2	PopCity/toolbars/3	PUT	192.168.3.22	{"type":"images","name":"\\u5f71\\u50cf","icon":null,"img":null,"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:37:31	2018-10-26 14:37:31
482	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:37:31	2018-10-26 14:37:31
483	2	PopCity/toolbars/2/edit	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:37:32	2018-10-26 14:37:32
484	2	PopCity/toolbars/2	PUT	192.168.3.22	{"type":"tilesets","name":"\\u573a\\u666f","icon":null,"img":null,"_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars"}	2018-10-26 14:37:35	2018-10-26 14:37:35
485	2	PopCity/toolbars	GET	192.168.3.22	[]	2018-10-26 14:37:35	2018-10-26 14:37:35
486	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:41	2018-10-26 14:38:41
487	2	PopCity/auth/logs	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:42	2018-10-26 14:38:42
488	2	PopCity/login-info	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:49	2018-10-26 14:38:49
489	2	PopCity/settings	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:55	2018-10-26 14:38:55
490	2	PopCity/users/permission	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:56	2018-10-26 14:38:56
491	2	PopCity/users/role	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:57	2018-10-26 14:38:57
492	2	PopCity/users/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:58	2018-10-26 14:38:58
493	2	PopCity	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:38:58	2018-10-26 14:38:58
494	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:42:20	2018-10-26 14:42:20
495	2	PopCity/pois/index/114,112,111,110,109,101,99,97,96,94,93,92,91,38,37,36,35,34,33	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 14:42:31	2018-10-26 14:42:31
496	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:42:31	2018-10-26 14:42:31
497	2	PopCity/pois/index/32,31,30,29,28,27,26,25,24,23,22,21	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 14:42:46	2018-10-26 14:42:46
498	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:42:46	2018-10-26 14:42:46
499	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 14:43:07	2018-10-26 14:43:07
500	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:13:52	2018-10-26 15:13:52
501	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:16:59	2018-10-26 15:16:59
502	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:18:00	2018-10-26 15:18:00
503	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:18:35	2018-10-26 15:18:35
504	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:18:45	2018-10-26 15:18:45
505	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:19:02	2018-10-26 15:19:02
506	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:19:16	2018-10-26 15:19:16
507	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:19:29	2018-10-26 15:19:29
508	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:19:35	2018-10-26 15:19:35
509	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:20:14	2018-10-26 15:20:14
510	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:20:42	2018-10-26 15:20:42
511	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:21:16	2018-10-26 15:21:16
512	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:21:36	2018-10-26 15:21:36
513	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:21:40	2018-10-26 15:21:40
514	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:22:13	2018-10-26 15:22:13
515	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:22:34	2018-10-26 15:22:34
516	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:22:36	2018-10-26 15:22:36
517	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:25:07	2018-10-26 15:25:07
518	2	PopCity/file_system/4	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:25:09	2018-10-26 15:25:09
519	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:25:09	2018-10-26 15:25:09
520	2	PopCity/file_system/4	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:28:11	2018-10-26 15:28:11
521	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:28:11	2018-10-26 15:28:11
522	2	PopCity/file_system/4	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:29:02	2018-10-26 15:29:02
523	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:29:02	2018-10-26 15:29:02
524	2	PopCity/file_system/4	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:31:42	2018-10-26 15:31:42
525	2	PopCity/file_system/4	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:33:21	2018-10-26 15:33:21
526	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:33:21	2018-10-26 15:33:21
527	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:33:44	2018-10-26 15:33:44
528	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:34:44	2018-10-26 15:34:44
529	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:34:47	2018-10-26 15:34:47
530	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:34:47	2018-10-26 15:34:47
531	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:35:06	2018-10-26 15:35:06
532	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:35:07	2018-10-26 15:35:07
533	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:36:37	2018-10-26 15:36:37
534	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:36:37	2018-10-26 15:36:37
535	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:37:00	2018-10-26 15:37:00
536	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:37:08	2018-10-26 15:37:08
537	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:37:24	2018-10-26 15:37:24
538	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:37:24	2018-10-26 15:37:24
539	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:37:54	2018-10-26 15:37:54
540	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:38:12	2018-10-26 15:38:12
541	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:38:22	2018-10-26 15:38:22
542	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:38:22	2018-10-26 15:38:22
543	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:38:49	2018-10-26 15:38:49
544	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:38:59	2018-10-26 15:38:59
545	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:38:59	2018-10-26 15:38:59
546	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:39:14	2018-10-26 15:39:14
547	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:39:14	2018-10-26 15:39:14
548	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:39:26	2018-10-26 15:39:26
549	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:39:26	2018-10-26 15:39:26
550	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:39:45	2018-10-26 15:39:45
551	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:39:46	2018-10-26 15:39:46
552	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:40:12	2018-10-26 15:40:12
553	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:40:12	2018-10-26 15:40:12
554	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:41:32	2018-10-26 15:41:32
555	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:41:33	2018-10-26 15:41:33
556	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:41:37	2018-10-26 15:41:37
557	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:41:37	2018-10-26 15:41:37
558	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:41:42	2018-10-26 15:41:42
559	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:41:42	2018-10-26 15:41:42
560	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:41:59	2018-10-26 15:41:59
561	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:41:59	2018-10-26 15:41:59
562	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:42:03	2018-10-26 15:42:03
563	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:42:03	2018-10-26 15:42:03
564	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:43:23	2018-10-26 15:43:23
565	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:43:23	2018-10-26 15:43:23
566	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:44:19	2018-10-26 15:44:19
567	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:44:19	2018-10-26 15:44:19
568	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:44:57	2018-10-26 15:44:57
569	2	PopCity/file_system/8	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:45:01	2018-10-26 15:45:01
570	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:45:02	2018-10-26 15:45:02
571	2	PopCity/file_system/7	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:45:08	2018-10-26 15:45:08
572	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:45:08	2018-10-26 15:45:08
573	2	PopCity/file_system/7	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:46:26	2018-10-26 15:46:26
574	2	PopCity/file_system/7	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:46:46	2018-10-26 15:46:46
575	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:46:47	2018-10-26 15:46:47
576	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:47:25	2018-10-26 15:47:25
577	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 15:47:29	2018-10-26 15:47:29
578	2	PopCity/file_system/8	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:47:32	2018-10-26 15:47:32
579	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:47:33	2018-10-26 15:47:33
580	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:47:36	2018-10-26 15:47:36
581	2	PopCity/file_system/7	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno"}	2018-10-26 15:47:41	2018-10-26 15:47:41
582	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:47:41	2018-10-26 15:47:41
583	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 15:47:44	2018-10-26 15:47:44
584	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 16:04:52	2018-10-26 16:04:52
585	2	PopCity/pois/index	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 16:08:52	2018-10-26 16:08:52
586	2	PopCity/pois/type	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 16:08:53	2018-10-26 16:08:53
587	2	PopCity/file_system	GET	192.168.3.22	{"_pjax":"#pjax-container"}	2018-10-26 16:08:57	2018-10-26 16:08:57
588	2	PopCity/file_system	GET	192.168.3.22	[]	2018-10-26 16:16:40	2018-10-26 16:16:40
589	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-26 16:36:33	2018-10-26 16:36:33
590	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-26 16:37:14	2018-10-26 16:37:14
591	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-26 17:27:51	2018-10-26 17:27:51
592	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-26 17:34:36	2018-10-26 17:34:36
593	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-26 17:34:38	2018-10-26 17:34:38
594	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 17:34:40	2018-10-26 17:34:40
595	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 17:43:42	2018-10-26 17:43:42
596	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 17:43:53	2018-10-26 17:43:53
597	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 17:44:03	2018-10-26 17:44:03
598	2	PopCity/file_system/5/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system\\/5\\/edit","_pjax":"#pjax-container"}	2018-10-26 17:44:06	2018-10-26 17:44:06
599	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:44:06	2018-10-26 17:44:06
600	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:47:02	2018-10-26 17:47:02
601	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_export_":"all"}	2018-10-26 17:47:07	2018-10-26 17:47:07
602	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:50:29	2018-10-26 17:50:29
603	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:51:15	2018-10-26 17:51:15
604	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:51:47	2018-10-26 17:51:47
605	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:51:55	2018-10-26 17:51:55
606	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 17:51:58	2018-10-26 17:51:58
607	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:53:09	2018-10-26 17:53:09
608	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:53:56	2018-10-26 17:53:56
609	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:54:53	2018-10-26 17:54:53
610	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:55:17	2018-10-26 17:55:17
611	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:55:46	2018-10-26 17:55:46
612	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:56:49	2018-10-26 17:56:49
613	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","_pjax":"#pjax-container"}	2018-10-26 17:56:53	2018-10-26 17:56:53
614	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 17:56:54	2018-10-26 17:56:54
615	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:57:02	2018-10-26 17:57:02
616	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:57:37	2018-10-26 17:57:37
617	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:57:49	2018-10-26 17:57:49
618	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:58:24	2018-10-26 17:58:24
619	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:58:33	2018-10-26 17:58:33
620	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:58:38	2018-10-26 17:58:38
621	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:58:58	2018-10-26 17:58:58
622	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:59:03	2018-10-26 17:59:03
623	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:59:15	2018-10-26 17:59:15
624	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:59:21	2018-10-26 17:59:21
625	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 17:59:33	2018-10-26 17:59:33
626	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"images\\/users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg","_pjax":"#pjax-container"}	2018-10-26 17:59:38	2018-10-26 17:59:38
627	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"images\\/users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg"}	2018-10-26 17:59:38	2018-10-26 17:59:38
628	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/images\\/users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg"}	2018-10-26 18:00:09	2018-10-26 18:00:09
629	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg"}	2018-10-26 18:00:13	2018-10-26 18:00:13
630	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:00:45	2018-10-26 18:00:45
631	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:00:52	2018-10-26 18:00:52
632	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg","_pjax":"#pjax-container"}	2018-10-26 18:00:54	2018-10-26 18:00:54
633	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:00:57	2018-10-26 18:00:57
634	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:01:01	2018-10-26 18:01:01
635	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/C4FnZKEd7V.jpeg","_pjax":"#pjax-container"}	2018-10-26 18:01:03	2018-10-26 18:01:03
636	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:01:08	2018-10-26 18:01:08
637	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/9ygsLQa40m.jpeg","_pjax":"#pjax-container"}	2018-10-26 18:01:42	2018-10-26 18:01:42
638	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:01:45	2018-10-26 18:01:45
639	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:02:28	2018-10-26 18:02:28
640	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:03:25	2018-10-26 18:03:25
641	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:03:41	2018-10-26 18:03:41
642	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%uHoGSEPHer.jpeg","_pjax":"#pjax-container"}	2018-10-26 18:03:45	2018-10-26 18:03:45
643	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%uHoGSEPHer.jpeg"}	2018-10-26 18:03:45	2018-10-26 18:03:45
644	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:04:24	2018-10-26 18:04:24
645	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:04:24	2018-10-26 18:04:24
646	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:04:27	2018-10-26 18:04:27
647	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:04:31	2018-10-26 18:04:31
648	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:04:35	2018-10-26 18:04:35
649	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:05:10	2018-10-26 18:05:10
650	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:05:13	2018-10-26 18:05:13
651	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:05:16	2018-10-26 18:05:16
652	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%9ygsLQa40m.jpeg"}	2018-10-26 18:05:17	2018-10-26 18:05:17
653	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%9ygsLQa40m.jpeg"}	2018-10-26 18:05:19	2018-10-26 18:05:19
654	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/lhx\\/poi\\/Jd5ujHgeLM.jpeg"}	2018-10-26 18:06:51	2018-10-26 18:06:51
655	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:06:58	2018-10-26 18:06:58
656	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:07:00	2018-10-26 18:07:00
657	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%uHoGSEPHer.jpeg"}	2018-10-26 18:07:03	2018-10-26 18:07:03
658	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%9ygsLQa40m.jpeg"}	2018-10-26 18:08:01	2018-10-26 18:08:01
659	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%bJgQpOQHjJ.jpeg"}	2018-10-26 18:08:03	2018-10-26 18:08:03
660	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%uHoGSEPHer.jpeg"}	2018-10-26 18:08:05	2018-10-26 18:08:05
661	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users%huyouheng%poi%9ygsLQa40m.jpeg"}	2018-10-26 18:08:08	2018-10-26 18:08:08
662	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:08:16	2018-10-26 18:08:16
663	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:08:19	2018-10-26 18:08:19
664	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:08:21	2018-10-26 18:08:21
665	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:08:28	2018-10-26 18:08:28
666	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:08:30	2018-10-26 18:08:30
667	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:08:30	2018-10-26 18:08:30
668	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:08:37	2018-10-26 18:08:37
669	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:11:40	2018-10-26 18:11:40
670	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:12:10	2018-10-26 18:12:10
671	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download"}	2018-10-26 18:12:45	2018-10-26 18:12:45
672	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:13:20	2018-10-26 18:13:20
673	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:23	2018-10-26 18:13:23
674	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:35	2018-10-26 18:13:35
675	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:37	2018-10-26 18:13:37
676	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:40	2018-10-26 18:13:40
677	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:45	2018-10-26 18:13:45
678	2	PopCity/media-download	GET	192.168.3.22	0	2018-10-26 18:13:48	2018-10-26 18:13:48
679	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/users\\/huyouheng\\/partten%1\\/A1.gltf"}	2018-10-26 18:13:53	2018-10-26 18:13:53
680	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/users\\/huyouheng\\/partten\\/1\\/A1.gltf"}	2018-10-26 18:13:56	2018-10-26 18:13:56
681	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:14:14	2018-10-26 18:14:14
682	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/partten\\/1\\/A1.gltf","_pjax":"#pjax-container"}	2018-10-26 18:14:20	2018-10-26 18:14:20
683	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:15:00	2018-10-26 18:15:00
684	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:15:02	2018-10-26 18:15:02
685	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/9ygsLQa40m.jpeg"}	2018-10-26 18:15:19	2018-10-26 18:15:19
686	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-26 18:16:15	2018-10-26 18:16:15
687	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-26 18:16:15	2018-10-26 18:16:15
688	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-26 18:16:37	2018-10-26 18:16:37
689	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-26 18:16:39	2018-10-26 18:16:39
690	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-26 18:16:39	2018-10-26 18:16:39
691	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:21:27	2018-10-26 18:21:27
692	2	PopCity/file_system/9	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/9"}	2018-10-26 18:21:48	2018-10-26 18:21:48
693	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:21:48	2018-10-26 18:21:48
694	2	PopCity/file_system/12	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/12"}	2018-10-26 18:25:26	2018-10-26 18:25:26
695	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:25:26	2018-10-26 18:25:26
696	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:26:01	2018-10-26 18:26:01
697	2	PopCity/file_system/11	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/11"}	2018-10-26 18:26:04	2018-10-26 18:26:04
698	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:26:04	2018-10-26 18:26:04
699	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:26:29	2018-10-26 18:26:29
700	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:27:27	2018-10-26 18:27:27
701	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:27:27	2018-10-26 18:27:27
702	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:29:25	2018-10-26 18:29:25
703	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:29:25	2018-10-26 18:29:25
704	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:30:13	2018-10-26 18:30:13
705	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:30:15	2018-10-26 18:30:15
706	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:30:15	2018-10-26 18:30:15
707	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:31:06	2018-10-26 18:31:06
708	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:31:08	2018-10-26 18:31:08
709	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:31:10	2018-10-26 18:31:10
710	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:31:23	2018-10-26 18:31:23
711	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:31:58	2018-10-26 18:31:58
712	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:31:58	2018-10-26 18:31:58
713	2	PopCity/file_system/5	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/5"}	2018-10-26 18:32:02	2018-10-26 18:32:02
714	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:32:02	2018-10-26 18:32:02
715	2	PopCity/file_system/6	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/6"}	2018-10-26 18:32:05	2018-10-26 18:32:05
716	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:32:05	2018-10-26 18:32:05
717	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:32:07	2018-10-26 18:32:07
718	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:32:22	2018-10-26 18:32:22
719	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:32:27	2018-10-26 18:32:27
720	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:32:46	2018-10-26 18:32:46
721	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:32:46	2018-10-26 18:32:46
722	2	PopCity/file_system/10	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/10"}	2018-10-26 18:33:18	2018-10-26 18:33:18
723	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:33:18	2018-10-26 18:33:18
724	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:33:19	2018-10-26 18:33:19
725	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:33:35	2018-10-26 18:33:35
726	2	PopCity/pois/index/17,16,15,13,12,11,10,9,8,7,6,5,4,3,2,1	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/17,16,15,13,12,11,10,9,8,7,6,5,4,3,2,1"}	2018-10-26 18:33:42	2018-10-26 18:33:42
727	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:33:43	2018-10-26 18:33:43
728	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:34:55	2018-10-26 18:34:55
729	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:35:15	2018-10-26 18:35:15
730	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:39:27	2018-10-26 18:39:27
731	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:40:14	2018-10-26 18:40:14
732	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:41:06	2018-10-26 18:41:06
733	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:41:37	2018-10-26 18:41:37
734	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:43:21	2018-10-26 18:43:21
735	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:43:24	2018-10-26 18:43:24
736	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:43:42	2018-10-26 18:43:42
737	2	PopCity/file_system/25	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/25"}	2018-10-26 18:43:46	2018-10-26 18:43:46
738	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:43:46	2018-10-26 18:43:46
739	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:43:55	2018-10-26 18:43:55
740	2	PopCity/pois/index/23/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index\\/23\\/edit","_pjax":"#pjax-container"}	2018-10-26 18:44:12	2018-10-26 18:44:12
741	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:44:27	2018-10-26 18:44:27
742	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:44:30	2018-10-26 18:44:30
743	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:44:34	2018-10-26 18:44:34
744	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:44:35	2018-10-26 18:44:35
745	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:46:27	2018-10-26 18:46:27
746	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:46:27	2018-10-26 18:46:27
747	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:48:33	2018-10-26 18:48:33
748	2	PopCity/pois/index/23,22,21,20,19,18	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23,22,21,20,19,18"}	2018-10-26 18:48:43	2018-10-26 18:48:43
749	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:48:43	2018-10-26 18:48:43
750	2	PopCity/pois/index/23,22,21,20,19,18	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23,22,21,20,19,18"}	2018-10-26 18:49:52	2018-10-26 18:49:52
751	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:49:52	2018-10-26 18:49:52
752	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:49:57	2018-10-26 18:49:57
753	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:50:02	2018-10-26 18:50:02
754	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:50:02	2018-10-26 18:50:02
755	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:50:07	2018-10-26 18:50:07
756	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:50:07	2018-10-26 18:50:07
757	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:51:52	2018-10-26 18:51:52
758	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:51:56	2018-10-26 18:51:56
759	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:51:56	2018-10-26 18:51:56
760	2	PopCity/pois/index/22	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/22"}	2018-10-26 18:52:02	2018-10-26 18:52:02
761	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:52:02	2018-10-26 18:52:02
762	2	PopCity/pois/index/18	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/18"}	2018-10-26 18:52:07	2018-10-26 18:52:07
763	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:52:07	2018-10-26 18:52:07
764	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index"}	2018-10-26 18:54:24	2018-10-26 18:54:24
765	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:54:28	2018-10-26 18:54:28
766	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:54:37	2018-10-26 18:54:37
767	2	PopCity/pois/index/23	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/23"}	2018-10-26 18:54:57	2018-10-26 18:54:57
768	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:54:57	2018-10-26 18:54:57
769	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:55:59	2018-10-26 18:55:59
770	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:56:07	2018-10-26 18:56:07
771	2	PopCity/pois/index/22	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/pois\\/index\\/22"}	2018-10-26 18:56:21	2018-10-26 18:56:21
772	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 18:56:21	2018-10-26 18:56:21
773	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:56:30	2018-10-26 18:56:30
774	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:57:22	2018-10-26 18:57:22
775	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:58:23	2018-10-26 18:58:23
776	2	PopCity/file_system/26	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/26"}	2018-10-26 18:58:30	2018-10-26 18:58:30
777	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 18:58:30	2018-10-26 18:58:30
778	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 18:58:31	2018-10-26 18:58:31
779	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:00:01	2018-10-26 19:00:01
780	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:00:43	2018-10-26 19:00:43
781	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:01:07	2018-10-26 19:01:07
782	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:01:23	2018-10-26 19:01:23
783	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:02:44	2018-10-26 19:02:44
784	2	PopCity/file_system/28	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/28"}	2018-10-26 19:02:47	2018-10-26 19:02:47
785	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:02:48	2018-10-26 19:02:48
786	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:03:12	2018-10-26 19:03:12
787	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:05:56	2018-10-26 19:05:56
788	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:06:19	2018-10-26 19:06:19
789	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:06:20	2018-10-26 19:06:20
790	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:07:34	2018-10-26 19:07:34
791	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:07:52	2018-10-26 19:07:52
792	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:08:04	2018-10-26 19:08:04
793	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/hPTtC79fSN.jpeg"}	2018-10-26 19:08:48	2018-10-26 19:08:48
794	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/hPTtC79fSN.jpeg"}	2018-10-26 19:08:50	2018-10-26 19:08:50
795	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/hPTtC79fSN.jpeg"}	2018-10-26 19:08:52	2018-10-26 19:08:52
796	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"\\/users\\/huyouheng\\/poi\\/hPTtC79fSN.jpeg"}	2018-10-26 19:08:57	2018-10-26 19:08:57
797	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:09:00	2018-10-26 19:09:00
798	2	PopCity/media-download	GET	192.168.3.22	{"s":"\\/PopCity\\/media-download","file":"users\\/huyouheng\\/poi\\/F0VwCF04Y7.jpeg"}	2018-10-26 19:09:03	2018-10-26 19:09:03
799	2	PopCity/file_system/31	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/file_system\\/31"}	2018-10-26 19:09:08	2018-10-26 19:09:08
800	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:09:10	2018-10-26 19:09:10
801	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system"}	2018-10-26 19:09:32	2018-10-26 19:09:32
802	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:10:27	2018-10-26 19:10:27
803	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-26 19:10:42	2018-10-26 19:10:42
804	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-26 19:10:43	2018-10-26 19:10:43
805	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-26 19:10:45	2018-10-26 19:10:45
806	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-10-26 19:10:49	2018-10-26 19:10:49
807	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-26 19:10:51	2018-10-26 19:10:51
808	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-26 19:10:52	2018-10-26 19:10:52
809	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-26 19:10:54	2018-10-26 19:10:54
810	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-26 19:10:55	2018-10-26 19:10:55
811	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-26 19:10:55	2018-10-26 19:10:55
812	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-26 19:11:02	2018-10-26 19:11:02
813	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-26 19:16:03	2018-10-26 19:16:03
814	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-26 19:16:11	2018-10-26 19:16:11
815	2	PopCity/angles/2,3,4,5,6,7,8,9,10,11,33,34,35,36,37,38,39,50,51	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/angles\\/2,3,4,5,6,7,8,9,10,11,33,34,35,36,37,38,39,50,51"}	2018-10-26 19:16:14	2018-10-26 19:16:14
816	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-26 19:16:14	2018-10-26 19:16:14
817	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-26 19:16:23	2018-10-26 19:16:23
818	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:16:46	2018-10-26 19:16:46
819	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:18:05	2018-10-26 19:18:05
820	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:18:22	2018-10-26 19:18:22
821	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:18:40	2018-10-26 19:18:40
822	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:19:10	2018-10-26 19:19:10
823	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:19:16	2018-10-26 19:19:16
824	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:19:45	2018-10-26 19:19:45
825	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:20:04	2018-10-26 19:20:04
826	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:20:23	2018-10-26 19:20:23
827	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:20:41	2018-10-26 19:20:41
828	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:21:02	2018-10-26 19:21:02
829	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:22:28	2018-10-26 19:22:28
830	2	PopCity/angles/2	DELETE	192.168.3.22	{"_method":"delete","_token":"dYWJ4LStKqfR1kKvIcP0hffTfVqSXO8aJ1uPnFno","s":"\\/PopCity\\/angles\\/2"}	2018-10-26 19:22:31	2018-10-26 19:22:31
831	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-26 19:22:31	2018-10-26 19:22:31
832	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:22:45	2018-10-26 19:22:45
833	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles"}	2018-10-26 19:23:09	2018-10-26 19:23:09
834	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-26 19:23:12	2018-10-26 19:23:12
835	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-26 19:23:12	2018-10-26 19:23:12
836	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-26 19:23:15	2018-10-26 19:23:15
837	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-26 19:23:16	2018-10-26 19:23:16
838	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-26 19:23:17	2018-10-26 19:23:17
839	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-27 11:16:38	2018-10-27 11:16:38
840	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-27 11:16:38	2018-10-27 11:16:38
841	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:16:42	2018-10-27 11:16:42
842	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 11:16:43	2018-10-27 11:16:43
843	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 11:16:44	2018-10-27 11:16:44
844	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 11:16:44	2018-10-27 11:16:44
845	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-27 11:16:47	2018-10-27 11:16:47
846	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-27 11:16:48	2018-10-27 11:16:48
847	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 11:17:02	2018-10-27 11:17:02
848	2	PopCity/auth/users	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/users","_pjax":"#pjax-container"}	2018-10-27 11:17:06	2018-10-27 11:17:06
849	2	PopCity/auth/roles	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/roles","_pjax":"#pjax-container"}	2018-10-27 11:17:07	2018-10-27 11:17:07
850	2	PopCity/auth/permissions	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/permissions","_pjax":"#pjax-container"}	2018-10-27 11:17:08	2018-10-27 11:17:08
851	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-10-27 11:17:10	2018-10-27 11:17:10
852	2	PopCity/auth/users	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/users","_pjax":"#pjax-container"}	2018-10-27 11:17:11	2018-10-27 11:17:11
853	2	PopCity/inner/api/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/inner\\/api\\/web-config"}	2018-10-27 11:24:20	2018-10-27 11:24:20
854	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:24:56	2018-10-27 11:24:56
855	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-10-27 11:25:03	2018-10-27 11:25:03
856	2	PopCity/auth/menu	POST	192.168.3.22	{"parent_id":"1","title":"\\u5e38\\u7528\\u914d\\u7f6e","icon":"fa-bars","uri":"\\/web-config","roles":[null],"_token":"NHsIYLbv7lF2sHsCVNxj8ZK03wLj4u5sFntox6Wb","s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:25:28	2018-10-27 11:25:28
857	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:25:28	2018-10-27 11:25:28
858	2	PopCity/auth/menu	POST	192.168.3.22	{"_token":"NHsIYLbv7lF2sHsCVNxj8ZK03wLj4u5sFntox6Wb","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":29},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15,\\"children\\":[{\\"id\\":28}]}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23,\\"children\\":[{\\"id\\":27},{\\"id\\":26}]},{\\"id\\":24}]}]},{\\"id\\":30},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":31},{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]","s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:25:42	2018-10-27 11:25:42
859	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-10-27 11:25:43	2018-10-27 11:25:43
860	2	PopCity/auth/menu/31/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu\\/31\\/edit","_pjax":"#pjax-container"}	2018-10-27 11:25:46	2018-10-27 11:25:46
861	2	PopCity/auth/menu/31	PUT	192.168.3.22	{"parent_id":"1","title":"\\u540e\\u53f0\\u914d\\u7f6e","icon":"fa-bars","uri":"\\/web-config","roles":[null],"_token":"NHsIYLbv7lF2sHsCVNxj8ZK03wLj4u5sFntox6Wb","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu?s=%2FPopCity%2Fauth%2Fmenu","s":"\\/PopCity\\/auth\\/menu\\/31"}	2018-10-27 11:25:54	2018-10-27 11:25:54
862	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:25:54	2018-10-27 11:25:54
863	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:25:56	2018-10-27 11:25:56
864	2	PopCity/auth/menu/31/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu\\/31\\/edit","_pjax":"#pjax-container"}	2018-10-27 11:26:05	2018-10-27 11:26:05
865	2	PopCity/auth/menu/31	PUT	192.168.3.22	{"parent_id":"1","title":"\\u9ed8\\u8ba4\\u914d\\u7f6e","icon":"fa-bars","uri":"\\/web-config","roles":[null],"_token":"NHsIYLbv7lF2sHsCVNxj8ZK03wLj4u5sFntox6Wb","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/auth\\/menu?s=%2FPopCity%2Fauth%2Fmenu","s":"\\/PopCity\\/auth\\/menu\\/31"}	2018-10-27 11:26:14	2018-10-27 11:26:14
866	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:26:14	2018-10-27 11:26:14
867	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu"}	2018-10-27 11:26:15	2018-10-27 11:26:15
868	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:26:17	2018-10-27 11:26:17
869	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:26:58	2018-10-27 11:26:58
870	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:27:10	2018-10-27 11:27:10
871	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:27:31	2018-10-27 11:27:31
872	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:28:20	2018-10-27 11:28:20
873	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:28:21	2018-10-27 11:28:21
874	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:28:23	2018-10-27 11:28:23
875	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:29:09	2018-10-27 11:29:09
876	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:29:11	2018-10-27 11:29:11
877	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:29:13	2018-10-27 11:29:13
878	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:29:18	2018-10-27 11:29:18
879	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:29:20	2018-10-27 11:29:20
880	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:29:47	2018-10-27 11:29:47
881	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:30:30	2018-10-27 11:30:30
882	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:30:37	2018-10-27 11:30:37
883	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:30:54	2018-10-27 11:30:54
884	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:33:38	2018-10-27 11:33:38
885	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:33:45	2018-10-27 11:33:45
886	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:34:53	2018-10-27 11:34:53
887	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:35:01	2018-10-27 11:35:01
888	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:35:26	2018-10-27 11:35:26
889	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 11:35:31	2018-10-27 11:35:31
890	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:35:33	2018-10-27 11:35:33
891	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:35:39	2018-10-27 11:35:39
892	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:35:41	2018-10-27 11:35:41
893	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 11:35:43	2018-10-27 11:35:43
894	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 11:35:44	2018-10-27 11:35:44
895	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:35:46	2018-10-27 11:35:46
896	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:35:48	2018-10-27 11:35:48
897	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 11:35:49	2018-10-27 11:35:49
898	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role"}	2018-10-27 11:37:42	2018-10-27 11:37:42
899	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:37:45	2018-10-27 11:37:45
900	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:37:52	2018-10-27 11:37:52
901	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:37:59	2018-10-27 11:37:59
902	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:38:02	2018-10-27 11:38:02
903	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:39:21	2018-10-27 11:39:21
904	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:39:23	2018-10-27 11:39:23
905	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:39:32	2018-10-27 11:39:32
906	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:39:43	2018-10-27 11:39:43
907	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:39:51	2018-10-27 11:39:51
908	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:39:53	2018-10-27 11:39:53
909	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:40:00	2018-10-27 11:40:00
910	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 11:40:02	2018-10-27 11:40:02
911	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 11:40:03	2018-10-27 11:40:03
912	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/"}	2018-10-27 11:42:04	2018-10-27 11:42:04
913	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:42:07	2018-10-27 11:42:07
914	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:42:18	2018-10-27 11:42:18
915	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:42:34	2018-10-27 11:42:34
916	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:42:41	2018-10-27 11:42:41
917	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:42:48	2018-10-27 11:42:48
918	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 11:43:20	2018-10-27 11:43:20
919	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 11:43:22	2018-10-27 11:43:22
920	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:03:35	2018-10-27 12:03:35
921	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:03:56	2018-10-27 12:03:56
922	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:04:22	2018-10-27 12:04:22
923	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:04:25	2018-10-27 12:04:25
924	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:04:42	2018-10-27 12:04:42
925	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:04:50	2018-10-27 12:04:50
926	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:05:05	2018-10-27 12:05:05
927	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:05:15	2018-10-27 12:05:15
928	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:05:40	2018-10-27 12:05:40
929	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:05:45	2018-10-27 12:05:45
930	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:15:46	2018-10-27 12:15:46
931	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:15:57	2018-10-27 12:15:57
932	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:16:07	2018-10-27 12:16:07
933	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:16:13	2018-10-27 12:16:13
934	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:16:44	2018-10-27 12:16:44
935	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:17:06	2018-10-27 12:17:06
936	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:17:25	2018-10-27 12:17:25
937	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:17:31	2018-10-27 12:17:31
938	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:17:53	2018-10-27 12:17:53
939	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:17:57	2018-10-27 12:17:57
940	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:18:32	2018-10-27 12:18:32
941	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:18:38	2018-10-27 12:18:38
942	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:18:48	2018-10-27 12:18:48
943	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:19:06	2018-10-27 12:19:06
944	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:19:36	2018-10-27 12:19:36
945	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:19:54	2018-10-27 12:19:54
946	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:20:35	2018-10-27 12:20:35
947	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:21:05	2018-10-27 12:21:05
948	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:21:23	2018-10-27 12:21:23
949	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:21:28	2018-10-27 12:21:28
950	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:21:37	2018-10-27 12:21:37
951	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:21:48	2018-10-27 12:21:48
952	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:22:36	2018-10-27 12:22:36
953	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:22:49	2018-10-27 12:22:49
954	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:23:04	2018-10-27 12:23:04
955	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:23:12	2018-10-27 12:23:12
956	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:23:33	2018-10-27 12:23:33
957	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:23:42	2018-10-27 12:23:42
958	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:23:56	2018-10-27 12:23:56
959	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:07	2018-10-27 12:24:07
960	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:15	2018-10-27 12:24:15
961	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:29	2018-10-27 12:24:29
962	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:41	2018-10-27 12:24:41
963	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:54	2018-10-27 12:24:54
964	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:24:59	2018-10-27 12:24:59
965	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:25:05	2018-10-27 12:25:05
966	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:26:06	2018-10-27 12:26:06
967	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:40:14	2018-10-27 12:40:14
968	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:41:04	2018-10-27 12:41:04
969	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 12:42:04	2018-10-27 12:42:04
970	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 12:42:06	2018-10-27 12:42:06
971	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 12:42:08	2018-10-27 12:42:08
972	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 12:42:10	2018-10-27 12:42:10
973	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 12:42:10	2018-10-27 12:42:10
974	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-27 12:42:13	2018-10-27 12:42:13
975	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:44:24	2018-10-27 12:44:24
976	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:44:28	2018-10-27 12:44:28
977	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:44:37	2018-10-27 12:44:37
978	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:46:36	2018-10-27 12:46:36
979	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:46:45	2018-10-27 12:46:45
980	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:46:52	2018-10-27 12:46:52
981	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:12	2018-10-27 12:47:12
982	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:24	2018-10-27 12:47:24
983	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:36	2018-10-27 12:47:36
984	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:40	2018-10-27 12:47:40
985	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:42	2018-10-27 12:47:42
986	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:46	2018-10-27 12:47:46
987	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:47:52	2018-10-27 12:47:52
988	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:48:10	2018-10-27 12:48:10
989	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:49:07	2018-10-27 12:49:07
990	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:49:19	2018-10-27 12:49:19
991	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:49:30	2018-10-27 12:49:30
992	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:50:48	2018-10-27 12:50:48
993	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:51:32	2018-10-27 12:51:32
994	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:51:52	2018-10-27 12:51:52
995	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:51:57	2018-10-27 12:51:57
996	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:51:59	2018-10-27 12:51:59
997	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:52:03	2018-10-27 12:52:03
998	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:52:06	2018-10-27 12:52:06
999	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:52:09	2018-10-27 12:52:09
1000	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:53:12	2018-10-27 12:53:12
1001	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:54:24	2018-10-27 12:54:24
1002	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:54:39	2018-10-27 12:54:39
1003	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:55:31	2018-10-27 12:55:31
1004	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:56:06	2018-10-27 12:56:06
1005	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:56:31	2018-10-27 12:56:31
1006	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:56:41	2018-10-27 12:56:41
1007	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:57:20	2018-10-27 12:57:20
1008	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 12:58:37	2018-10-27 12:58:37
1009	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:00:41	2018-10-27 13:00:41
1010	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:01:35	2018-10-27 13:01:35
1011	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:01:40	2018-10-27 13:01:40
1012	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:01:57	2018-10-27 13:01:57
1013	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:02:48	2018-10-27 13:02:48
1014	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:02:58	2018-10-27 13:02:58
1015	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:04:07	2018-10-27 13:04:07
1016	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:04:15	2018-10-27 13:04:15
1017	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:04:24	2018-10-27 13:04:24
1018	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:04:30	2018-10-27 13:04:30
1019	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:05:11	2018-10-27 13:05:11
1020	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:05:16	2018-10-27 13:05:16
1021	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:05:25	2018-10-27 13:05:25
1022	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:05:35	2018-10-27 13:05:35
1023	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-27 13:19:10	2018-10-27 13:19:10
1024	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-10-27 13:19:14	2018-10-27 13:19:14
1025	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns"}	2018-10-27 13:55:32	2018-10-27 13:55:32
1026	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns"}	2018-10-27 14:13:40	2018-10-27 14:13:40
1027	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 14:13:54	2018-10-27 14:13:54
1028	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 14:13:56	2018-10-27 14:13:56
1029	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:13:57	2018-10-27 14:13:57
1030	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 14:13:58	2018-10-27 14:13:58
1031	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:14:00	2018-10-27 14:14:00
1032	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-10-27 14:14:01	2018-10-27 14:14:01
1033	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-27 14:14:02	2018-10-27 14:14:02
1034	2	PopCity/auth/logs	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/logs","_pjax":"#pjax-container"}	2018-10-27 14:14:03	2018-10-27 14:14:03
1035	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-10-27 14:14:07	2018-10-27 14:14:07
1036	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-27 14:14:08	2018-10-27 14:14:08
1037	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-27 14:14:09	2018-10-27 14:14:09
1038	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-27 14:14:11	2018-10-27 14:14:11
1039	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-27 14:14:11	2018-10-27 14:14:11
1040	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-27 14:14:12	2018-10-27 14:14:12
1041	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-27 14:14:13	2018-10-27 14:14:13
1042	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-27 14:14:14	2018-10-27 14:14:14
1043	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-27 14:14:14	2018-10-27 14:14:14
1044	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 14:14:14	2018-10-27 14:14:14
1045	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-27 14:16:00	2018-10-27 14:16:00
1046	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-27 14:16:01	2018-10-27 14:16:01
1047	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-27 14:16:01	2018-10-27 14:16:01
1048	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 14:16:03	2018-10-27 14:16:03
1049	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:16:03	2018-10-27 14:16:03
1050	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 14:16:04	2018-10-27 14:16:04
1051	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 14:16:04	2018-10-27 14:16:04
1052	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 14:16:05	2018-10-27 14:16:05
1053	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:16:06	2018-10-27 14:16:06
1054	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 14:16:06	2018-10-27 14:16:06
1055	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 14:16:06	2018-10-27 14:16:06
1056	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-27 14:16:09	2018-10-27 14:16:09
1057	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-27 14:16:10	2018-10-27 14:16:10
1058	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-27 14:16:10	2018-10-27 14:16:10
1059	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-27 14:16:11	2018-10-27 14:16:11
1060	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-10-27 14:18:35	2018-10-27 14:18:35
1061	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-27 14:18:37	2018-10-27 14:18:37
1062	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-27 14:18:38	2018-10-27 14:18:38
1063	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-27 14:18:39	2018-10-27 14:18:39
1064	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-27 14:18:40	2018-10-27 14:18:40
1065	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-27 14:18:42	2018-10-27 14:18:42
1066	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 14:19:36	2018-10-27 14:19:36
1067	2	PopCity/users/index/1/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index\\/1\\/edit","_pjax":"#pjax-container"}	2018-10-27 14:19:38	2018-10-27 14:19:38
1068	2	PopCity/users/index/1	PUT	192.168.3.22	{"name":"huyouheng","email":"huyouheng@popsmart.cn","phone":null,"password":"111111","_token":"NHsIYLbv7lF2sHsCVNxj8ZK03wLj4u5sFntox6Wb","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/users\\/index","s":"\\/PopCity\\/users\\/index\\/1"}	2018-10-27 14:19:46	2018-10-27 14:19:46
1069	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index"}	2018-10-27 14:19:46	2018-10-27 14:19:46
1070	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-27 14:26:37	2018-10-27 14:26:37
1071	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:26:44	2018-10-27 14:26:44
1072	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-27 14:26:45	2018-10-27 14:26:45
1073	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-27 14:26:50	2018-10-27 14:26:50
1074	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-27 14:26:50	2018-10-27 14:26:50
1075	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-10-27 14:26:51	2018-10-27 14:26:51
1076	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-27 14:26:54	2018-10-27 14:26:54
1077	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-27 14:26:55	2018-10-27 14:26:55
1078	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-27 14:26:55	2018-10-27 14:26:55
1079	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-27 14:26:56	2018-10-27 14:26:56
1080	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role"}	2018-10-27 14:32:41	2018-10-27 14:32:41
1081	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role"}	2018-10-27 15:00:00	2018-10-27 15:00:00
1082	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-10-28 10:12:37	2018-10-28 10:12:37
1083	2	PopCity/settings	GET	192.168.3.234	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-28 10:12:46	2018-10-28 10:12:46
1084	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-28 10:12:54	2018-10-28 10:12:54
1085	2	PopCity/resource/tileset-group/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group\\/create","_pjax":"#pjax-container"}	2018-10-28 10:14:50	2018-10-28 10:14:50
1086	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-28 10:15:39	2018-10-28 10:15:39
1087	2	PopCity/resource/tileset-group/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group\\/create","_pjax":"#pjax-container"}	2018-10-28 10:15:42	2018-10-28 10:15:42
1088	2	PopCity/resource/tileset-group	POST	192.168.3.234	{"name":"GDuQrA","display_name":"\\u4e0a\\u865e\\u65b0","per":"on","_token":"KbOnO5xsI3aV6P0QSeZregQF1qAO4cbUQTZYNzN9","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tileset-group","s":"\\/PopCity\\/resource\\/tileset-group"}	2018-10-28 10:15:55	2018-10-28 10:15:55
1089	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group"}	2018-10-28 10:15:55	2018-10-28 10:15:55
1090	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 10:16:01	2018-10-28 10:16:01
1091	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 10:16:02	2018-10-28 10:16:02
1092	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-10-28 10:16:12	2018-10-28 10:16:12
1093	2	PopCity/resource/tilesets	POST	192.168.3.234	{"name":"\\u4e0a\\u865e\\u65b01","url":"http:\\/\\/192.168.3.228:8090\\/sources\\/sy\\/sy1\\/tileset.json","description":null,"icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"off","_token":"KbOnO5xsI3aV6P0QSeZregQF1qAO4cbUQTZYNzN9","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-28 10:17:06	2018-10-28 10:17:06
1094	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-28 10:17:06	2018-10-28 10:17:06
1095	2	PopCity/resource/tilesets	POST	192.168.3.234	{"name":"\\u4e0a\\u865e\\u65b01","url":"http:\\/\\/192.168.3.228:8090\\/sources\\/sy\\/sy1\\/tileset.json","description":"shangyu","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"off","_token":"KbOnO5xsI3aV6P0QSeZregQF1qAO4cbUQTZYNzN9","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-28 10:17:16	2018-10-28 10:17:16
1096	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-28 10:17:16	2018-10-28 10:17:16
1097	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-10-28 13:57:37	2018-10-28 13:57:37
1098	2	PopCity/users/index	GET	192.168.3.234	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-28 13:57:52	2018-10-28 13:57:52
1099	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 13:58:05	2018-10-28 13:58:05
1100	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 13:58:05	2018-10-28 13:58:05
1101	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-10-28 13:58:08	2018-10-28 13:58:08
1102	2	PopCity/resource/tilesets	POST	192.168.3.234	{"name":"\\u4e0a\\u865e\\u65b01","url":"http:\\/\\/192.168.3.228:8090\\/sources\\/sy\\/sy1\\/tileset.json","description":"shangyu","icon":null,"img":null,"old_group":"1","new_group":[null],"forUser":[null],"forRole":[null],"per":"off","_token":"4VeTYmG9OIvxhX08QFDx9GhbtWuoqhVPNk3ebLkP","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-28 13:58:25	2018-10-28 13:58:25
1103	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-28 13:58:25	2018-10-28 13:58:25
1104	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-28 18:38:03	2018-10-28 18:38:03
1105	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-28 18:38:13	2018-10-28 18:38:13
1106	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:40:49	2018-10-28 18:40:49
1107	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:41:31	2018-10-28 18:41:31
1108	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:41:42	2018-10-28 18:41:42
1109	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:41:54	2018-10-28 18:41:54
1110	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:42:01	2018-10-28 18:42:01
1111	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-10-28 18:42:03	2018-10-28 18:42:03
1112	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 18:42:17	2018-10-28 18:42:17
1113	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 18:42:18	2018-10-28 18:42:18
1114	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:42:22	2018-10-28 18:42:22
1115	2	PopCity/resource/tilesets/71/edit	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/71\\/edit","_pjax":"#pjax-container"}	2018-10-28 18:42:25	2018-10-28 18:42:25
1116	2	PopCity/resource/tilesets/71	PUT	192.168.3.234	{"name":"\\u4e0a\\u865e\\u6c34\\u5c1a\\u540d\\u90fd","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/sy-shuishangmingdu_cesium\\/Scene\\/symshuishangmingdu_cesium.json","description":"\\u4e0a\\u865e","icon":null,"img":null,"old_group":null,"new_group":[null],"_token":"a2AZ5x1KgKtamxrDS8Fqbwl5ewFVVjHoW4SDvSmK","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets\\/71"}	2018-10-28 18:42:29	2018-10-28 18:42:29
1117	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-28 18:42:29	2018-10-28 18:42:29
1118	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 18:42:29	2018-10-28 18:42:29
1119	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:42:48	2018-10-28 18:42:48
1120	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:43:20	2018-10-28 18:43:20
1121	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:43:31	2018-10-28 18:43:31
1122	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:44:28	2018-10-28 18:44:28
1123	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:44:45	2018-10-28 18:44:45
1124	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:45:07	2018-10-28 18:45:07
1125	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:45:29	2018-10-28 18:45:29
1126	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:46:34	2018-10-28 18:46:34
1127	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:46:50	2018-10-28 18:46:50
1128	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:46:59	2018-10-28 18:46:59
1129	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:47:06	2018-10-28 18:47:06
1130	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:47:31	2018-10-28 18:47:31
1131	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:47:40	2018-10-28 18:47:40
1132	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:47:51	2018-10-28 18:47:51
1133	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:47:59	2018-10-28 18:47:59
1134	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:49:28	2018-10-28 18:49:28
1135	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:50:08	2018-10-28 18:50:08
1136	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:50:27	2018-10-28 18:50:27
1137	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:55:04	2018-10-28 18:55:04
1138	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"PopCity \\u7ba1\\u7406\\u5e73\\u53f0","webConfVer":"1.0","webConfCount":"10","s":"\\/PopCity\\/web-config"}	2018-10-28 18:55:11	2018-10-28 18:55:11
1139	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:55:11	2018-10-28 18:55:11
1140	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:57:54	2018-10-28 18:57:54
1141	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:58:21	2018-10-28 18:58:21
1142	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:58:44	2018-10-28 18:58:44
1143	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:58:47	2018-10-28 18:58:47
1144	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f0","webConfVer":"1.0","webConfCount":"10","s":"\\/PopCity\\/web-config"}	2018-10-28 18:58:54	2018-10-28 18:58:54
1145	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:58:54	2018-10-28 18:58:54
1146	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-28 18:58:58	2018-10-28 18:58:58
1147	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f0","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 18:59:07	2018-10-28 18:59:07
1148	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:59:07	2018-10-28 18:59:07
1149	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 18:59:38	2018-10-28 18:59:38
1150	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:38	2018-10-28 19:01:38
1151	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f01","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:44	2018-10-28 19:01:44
1152	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:44	2018-10-28 19:01:44
1153	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:46	2018-10-28 19:01:46
1154	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f012","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:53	2018-10-28 19:01:53
1155	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:53	2018-10-28 19:01:53
1156	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f0124","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:59	2018-10-28 19:01:59
1157	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:01:59	2018-10-28 19:01:59
1158	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f01245","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 19:02:04	2018-10-28 19:02:04
1159	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:02:05	2018-10-28 19:02:05
1160	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:02:40	2018-10-28 19:02:40
1161	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:02:49	2018-10-28 19:02:49
1162	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:03:10	2018-10-28 19:03:10
1163	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 19:03:18	2018-10-28 19:03:18
1164	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-28 19:03:26	2018-10-28 19:03:26
1165	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-28 19:03:36	2018-10-28 19:03:36
1166	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 19:03:40	2018-10-28 19:03:40
1167	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 19:03:40	2018-10-28 19:03:40
1168	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-28 19:03:46	2018-10-28 19:03:46
1169	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-10-28 19:04:00	2018-10-28 19:04:00
1170	2	PopCity/toolbars/2/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars\\/2\\/edit","_pjax":"#pjax-container"}	2018-10-28 19:05:19	2018-10-28 19:05:19
1171	2	PopCity/toolbars/2	PUT	192.168.3.22	{"type":"tilesets","name":"\\u57ce\\u5e02\\u5b9e\\u666f","icon":"fa-pencil","img":"fa-pencil","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","_method":"PUT","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/toolbars","s":"\\/PopCity\\/toolbars\\/2"}	2018-10-28 19:05:32	2018-10-28 19:05:32
1172	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars"}	2018-10-28 19:05:32	2018-10-28 19:05:32
1173	2	PopCity/angles	GET	192.168.3.22	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-10-28 19:07:28	2018-10-28 19:07:28
1174	2	PopCity/patterns	GET	192.168.3.22	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-10-28 19:07:37	2018-10-28 19:07:37
1175	2	PopCity/file_system	GET	192.168.3.22	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-10-28 19:08:13	2018-10-28 19:08:13
1176	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-28 19:08:16	2018-10-28 19:08:16
1177	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-28 19:08:28	2018-10-28 19:08:28
1178	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-28 19:08:30	2018-10-28 19:08:30
1179	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-28 19:08:35	2018-10-28 19:08:35
1180	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 19:08:38	2018-10-28 19:08:38
1181	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 19:08:38	2018-10-28 19:08:38
1182	2	PopCity/resource/tilesets/create	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-10-28 19:08:44	2018-10-28 19:08:44
1183	2	PopCity/resource/tilesets	POST	192.168.3.22	{"name":"32","url":"32","description":"32","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"off","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-28 19:08:49	2018-10-28 19:08:49
1184	2	PopCity/resource/tilesets/create	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-28 19:08:50	2018-10-28 19:08:50
1185	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 19:09:52	2018-10-28 19:09:52
1186	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 19:09:52	2018-10-28 19:09:52
1187	2	PopCity/resource/tilesets/79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60	DELETE	192.168.3.22	{"_method":"delete","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","s":"\\/PopCity\\/resource\\/tilesets\\/79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60"}	2018-10-28 19:10:00	2018-10-28 19:10:00
1188	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 19:10:01	2018-10-28 19:10:01
1189	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 19:10:01	2018-10-28 19:10:01
1190	2	PopCity/resource/tilesets/59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40	DELETE	192.168.3.22	{"_method":"delete","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","s":"\\/PopCity\\/resource\\/tilesets\\/59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40"}	2018-10-28 19:10:08	2018-10-28 19:10:08
1191	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-28 19:10:08	2018-10-28 19:10:08
1192	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-28 19:10:08	2018-10-28 19:10:08
1193	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-10-28 19:11:35	2018-10-28 19:11:35
1194	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-28 21:01:14	2018-10-28 21:01:14
1195	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-10-28 21:06:33	2018-10-28 21:06:33
1196	2	PopCity/web-config	POST	192.168.3.22	{"_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","webConfName":"\\u7ba1\\u7406\\u5e73\\u53f0","webConfVer":"1.0","webConfCount":"15","s":"\\/PopCity\\/web-config"}	2018-10-28 21:06:39	2018-10-28 21:06:39
1197	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 21:06:39	2018-10-28 21:06:39
1198	2	PopCity/web-config	GET	192.168.3.22	{"s":"\\/PopCity\\/web-config"}	2018-10-28 21:07:31	2018-10-28 21:07:31
1199	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-28 21:08:30	2018-10-28 21:08:30
1200	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-28 21:08:31	2018-10-28 21:08:31
1201	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-28 21:08:32	2018-10-28 21:08:32
1202	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-28 21:08:33	2018-10-28 21:08:33
1203	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-28 21:08:36	2018-10-28 21:08:36
1204	2	PopCity/auth/logs	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/logs","_pjax":"#pjax-container"}	2018-10-28 21:08:37	2018-10-28 21:08:37
1205	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-28 21:08:39	2018-10-28 21:08:39
1206	2	PopCity/login-info/38,37,36,35,34,33,32,31,30,29,28,24,27,26,25,22,21,23,20,16	DELETE	192.168.3.22	{"_method":"delete","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","s":"\\/PopCity\\/login-info\\/38,37,36,35,34,33,32,31,30,29,28,24,27,26,25,22,21,23,20,16"}	2018-10-28 21:08:50	2018-10-28 21:08:50
1207	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-28 21:08:50	2018-10-28 21:08:50
1208	2	PopCity/login-info/19,18,17,15,13,14,12,11,10,9,8,7,6,5,4,3,2,1	DELETE	192.168.3.22	{"_method":"delete","_token":"vMfzpkm3GjmBlQE2GNQnPvYneDOosUqzsthvdkWb","s":"\\/PopCity\\/login-info\\/19,18,17,15,13,14,12,11,10,9,8,7,6,5,4,3,2,1"}	2018-10-28 21:08:58	2018-10-28 21:08:58
1209	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-28 21:08:58	2018-10-28 21:08:58
1210	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info"}	2018-10-28 21:09:01	2018-10-28 21:09:01
1211	2	PopCity/toolbars	GET	192.168.3.22	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-10-28 21:09:04	2018-10-28 21:09:04
1212	2	PopCity/login-info	GET	192.168.3.22	{"s":"\\/PopCity\\/login-info","_pjax":"#pjax-container"}	2018-10-28 21:09:07	2018-10-28 21:09:07
1213	2	PopCity/auth/logs	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/logs","_pjax":"#pjax-container"}	2018-10-28 21:09:08	2018-10-28 21:09:08
1214	2	PopCity/auth/menu	GET	192.168.3.22	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-10-28 21:09:11	2018-10-28 21:09:11
1215	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-28 21:10:02	2018-10-28 21:10:02
1216	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-28 21:11:44	2018-10-28 21:11:44
1217	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-28 21:11:45	2018-10-28 21:11:45
1218	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-28 21:11:46	2018-10-28 21:11:46
1219	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-28 21:11:47	2018-10-28 21:11:47
1220	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-28 21:11:48	2018-10-28 21:11:48
1221	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-28 21:11:52	2018-10-28 21:11:52
1222	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-28 21:11:53	2018-10-28 21:11:53
1223	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-28 21:11:54	2018-10-28 21:11:54
1224	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-28 21:11:55	2018-10-28 21:11:55
1225	2	PopCity/pois/index	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-10-28 21:11:55	2018-10-28 21:11:55
1226	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-10-28 21:11:56	2018-10-28 21:11:56
1227	2	PopCity/pois/type	GET	192.168.3.22	{"s":"\\/PopCity\\/pois\\/type"}	2018-10-29 08:52:55	2018-10-29 08:52:55
1228	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 08:53:02	2018-10-29 08:53:02
1229	2	PopCity/resource/images/72/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images\\/72\\/edit","_pjax":"#pjax-container"}	2018-10-29 08:53:05	2018-10-29 08:53:05
1230	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 08:53:40	2018-10-29 08:53:40
1231	2	PopCity/resource/images/58/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images\\/58\\/edit","_pjax":"#pjax-container"}	2018-10-29 08:53:44	2018-10-29 08:53:44
1232	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 08:54:52	2018-10-29 08:54:52
1233	2	PopCity/resource/images/56/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images\\/56\\/edit","_pjax":"#pjax-container"}	2018-10-29 08:54:56	2018-10-29 08:54:56
1234	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 08:55:56	2018-10-29 08:55:56
1235	2	PopCity/resource/images/55/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images\\/55\\/edit","_pjax":"#pjax-container"}	2018-10-29 08:56:04	2018-10-29 08:56:04
1236	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 08:56:59	2018-10-29 08:56:59
1237	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 09:01:36	2018-10-29 09:01:36
1238	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 09:01:40	2018-10-29 09:01:40
1239	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 09:01:40	2018-10-29 09:01:40
1240	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"2"}	2018-10-29 09:01:43	2018-10-29 09:01:43
1241	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 09:01:43	2018-10-29 09:01:43
1242	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"1"}	2018-10-29 09:01:46	2018-10-29 09:01:46
1243	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 09:01:46	2018-10-29 09:01:46
1244	2	PopCity	GET	192.168.3.236	{"s":"\\/PopCity\\/"}	2018-10-29 11:29:28	2018-10-29 11:29:28
1245	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 11:29:39	2018-10-29 11:29:39
1246	2	PopCity/resource/tileset-group/1/edit	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group\\/1\\/edit","_pjax":"#pjax-container"}	2018-10-29 11:29:45	2018-10-29 11:29:45
1247	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 11:29:49	2018-10-29 11:29:49
1248	2	PopCity/resource/tileset-group/13/edit	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group\\/13\\/edit","_pjax":"#pjax-container"}	2018-10-29 11:29:54	2018-10-29 11:29:54
1249	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 11:29:57	2018-10-29 11:29:57
1250	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 11:30:09	2018-10-29 11:30:09
1251	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:30:09	2018-10-29 11:30:09
1252	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"2"}	2018-10-29 11:30:16	2018-10-29 11:30:16
1253	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:30:16	2018-10-29 11:30:16
1254	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"1"}	2018-10-29 11:30:21	2018-10-29 11:30:21
1255	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:30:21	2018-10-29 11:30:21
1256	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 11:30:49	2018-10-29 11:30:49
1257	2	PopCity/resource/tileset-group/13/edit	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group\\/13\\/edit","_pjax":"#pjax-container"}	2018-10-29 11:30:55	2018-10-29 11:30:55
1258	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 11:30:58	2018-10-29 11:30:58
1259	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 11:31:19	2018-10-29 11:31:19
1260	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:31:19	2018-10-29 11:31:19
1261	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"2"}	2018-10-29 11:31:25	2018-10-29 11:31:25
1262	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:31:25	2018-10-29 11:31:25
1263	2	PopCity/resource/tilesets/create	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-10-29 11:31:30	2018-10-29 11:31:30
1264	2	PopCity/resource/tilesets	POST	192.168.3.236	{"name":"\\u4e0a\\u865e1","url":"http:\\/\\/192.168.3.228:8090\\/sources\\/sy\\/sy1\\/tileset.json","description":"shangyu","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"off","_token":"GdPyGJc6DyuG50urST3JJH6185OzMaxKUih0diR4","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=2","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-29 11:32:24	2018-10-29 11:32:24
1265	2	PopCity/resource/tilesets/create	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-29 11:32:24	2018-10-29 11:32:24
1266	2	PopCity	GET	192.168.3.236	{"s":"\\/PopCity\\/"}	2018-10-29 11:37:33	2018-10-29 11:37:33
1267	2	PopCity/resource/tilesets	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 11:37:40	2018-10-29 11:37:40
1268	2	PopCity/resource/tileset-group	GET	192.168.3.236	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 11:37:40	2018-10-29 11:37:40
1269	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-29 13:55:02	2018-10-29 13:55:02
1270	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 13:55:15	2018-10-29 13:55:15
1271	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-29 13:58:45	2018-10-29 13:58:45
1272	2	PopCity/setUserCacheData	POST	192.168.3.22	{"_token":"Q8B9HpK2Sas5AQgft5LP4B1Rl4gGvQLIfeLuVkz6","field":"dataCache","s":"\\/PopCity\\/setUserCacheData\\/"}	2018-10-29 13:58:47	2018-10-29 13:58:47
1273	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings"}	2018-10-29 14:30:54	2018-10-29 14:30:54
1274	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 14:33:57	2018-10-29 14:33:57
1275	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"on","_token":"Q8B9HpK2Sas5AQgft5LP4B1Rl4gGvQLIfeLuVkz6","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 14:38:25	2018-10-29 14:38:25
1276	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"off","_token":"Q8B9HpK2Sas5AQgft5LP4B1Rl4gGvQLIfeLuVkz6","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 14:38:30	2018-10-29 14:38:30
1277	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity"}	2018-10-29 17:24:53	2018-10-29 17:24:53
1278	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:37:08	2018-10-29 17:37:08
1279	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:37:09	2018-10-29 17:37:09
1280	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:37:09	2018-10-29 17:37:09
1281	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:37:13	2018-10-29 17:37:13
1282	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:37:13	2018-10-29 17:37:13
1283	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:37:14	2018-10-29 17:37:14
1284	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:37:16	2018-10-29 17:37:16
1285	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:37:17	2018-10-29 17:37:17
1286	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:37:17	2018-10-29 17:37:17
1287	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"39","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 17:37:33	2018-10-29 17:37:33
1288	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:37:34	2018-10-29 17:37:34
1289	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:37:34	2018-10-29 17:37:34
1290	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 17:38:19	2018-10-29 17:38:19
1291	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"on","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 17:38:29	2018-10-29 17:38:29
1292	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"off","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 17:38:32	2018-10-29 17:38:32
1293	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images"}	2018-10-29 17:51:39	2018-10-29 17:51:39
1294	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-29 17:51:41	2018-10-29 17:51:41
1295	2	PopCity/setUserCacheData	POST	192.168.3.22	{"_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","field":"dataCache","s":"\\/PopCity\\/setUserCacheData\\/"}	2018-10-29 17:51:42	2018-10-29 17:51:42
1296	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 17:52:05	2018-10-29 17:52:05
1297	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"on","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 17:52:06	2018-10-29 17:52:06
1298	2	PopCity/resource/images/57	PUT	192.168.3.22	{"per":"off","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/images\\/57"}	2018-10-29 17:52:24	2018-10-29 17:52:24
1299	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-29 17:53:44	2018-10-29 17:53:44
1300	2	PopCity/resource/images	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-29 17:54:20	2018-10-29 17:54:20
1301	2	PopCity/resource/terrains	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-29 17:54:20	2018-10-29 17:54:20
1302	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:54:22	2018-10-29 17:54:22
1303	2	PopCity	GET	192.168.3.22	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-10-29 17:54:23	2018-10-29 17:54:23
1304	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:54:26	2018-10-29 17:54:26
1305	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:54:33	2018-10-29 17:54:33
1306	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:54:33	2018-10-29 17:54:33
1307	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:54:33	2018-10-29 17:54:33
1308	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 17:54:45	2018-10-29 17:54:45
1309	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:54:45	2018-10-29 17:54:45
1310	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:54:45	2018-10-29 17:54:45
1311	2	PopCity/resource/tilesets/37	PUT	192.168.3.22	{"per":"off","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/37"}	2018-10-29 17:56:14	2018-10-29 17:56:14
1312	2	PopCity/resource/tilesets/37	PUT	192.168.3.22	{"per":"on","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/37"}	2018-10-29 17:56:43	2018-10-29 17:56:43
1313	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:57:09	2018-10-29 17:57:09
1314	2	PopCity/resource/tilesets/36	PUT	192.168.3.22	{"_method":"PUT","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","per":"off","s":"\\/PopCity\\/resource\\/tilesets\\/36"}	2018-10-29 17:57:15	2018-10-29 17:57:15
1315	2	PopCity/resource/tilesets/36	PUT	192.168.3.22	{"_method":"PUT","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","per":"on","s":"\\/PopCity\\/resource\\/tilesets\\/36"}	2018-10-29 17:57:31	2018-10-29 17:57:31
1316	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:58:03	2018-10-29 17:58:03
1317	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:58:03	2018-10-29 17:58:03
1318	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 17:58:10	2018-10-29 17:58:10
1319	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 17:58:11	2018-10-29 17:58:11
1320	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 17:58:11	2018-10-29 17:58:11
1321	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 17:58:32	2018-10-29 17:58:32
1322	2	PopCity/settings	GET	192.168.3.22	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-10-29 17:58:49	2018-10-29 17:58:49
1323	2	PopCity/users/index	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-10-29 17:58:50	2018-10-29 17:58:50
1324	2	PopCity/showUserRole/1	GET	192.168.3.22	{"s":"\\/PopCity\\/showUserRole\\/1","_pjax":"#pjax-container"}	2018-10-29 17:58:55	2018-10-29 17:58:55
1325	2	PopCity/showRolePer/1	GET	192.168.3.22	{"s":"\\/PopCity\\/showRolePer\\/1","_previous_":"http:\\/\\/192.168.3.22:12345\\/PopCity\\/showUserRole\\/1","_pjax":"#pjax-container"}	2018-10-29 17:58:57	2018-10-29 17:58:57
1326	2	PopCity/addRolePer/1	GET	192.168.3.22	{"s":"\\/PopCity\\/addRolePer\\/1","_pjax":"#pjax-container"}	2018-10-29 17:58:59	2018-10-29 17:58:59
1327	2	PopCity/storeRolePer/1	POST	192.168.3.22	{"_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","pers":["236"],"s":"\\/PopCity\\/storeRolePer\\/1"}	2018-10-29 17:59:06	2018-10-29 17:59:06
1328	2	PopCity/showRolePer/1	GET	192.168.3.22	{"s":"\\/PopCity\\/showRolePer\\/1"}	2018-10-29 17:59:06	2018-10-29 17:59:06
1329	2	PopCity/users/permission	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-10-29 18:03:08	2018-10-29 18:03:08
1330	2	PopCity/users/role	GET	192.168.3.22	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-10-29 18:03:08	2018-10-29 18:03:08
1331	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:03:12	2018-10-29 18:03:12
1332	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:03:12	2018-10-29 18:03:12
1333	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:03:17	2018-10-29 18:03:17
1334	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:03:17	2018-10-29 18:03:17
1335	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:03:17	2018-10-29 18:03:17
1336	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:04:25	2018-10-29 18:04:25
1337	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:04:26	2018-10-29 18:04:26
1338	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:04:26	2018-10-29 18:04:26
1339	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:04:49	2018-10-29 18:04:49
1340	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:04:49	2018-10-29 18:04:49
1341	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:04:49	2018-10-29 18:04:49
1342	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 18:11:44	2018-10-29 18:11:44
1343	2	PopCity/resource/tileset-group/13/edit	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group\\/13\\/edit","_pjax":"#pjax-container"}	2018-10-29 18:11:47	2018-10-29 18:11:47
1344	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-29 18:11:53	2018-10-29 18:11:53
1345	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:12:02	2018-10-29 18:12:02
1346	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:12:03	2018-10-29 18:12:03
1347	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:12:22	2018-10-29 18:12:22
1348	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:12:22	2018-10-29 18:12:22
1349	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:12:22	2018-10-29 18:12:22
1350	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:12:39	2018-10-29 18:12:39
1351	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:12:40	2018-10-29 18:12:40
1352	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:12:40	2018-10-29 18:12:40
1353	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:13:04	2018-10-29 18:13:04
1354	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:13:04	2018-10-29 18:13:04
1355	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:13:04	2018-10-29 18:13:04
1356	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:13:17	2018-10-29 18:13:17
1357	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:13:17	2018-10-29 18:13:17
1358	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:13:18	2018-10-29 18:13:18
1359	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:14:01	2018-10-29 18:14:01
1360	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:14:01	2018-10-29 18:14:01
1361	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:14:01	2018-10-29 18:14:01
1362	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:14:11	2018-10-29 18:14:11
1363	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:14:12	2018-10-29 18:14:12
1364	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:14:12	2018-10-29 18:14:12
1365	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:14:53	2018-10-29 18:14:53
1366	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:14:54	2018-10-29 18:14:54
1367	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:14:54	2018-10-29 18:14:54
1368	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:15:13	2018-10-29 18:15:13
1369	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:15:13	2018-10-29 18:15:13
1370	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:15:13	2018-10-29 18:15:13
1371	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":"\\u7ecd\\u5174","id":"11","select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:15:37	2018-10-29 18:15:37
1372	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:15:37	2018-10-29 18:15:37
1373	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:15:38	2018-10-29 18:15:38
1374	2	PopCity/resource/tileset-into-group	PUT	192.168.3.22	{"_method":"put","_token":"iSqvEClBBSA9hVbn0rPRekXazaLGXNQRTvv6igKN","name":null,"id":null,"select":"38","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-10-29 18:16:23	2018-10-29 18:16:23
1375	2	PopCity/resource/tilesets	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-29 18:16:23	2018-10-29 18:16:23
1376	2	PopCity/resource/tileset-group	GET	192.168.3.22	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-29 18:16:23	2018-10-29 18:16:23
1377	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-10-30 13:21:40	2018-10-30 13:21:40
1479	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings"}	2018-11-14 15:38:21	2018-11-14 15:38:21
1378	2	PopCity/resource/images	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-30 13:21:46	2018-10-30 13:21:46
1379	2	PopCity/resource/images/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images\\/create","_pjax":"#pjax-container"}	2018-10-30 13:21:47	2018-10-30 13:21:47
1380	2	PopCity/resource/images/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images\\/create"}	2018-10-30 13:22:28	2018-10-30 13:22:28
1381	2	PopCity/resource/images	POST	127.0.0.1	{"name":"1","url":"1","description":"1","layer":null,"style":null,"format":null,"tilematrixsetid":null,"level":null,"visiblelevel":null,"type":null,"ellipsoid":null,"img":"fa-pencil","maxlevel":null,"forUser":[null],"forRole":[null],"isAddPer":"on","_token":"3bGc3oRp4Fov196RPMn6Ot95nZjxbSWhQaKSpBsc","s":"\\/PopCity\\/resource\\/images"}	2018-10-30 13:22:38	2018-10-30 13:22:38
1382	2	PopCity/resource/images	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images"}	2018-10-30 13:22:38	2018-10-30 13:22:38
1383	2	PopCity/resource/images/1	DELETE	127.0.0.1	{"_method":"delete","_token":"3bGc3oRp4Fov196RPMn6Ot95nZjxbSWhQaKSpBsc","s":"\\/PopCity\\/resource\\/images\\/1"}	2018-10-30 13:22:43	2018-10-30 13:22:43
1384	2	PopCity/resource/images	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-10-30 13:22:44	2018-10-30 13:22:44
1385	2	PopCity/resource/terrains	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-10-30 13:23:06	2018-10-30 13:23:06
1386	2	PopCity/resource/terrains/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/terrains\\/create","_pjax":"#pjax-container"}	2018-10-30 13:23:08	2018-10-30 13:23:08
1387	2	PopCity/resource/terrains/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/terrains\\/create"}	2018-10-30 13:23:27	2018-10-30 13:23:27
1388	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-10-30 13:23:49	2018-10-30 13:23:49
1389	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:23:52	2018-10-30 13:23:52
1390	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:23:53	2018-10-30 13:23:53
1391	2	PopCity/resource/tilesets/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-10-30 13:23:56	2018-10-30 13:23:56
1392	2	PopCity/resource/tilesets	POST	127.0.0.1	{"name":"1","url":"1","description":"1","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"3bGc3oRp4Fov196RPMn6Ot95nZjxbSWhQaKSpBsc","_previous_":"http:\\/\\/127.0.0.1:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-30 13:24:01	2018-10-30 13:24:01
1393	2	PopCity/resource/tilesets/create	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-10-30 13:24:01	2018-10-30 13:24:01
1394	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:24:07	2018-10-30 13:24:07
1395	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:24:07	2018-10-30 13:24:07
1396	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-30 13:24:08	2018-10-30 13:24:08
1397	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:24:09	2018-10-30 13:24:09
1398	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:25:50	2018-10-30 13:25:50
1399	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:25:50	2018-10-30 13:25:50
1400	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:25:56	2018-10-30 13:25:56
1401	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:25:56	2018-10-30 13:25:56
1402	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:25:58	2018-10-30 13:25:58
1403	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:25:58	2018-10-30 13:25:58
1404	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:01	2018-10-30 13:26:01
1405	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:01	2018-10-30 13:26:01
1406	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:04	2018-10-30 13:26:04
1407	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:05	2018-10-30 13:26:05
1408	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:34	2018-10-30 13:26:34
1409	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:34	2018-10-30 13:26:34
1410	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:37	2018-10-30 13:26:37
1411	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:37	2018-10-30 13:26:37
1412	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:38	2018-10-30 13:26:38
1413	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:38	2018-10-30 13:26:38
1414	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:39	2018-10-30 13:26:39
1415	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:39	2018-10-30 13:26:39
1416	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:53	2018-10-30 13:26:53
1417	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:53	2018-10-30 13:26:53
1418	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:55	2018-10-30 13:26:55
1419	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:55	2018-10-30 13:26:55
1420	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:26:58	2018-10-30 13:26:58
1421	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:26:58	2018-10-30 13:26:58
1422	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:27:01	2018-10-30 13:27:01
1423	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:27:02	2018-10-30 13:27:02
1424	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:27:03	2018-10-30 13:27:03
1425	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:27:03	2018-10-30 13:27:03
1426	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:27:04	2018-10-30 13:27:04
1427	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:27:04	2018-10-30 13:27:04
1428	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:27:10	2018-10-30 13:27:10
1429	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:27:10	2018-10-30 13:27:10
1430	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:28:47	2018-10-30 13:28:47
1431	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:28:47	2018-10-30 13:28:47
1432	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-10-30 13:28:48	2018-10-30 13:28:48
1433	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:28:48	2018-10-30 13:28:48
1434	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-10-30 13:47:16	2018-10-30 13:47:16
1435	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-10-30 13:47:16	2018-10-30 13:47:16
1436	2	PopCity	GET	192.168.3.32	{"s":"\\/PopCity"}	2018-11-06 17:13:13	2018-11-06 17:13:13
1437	2	PopCity/users/index	GET	192.168.3.32	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-06 17:13:17	2018-11-06 17:13:17
1438	2	PopCity/users/role	GET	192.168.3.32	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-06 17:13:18	2018-11-06 17:13:18
1439	2	PopCity/users/permission	GET	192.168.3.32	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-06 17:13:19	2018-11-06 17:13:19
1440	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity\\/"}	2018-11-08 13:49:44	2018-11-08 13:49:44
1441	2	PopCity/users/permission	GET	192.168.3.254	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-08 13:49:48	2018-11-08 13:49:48
1442	2	PopCity/resource/images	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-08 13:50:42	2018-11-08 13:50:42
1443	2	PopCity/resource/images	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-08 13:50:42	2018-11-08 13:50:42
1444	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-08 13:50:48	2018-11-08 13:50:48
1445	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-08 13:50:48	2018-11-08 13:50:48
1446	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-08 13:51:42	2018-11-08 13:51:42
1447	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-08 13:51:51	2018-11-08 13:51:51
1448	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-08 13:51:52	2018-11-08 13:51:52
1449	2	PopCity	GET	192.168.3.3	{"s":"\\/PopCity"}	2018-11-14 15:35:47	2018-11-14 15:35:47
1450	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:35:51	2018-11-14 15:35:51
1451	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:35:54	2018-11-14 15:35:54
1452	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:35:56	2018-11-14 15:35:56
1453	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:35:58	2018-11-14 15:35:58
1454	2	PopCity	GET	192.168.3.3	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-11-14 15:35:59	2018-11-14 15:35:59
1455	2	PopCity/pois/index	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-11-14 15:36:02	2018-11-14 15:36:02
1456	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 15:36:03	2018-11-14 15:36:03
1457	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:03	2018-11-14 15:36:03
1458	2	PopCity/angles	GET	192.168.3.3	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-11-14 15:36:04	2018-11-14 15:36:04
1459	2	PopCity/resource/images	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-14 15:36:06	2018-11-14 15:36:06
1460	2	PopCity/resource/terrains	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-11-14 15:36:06	2018-11-14 15:36:06
1461	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:07	2018-11-14 15:36:07
1462	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:09	2018-11-14 15:36:09
1463	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:36:14	2018-11-14 15:36:14
1464	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:36:15	2018-11-14 15:36:15
1465	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:24	2018-11-14 15:36:24
1466	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:36:31	2018-11-14 15:36:31
1467	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:33	2018-11-14 15:36:33
1468	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:36:35	2018-11-14 15:36:35
1469	2	PopCity	GET	192.168.3.3	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-11-14 15:36:37	2018-11-14 15:36:37
1470	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:36:38	2018-11-14 15:36:38
1471	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:36:39	2018-11-14 15:36:39
1472	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:36:39	2018-11-14 15:36:39
1473	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:36:39	2018-11-14 15:36:39
1474	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:36:40	2018-11-14 15:36:40
1475	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:37:17	2018-11-14 15:37:17
1476	2	PopCity/settings	GET	192.168.3.234	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:37:30	2018-11-14 15:37:30
1477	2	PopCity/settings	GET	192.168.3.234	{"s":"\\/PopCity\\/settings"}	2018-11-14 15:37:30	2018-11-14 15:37:30
1478	2	PopCity/settings	GET	192.168.3.234	{"s":"\\/PopCity\\/settings"}	2018-11-14 15:37:45	2018-11-14 15:37:45
1480	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:38:23	2018-11-14 15:38:23
1481	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:38:24	2018-11-14 15:38:24
1482	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:38:25	2018-11-14 15:38:25
1483	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:38:26	2018-11-14 15:38:26
1484	2	PopCity	GET	192.168.3.3	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-11-14 15:38:26	2018-11-14 15:38:26
1485	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:38:27	2018-11-14 15:38:27
1486	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:38:28	2018-11-14 15:38:28
1487	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:38:28	2018-11-14 15:38:28
1488	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:38:29	2018-11-14 15:38:29
1489	2	PopCity/pois/index	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-11-14 15:38:32	2018-11-14 15:38:32
1490	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 15:38:32	2018-11-14 15:38:32
1491	2	PopCity/settings	GET	192.168.3.234	{"s":"\\/PopCity\\/settings"}	2018-11-14 15:40:03	2018-11-14 15:40:03
1492	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:06	2018-11-14 15:40:06
1493	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:10	2018-11-14 15:40:10
1494	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:12	2018-11-14 15:40:12
1495	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:13	2018-11-14 15:40:13
1496	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:13	2018-11-14 15:40:13
1497	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:14	2018-11-14 15:40:14
1498	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:15	2018-11-14 15:40:15
1499	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:49	2018-11-14 15:40:49
1500	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:40:53	2018-11-14 15:40:53
1501	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 15:41:03	2018-11-14 15:41:03
1502	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:41:09	2018-11-14 15:41:09
1503	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:41:10	2018-11-14 15:41:10
1504	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:41:47	2018-11-14 15:41:47
1505	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:42:09	2018-11-14 15:42:09
1506	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:42:23	2018-11-14 15:42:23
1507	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:42:48	2018-11-14 15:42:48
1508	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:36	2018-11-14 15:43:36
1509	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:37	2018-11-14 15:43:37
1510	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:38	2018-11-14 15:43:38
1511	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:39	2018-11-14 15:43:39
1512	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:48	2018-11-14 15:43:48
1513	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:43:49	2018-11-14 15:43:49
1514	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:44:15	2018-11-14 15:44:15
1515	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:44:15	2018-11-14 15:44:15
1516	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:44:16	2018-11-14 15:44:16
1517	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:17	2018-11-14 15:46:17
1518	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:18	2018-11-14 15:46:18
1519	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:18	2018-11-14 15:46:18
1520	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:18	2018-11-14 15:46:18
1521	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:19	2018-11-14 15:46:19
1522	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:19	2018-11-14 15:46:19
1523	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:19	2018-11-14 15:46:19
1524	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:19	2018-11-14 15:46:19
1525	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:19	2018-11-14 15:46:19
1526	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:20	2018-11-14 15:46:20
1527	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:20	2018-11-14 15:46:20
1528	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:20	2018-11-14 15:46:20
1529	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:20	2018-11-14 15:46:20
1530	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:20	2018-11-14 15:46:20
1531	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:21	2018-11-14 15:46:21
1532	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:21	2018-11-14 15:46:21
1533	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:21	2018-11-14 15:46:21
1534	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:21	2018-11-14 15:46:21
1535	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:27	2018-11-14 15:46:27
1536	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:27	2018-11-14 15:46:27
1537	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:27	2018-11-14 15:46:27
1538	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:27	2018-11-14 15:46:27
1539	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:29	2018-11-14 15:46:29
1540	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:29	2018-11-14 15:46:29
1541	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:30	2018-11-14 15:46:30
1542	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:30	2018-11-14 15:46:30
1543	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:30	2018-11-14 15:46:30
1544	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:30	2018-11-14 15:46:30
1545	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:30	2018-11-14 15:46:30
1546	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:31	2018-11-14 15:46:31
1547	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:31	2018-11-14 15:46:31
1548	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:31	2018-11-14 15:46:31
1549	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:31	2018-11-14 15:46:31
1550	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:32	2018-11-14 15:46:32
1551	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:32	2018-11-14 15:46:32
1552	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:32	2018-11-14 15:46:32
1553	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:33	2018-11-14 15:46:33
1554	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:33	2018-11-14 15:46:33
1555	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:34	2018-11-14 15:46:34
1556	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:34	2018-11-14 15:46:34
1557	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:34	2018-11-14 15:46:34
1558	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:46:35	2018-11-14 15:46:35
1559	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:39	2018-11-14 15:46:39
1560	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:40	2018-11-14 15:46:40
1561	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:55	2018-11-14 15:46:55
1562	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:58	2018-11-14 15:46:58
1563	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:59	2018-11-14 15:46:59
1564	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:46:59	2018-11-14 15:46:59
1565	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:47:00	2018-11-14 15:47:00
1566	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 15:47:00	2018-11-14 15:47:00
1567	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:26	2018-11-14 15:48:26
1568	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:27	2018-11-14 15:48:27
1569	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:29	2018-11-14 15:48:29
1570	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:29	2018-11-14 15:48:29
1571	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:30	2018-11-14 15:48:30
1572	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:31	2018-11-14 15:48:31
1573	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:32	2018-11-14 15:48:32
1574	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:37	2018-11-14 15:48:37
1575	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type"}	2018-11-14 15:48:44	2018-11-14 15:48:44
1576	2	PopCity	GET	192.168.3.3	{"s":"\\/PopCity"}	2018-11-14 15:48:51	2018-11-14 15:48:51
1577	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 15:50:05	2018-11-14 15:50:05
1578	2	PopCity/pois/index	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-11-14 15:50:05	2018-11-14 15:50:05
1579	2	PopCity/pois/type	GET	192.168.3.3	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 15:50:10	2018-11-14 15:50:10
1580	2	PopCity/file_system	GET	192.168.3.3	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-11-14 15:50:11	2018-11-14 15:50:11
1581	2	PopCity/file_system	GET	192.168.3.3	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-11-14 15:50:12	2018-11-14 15:50:12
1582	2	PopCity/toolbars	GET	192.168.3.3	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 15:50:15	2018-11-14 15:50:15
1583	2	PopCity/patterns	GET	192.168.3.3	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-11-14 15:50:24	2018-11-14 15:50:24
1584	2	PopCity/angles	GET	192.168.3.3	{"s":"\\/PopCity\\/angles","_pjax":"#pjax-container"}	2018-11-14 15:50:25	2018-11-14 15:50:25
1585	2	PopCity/file_system	GET	192.168.3.3	{"s":"\\/PopCity\\/file_system","_pjax":"#pjax-container"}	2018-11-14 15:50:26	2018-11-14 15:50:26
1586	2	PopCity/file_system	GET	192.168.3.3	{"s":"\\/PopCity\\/file_system"}	2018-11-14 15:51:14	2018-11-14 15:51:14
1587	2	PopCity/file_system	GET	192.168.3.3	{"s":"\\/PopCity\\/file_system"}	2018-11-14 15:51:15	2018-11-14 15:51:15
1588	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 15:52:25	2018-11-14 15:52:25
1589	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:52:25	2018-11-14 15:52:25
1590	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:52:27	2018-11-14 15:52:27
1591	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-14 15:52:57	2018-11-14 15:52:57
1592	2	PopCity/resource/tileset-group/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group\\/create","_pjax":"#pjax-container"}	2018-11-14 15:53:05	2018-11-14 15:53:05
1593	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-14 15:53:18	2018-11-14 15:53:18
1594	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 15:53:30	2018-11-14 15:53:30
1595	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:53:30	2018-11-14 15:53:30
1596	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"2"}	2018-11-14 15:53:34	2018-11-14 15:53:34
1597	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:53:34	2018-11-14 15:53:34
1598	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"1"}	2018-11-14 15:53:36	2018-11-14 15:53:36
1599	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:53:36	2018-11-14 15:53:36
1600	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:53:46	2018-11-14 15:53:46
1601	2	PopCity/resource/tilesets	POST	192.168.3.3	{"name":"1","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block13_cesium\\/Scene\\/symblock13_cesium.json","description":"1","icon":null,"img":null,"old_group":"13","new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=1","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:53:59	2018-11-14 15:53:59
1602	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-11-14 15:53:59	2018-11-14 15:53:59
1603	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 15:54:18	2018-11-14 15:54:18
1604	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:54:19	2018-11-14 15:54:19
1605	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container","page":"2"}	2018-11-14 15:54:41	2018-11-14 15:54:41
1606	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:54:41	2018-11-14 15:54:41
1607	2	PopCity/resource/tilesets/5,4,3,2,1	DELETE	192.168.3.3	{"_method":"delete","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","s":"\\/PopCity\\/resource\\/tilesets\\/5,4,3,2,1"}	2018-11-14 15:54:49	2018-11-14 15:54:49
1608	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"2","_pjax":"#pjax-container"}	2018-11-14 15:54:49	2018-11-14 15:54:49
1609	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1","_pjax":"#pjax-container"}	2018-11-14 15:54:49	2018-11-14 15:54:49
1610	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:54:49	2018-11-14 15:54:49
1611	2	PopCity/resource/tilesets/39,38,37,36,35,34,32,31,30,29,28,27,25,24,23,22,21,20,19,6	DELETE	192.168.3.3	{"_method":"delete","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","s":"\\/PopCity\\/resource\\/tilesets\\/39,38,37,36,35,34,32,31,30,29,28,27,25,24,23,22,21,20,19,6"}	2018-11-14 15:54:53	2018-11-14 15:54:53
1612	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1","_pjax":"#pjax-container"}	2018-11-14 15:54:54	2018-11-14 15:54:54
1613	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:54:54	2018-11-14 15:54:54
1614	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:54:57	2018-11-14 15:54:57
1615	2	PopCity/resource/tilesets	POST	192.168.3.3	{"name":"1","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block13_cesium\\/Scene\\/symblock13_cesium.json","description":"1","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=1","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:55:02	2018-11-14 15:55:02
1616	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1"}	2018-11-14 15:55:02	2018-11-14 15:55:02
1617	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:55:02	2018-11-14 15:55:02
1618	2	PopCity/resource/tileset-into-group	PUT	192.168.3.3	{"_method":"put","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","name":"\\u4e0a\\u865e","id":"13","select":"7","s":"\\/PopCity\\/resource\\/tileset-into-group"}	2018-11-14 15:55:09	2018-11-14 15:55:09
1619	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1","_pjax":"#pjax-container"}	2018-11-14 15:55:09	2018-11-14 15:55:09
1620	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:55:09	2018-11-14 15:55:09
1621	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:55:13	2018-11-14 15:55:13
1622	2	PopCity/resource/tilesets	POST	192.168.3.3	{"name":"2","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block14_cesium\\/Scene\\/symblock14_cesium.json","description":"2","icon":null,"img":null,"old_group":"13","new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=1","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:55:47	2018-11-14 15:55:47
1623	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1"}	2018-11-14 15:55:47	2018-11-14 15:55:47
1624	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:55:47	2018-11-14 15:55:47
1625	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:55:49	2018-11-14 15:55:49
1626	2	PopCity/resource/tilesets	POST	192.168.3.3	{"name":"3","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block15_cesium\\/Scene\\/symblock15_cesium.json","description":"3","icon":null,"img":null,"old_group":"13","new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=1","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:56:00	2018-11-14 15:56:00
1627	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1"}	2018-11-14 15:56:00	2018-11-14 15:56:00
1628	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:56:01	2018-11-14 15:56:01
1629	2	PopCity/resource/tilesets/create	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 15:56:02	2018-11-14 15:56:02
1630	2	PopCity/resource/tilesets	POST	192.168.3.3	{"name":"4","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block16_cesium\\/Scene\\/symblock16_cesium.json","description":"4","icon":null,"img":null,"old_group":"13","new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets?s=%2FPopCity%2Fresource%2Ftilesets&page=1","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 15:56:18	2018-11-14 15:56:18
1631	2	PopCity/resource/tilesets	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tilesets","page":"1"}	2018-11-14 15:56:18	2018-11-14 15:56:18
1632	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 15:56:18	2018-11-14 15:56:18
1633	2	PopCity/resource/tileset-group	GET	192.168.3.3	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-14 15:56:25	2018-11-14 15:56:25
1634	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:56:31	2018-11-14 15:56:31
1635	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:56:38	2018-11-14 15:56:38
1636	2	PopCity/showUserPer/1	GET	192.168.3.3	{"s":"\\/PopCity\\/showUserPer\\/1","_pjax":"#pjax-container"}	2018-11-14 15:56:41	2018-11-14 15:56:41
1637	2	PopCity/addUserPer/1	GET	192.168.3.3	{"s":"\\/PopCity\\/addUserPer\\/1","_pjax":"#pjax-container"}	2018-11-14 15:56:43	2018-11-14 15:56:43
1638	2	PopCity/storeUserPer/1	POST	192.168.3.3	{"_token":"0Urt6g0tnCXB3b0gepNNnDRylJFwlz0YglwscPdA","pers":["273"],"s":"\\/PopCity\\/storeUserPer\\/1"}	2018-11-14 15:56:47	2018-11-14 15:56:47
1639	2	PopCity/showUserPer/1	GET	192.168.3.3	{"s":"\\/PopCity\\/showUserPer\\/1"}	2018-11-14 15:56:47	2018-11-14 15:56:47
1640	2	PopCity/showUserPer/1	GET	192.168.3.3	{"s":"\\/PopCity\\/showUserPer\\/1"}	2018-11-14 15:57:21	2018-11-14 15:57:21
1641	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:57:23	2018-11-14 15:57:23
1642	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:57:24	2018-11-14 15:57:24
1643	2	PopCity/users/role	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-14 15:57:27	2018-11-14 15:57:27
1644	2	PopCity/users/index	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 15:57:28	2018-11-14 15:57:28
1645	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:57:29	2018-11-14 15:57:29
1646	2	PopCity/settings	GET	192.168.3.3	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-14 15:57:31	2018-11-14 15:57:31
1647	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 15:57:33	2018-11-14 15:57:33
1648	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:58:44	2018-11-14 15:58:44
1649	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:58:48	2018-11-14 15:58:48
1650	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:58:52	2018-11-14 15:58:52
1651	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:58:52	2018-11-14 15:58:52
1652	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:58:53	2018-11-14 15:58:53
1653	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:09	2018-11-14 15:59:09
1654	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:09	2018-11-14 15:59:09
1655	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:09	2018-11-14 15:59:09
1656	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:09	2018-11-14 15:59:09
1657	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:09	2018-11-14 15:59:09
1658	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:10	2018-11-14 15:59:10
1659	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:10	2018-11-14 15:59:10
1660	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 15:59:10	2018-11-14 15:59:10
1661	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission"}	2018-11-14 16:02:49	2018-11-14 16:02:49
1662	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:11	2018-11-14 16:03:11
1663	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:13	2018-11-14 16:03:13
1664	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:13	2018-11-14 16:03:13
1665	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:13	2018-11-14 16:03:13
1666	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:14	2018-11-14 16:03:14
1667	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:14	2018-11-14 16:03:14
1668	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:14	2018-11-14 16:03:14
1669	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:14	2018-11-14 16:03:14
1670	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:15	2018-11-14 16:03:15
1671	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:15	2018-11-14 16:03:15
1672	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:16	2018-11-14 16:03:16
1673	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:17	2018-11-14 16:03:17
1674	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:18	2018-11-14 16:03:18
1675	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:03:59	2018-11-14 16:03:59
1676	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:04:00	2018-11-14 16:04:00
1677	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:04:01	2018-11-14 16:04:01
1678	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:04:01	2018-11-14 16:04:01
1679	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity"}	2018-11-14 16:04:25	2018-11-14 16:04:25
1680	2	PopCity/users/permission	GET	192.168.3.3	{"s":"\\/PopCity\\/users\\/permission"}	2018-11-14 16:05:48	2018-11-14 16:05:48
1681	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-14 16:16:02	2018-11-14 16:16:02
1682	2	PopCity/resource/images	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-14 16:16:12	2018-11-14 16:16:12
1683	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:16:34	2018-11-14 16:16:34
1684	2	PopCity/toolbars-btns	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars-btns","_pjax":"#pjax-container"}	2018-11-14 16:16:38	2018-11-14 16:16:38
1685	2	PopCity/toolbars-btns/1/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars-btns\\/1\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:16:43	2018-11-14 16:16:43
1686	2	PopCity/toolbars-btns	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars-btns","_pjax":"#pjax-container"}	2018-11-14 16:16:56	2018-11-14 16:16:56
1687	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:17:02	2018-11-14 16:17:02
1688	2	PopCity/toolbars/3/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/3\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:17:09	2018-11-14 16:17:09
1689	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:17:16	2018-11-14 16:17:16
1690	2	PopCity/toolbars-btns	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars-btns","_pjax":"#pjax-container"}	2018-11-14 16:17:40	2018-11-14 16:17:40
1691	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:17:45	2018-11-14 16:17:45
1692	2	PopCity/toolbars/3/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/3\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:19:34	2018-11-14 16:19:34
1693	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-14 16:23:29	2018-11-14 16:23:29
1694	2	PopCity/resource/images	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-14 16:23:32	2018-11-14 16:23:32
1695	2	PopCity/resource/terrains	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/terrains","_pjax":"#pjax-container"}	2018-11-14 16:23:33	2018-11-14 16:23:33
1696	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-14 16:23:36	2018-11-14 16:23:36
1697	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 16:23:37	2018-11-14 16:23:37
1698	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 16:23:37	2018-11-14 16:23:37
1699	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-14 16:23:50	2018-11-14 16:23:50
1700	2	PopCity/toolbars	GET	127.0.0.1	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:24:06	2018-11-14 16:24:06
1701	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-14 16:24:08	2018-11-14 16:24:08
1702	2	PopCity/showUserPer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showUserPer\\/1","_pjax":"#pjax-container"}	2018-11-14 16:24:09	2018-11-14 16:24:09
1703	2	PopCity/addUserPer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/addUserPer\\/1","_pjax":"#pjax-container"}	2018-11-14 16:24:10	2018-11-14 16:24:10
1704	2	PopCity/storeUserPer/1	POST	127.0.0.1	{"_token":"t2ASiTLUCSz3FHcnEdPqWdysgDDueW1DLWHvdMqZ","pers":["273","218","217","161","157","160","156"],"s":"\\/PopCity\\/storeUserPer\\/1"}	2018-11-14 16:24:20	2018-11-14 16:24:20
1705	2	PopCity/showUserPer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showUserPer\\/1"}	2018-11-14 16:24:20	2018-11-14 16:24:20
1706	2	PopCity/toolbars/3	PUT	192.168.3.254	{"type":"images","name":"\\u5f71\\u50cf","icon":".\\/city.png","img":".\\/city.png","_token":"3qnFxSfmNtMWWPuKBb3ZY1iZIhYAO2fl5e4pFZni","_method":"PUT","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/toolbars","s":"\\/PopCity\\/toolbars\\/3"}	2018-11-14 16:24:58	2018-11-14 16:24:58
1707	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars"}	2018-11-14 16:24:58	2018-11-14 16:24:58
1708	2	PopCity/toolbars/2/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/2\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:25:42	2018-11-14 16:25:42
1709	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:25:47	2018-11-14 16:25:47
1710	2	PopCity/toolbars/3/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/3\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:25:53	2018-11-14 16:25:53
1711	2	PopCity/toolbars/3	PUT	192.168.3.254	{"type":"images","name":"\\u5f71\\u50cf","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","_token":"3qnFxSfmNtMWWPuKBb3ZY1iZIhYAO2fl5e4pFZni","_method":"PUT","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/toolbars","s":"\\/PopCity\\/toolbars\\/3"}	2018-11-14 16:26:13	2018-11-14 16:26:13
1712	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars"}	2018-11-14 16:26:13	2018-11-14 16:26:13
1713	2	PopCity/toolbars/3/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/3\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:26:39	2018-11-14 16:26:39
1714	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars","_pjax":"#pjax-container"}	2018-11-14 16:26:41	2018-11-14 16:26:41
1715	2	PopCity/toolbars/2/edit	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars\\/2\\/edit","_pjax":"#pjax-container"}	2018-11-14 16:26:43	2018-11-14 16:26:43
1716	2	PopCity/toolbars/2	PUT	192.168.3.254	{"type":"tilesets","name":"\\u57ce\\u5e02\\u5b9e\\u666f","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","_token":"3qnFxSfmNtMWWPuKBb3ZY1iZIhYAO2fl5e4pFZni","_method":"PUT","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/toolbars","s":"\\/PopCity\\/toolbars\\/2"}	2018-11-14 16:26:46	2018-11-14 16:26:46
1717	2	PopCity/toolbars	GET	192.168.3.254	{"s":"\\/PopCity\\/toolbars"}	2018-11-14 16:26:46	2018-11-14 16:26:46
1718	2	PopCity/pois/type	GET	192.168.3.254	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 17:02:48	2018-11-14 17:02:48
1719	2	PopCity/pois/index	GET	192.168.3.254	{"s":"\\/PopCity\\/pois\\/index","_pjax":"#pjax-container"}	2018-11-14 17:02:49	2018-11-14 17:02:49
1720	2	PopCity/pois/type	GET	192.168.3.254	{"s":"\\/PopCity\\/pois\\/type","_pjax":"#pjax-container"}	2018-11-14 17:02:55	2018-11-14 17:02:55
1721	2	PopCity	GET	192.168.3.234	{"s":"\\/PopCity\\/"}	2018-11-14 17:24:45	2018-11-14 17:24:45
1722	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 17:25:05	2018-11-14 17:25:05
1723	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 17:25:06	2018-11-14 17:25:06
1724	2	PopCity/resource/tilesets/10/edit	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/10\\/edit","_pjax":"#pjax-container"}	2018-11-14 17:25:12	2018-11-14 17:25:12
1725	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-14 17:25:17	2018-11-14 17:25:17
1726	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 17:25:17	2018-11-14 17:25:17
1727	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create","_pjax":"#pjax-container"}	2018-11-14 17:25:18	2018-11-14 17:25:18
1728	2	PopCity/resource/tilesets	POST	192.168.3.234	{"name":"\\u6c34\\u5c1a\\u540d\\u90fd","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/sy-shuishangmingdu_cesium\\/Scene\\/symshuishangmingdu_cesium.json","description":null,"icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"fZJwxbii6f1tVYh3hHvkldu9LijVyCd1qRsgrdJ7","_previous_":"http:\\/\\/192.168.3.3:12345\\/PopCity\\/resource\\/tilesets","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 17:26:11	2018-11-14 17:26:11
1729	2	PopCity/resource/tilesets/create	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets\\/create"}	2018-11-14 17:26:11	2018-11-14 17:26:11
1730	2	PopCity/resource/tilesets	POST	192.168.3.234	{"name":"\\u6c34\\u5c1a\\u540d\\u90fd","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/sy-shuishangmingdu_cesium\\/Scene\\/symshuishangmingdu_cesium.json","description":"1","icon":null,"img":null,"old_group":null,"new_group":[null],"forUser":[null],"forRole":[null],"per":"on","_token":"fZJwxbii6f1tVYh3hHvkldu9LijVyCd1qRsgrdJ7","s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 17:26:15	2018-11-14 17:26:15
1731	2	PopCity/resource/tilesets	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-14 17:26:16	2018-11-14 17:26:16
1732	2	PopCity/resource/tileset-group	GET	192.168.3.234	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-14 17:26:16	2018-11-14 17:26:16
1733	2	PopCity/resource/tilesets/11	PUT	192.168.3.234	{"per":"off","_token":"fZJwxbii6f1tVYh3hHvkldu9LijVyCd1qRsgrdJ7","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-14 17:26:27	2018-11-14 17:26:27
1734	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-15 09:19:23	2018-11-15 09:19:23
1735	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-15 09:47:36	2018-11-15 09:47:36
1736	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-15 15:06:26	2018-11-15 15:06:26
1737	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-16 09:59:54	2018-11-16 09:59:54
1738	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 09:59:57	2018-11-16 09:59:57
1739	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity\\/","_pjax":"#pjax-container"}	2018-11-16 10:00:07	2018-11-16 10:00:07
1740	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 10:00:09	2018-11-16 10:00:09
1741	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 10:00:09	2018-11-16 10:00:09
1742	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-16 10:00:19	2018-11-16 10:00:19
1743	2	PopCity/resource/images	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/images","_pjax":"#pjax-container"}	2018-11-16 10:00:23	2018-11-16 10:00:23
1744	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-16 11:14:46	2018-11-16 11:14:46
1745	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-16 11:14:49	2018-11-16 11:14:49
1746	2	PopCity/showUserPer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showUserPer\\/1","_pjax":"#pjax-container"}	2018-11-16 11:14:52	2018-11-16 11:14:52
1747	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 11:14:57	2018-11-16 11:14:57
1748	2	PopCity/showRolePer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showRolePer\\/1","_pjax":"#pjax-container"}	2018-11-16 11:14:59	2018-11-16 11:14:59
1749	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 11:15:06	2018-11-16 11:15:06
1750	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-16 11:15:12	2018-11-16 11:15:12
1751	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-16 11:15:25	2018-11-16 11:15:25
1752	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:15:36	2018-11-16 11:15:36
1753	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:15:36	2018-11-16 11:15:36
1754	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:15:43	2018-11-16 11:15:43
1755	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:15:43	2018-11-16 11:15:43
1756	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:15:53	2018-11-16 11:15:53
1757	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:15:53	2018-11-16 11:15:53
1758	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"on","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:15:55	2018-11-16 11:15:55
1759	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"off","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:15:58	2018-11-16 11:15:58
1760	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:16:06	2018-11-16 11:16:06
1761	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:16:06	2018-11-16 11:16:06
1762	2	PopCity	GET	192.168.3.254	{"s":"\\/PopCity"}	2018-11-16 11:16:16	2018-11-16 11:16:16
1763	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-16 11:16:30	2018-11-16 11:16:30
1764	2	PopCity/resource/tilesets	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:16:31	2018-11-16 11:16:31
1765	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:16:31	2018-11-16 11:16:31
1766	2	PopCity/resource/tileset-group	GET	192.168.3.254	{"s":"\\/PopCity\\/resource\\/tileset-group","_pjax":"#pjax-container"}	2018-11-16 11:16:35	2018-11-16 11:16:35
1767	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 11:18:04	2018-11-16 11:18:04
1768	2	PopCity/showRolePer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showRolePer\\/1","_pjax":"#pjax-container"}	2018-11-16 11:18:07	2018-11-16 11:18:07
1769	2	PopCity	GET	192.168.3.2	{"s":"\\/PopCity"}	2018-11-16 11:18:09	2018-11-16 11:18:09
1770	2	PopCity/delRolePer/1/236	DELETE	127.0.0.1	{"_method":"delete","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","s":"\\/PopCity\\/delRolePer\\/1\\/236"}	2018-11-16 11:18:11	2018-11-16 11:18:11
1771	2	PopCity/showRolePer/1	GET	127.0.0.1	{"s":"\\/PopCity\\/showRolePer\\/1","_pjax":"#pjax-container"}	2018-11-16 11:18:11	2018-11-16 11:18:11
1772	2	PopCity/users/index	GET	192.168.3.2	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-16 11:18:16	2018-11-16 11:18:16
1773	2	PopCity/patterns	GET	127.0.0.1	{"s":"\\/PopCity\\/patterns","_pjax":"#pjax-container"}	2018-11-16 11:18:37	2018-11-16 11:18:37
1774	2	PopCity/settings	GET	127.0.0.1	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-16 11:18:40	2018-11-16 11:18:40
1775	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-16 11:18:41	2018-11-16 11:18:41
1776	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 11:18:49	2018-11-16 11:18:49
1777	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-16 11:18:50	2018-11-16 11:18:50
1778	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-16 11:18:59	2018-11-16 11:18:59
1779	2	PopCity/settings	GET	127.0.0.1	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-16 11:19:11	2018-11-16 11:19:11
1780	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-16 11:19:12	2018-11-16 11:19:12
1781	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets","_pjax":"#pjax-container"}	2018-11-16 11:19:16	2018-11-16 11:19:16
1782	2	PopCity/resource/tileset-group	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tileset-group","per_page":"20","page":"1","method":"ajax"}	2018-11-16 11:19:16	2018-11-16 11:19:16
1783	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"on","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:19:17	2018-11-16 11:19:17
1784	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"off","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:19:42	2018-11-16 11:19:42
1785	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"on","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:20:20	2018-11-16 11:20:20
1786	2	PopCity/resource/tilesets/11	PUT	127.0.0.1	{"per":"off","_token":"gFvnY8VeV2YUgljnjoYxyaIPa7yoM3ooaOYcd8XM","_method":"PUT","s":"\\/PopCity\\/resource\\/tilesets\\/11"}	2018-11-16 11:20:24	2018-11-16 11:20:24
1787	2	PopCity/resource/tilesets	GET	127.0.0.1	{"s":"\\/PopCity\\/resource\\/tilesets"}	2018-11-16 11:22:21	2018-11-16 11:22:21
1788	2	PopCity/toolbars	GET	192.168.3.2	{"s":"\\/PopCity\\/toolbars"}	2018-11-16 13:39:50	2018-11-16 13:39:50
1789	2	PopCity/web-config	GET	192.168.3.2	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-11-16 13:39:53	2018-11-16 13:39:53
1790	2	PopCity/auth/users	GET	192.168.3.2	{"s":"\\/PopCity\\/auth\\/users","_pjax":"#pjax-container"}	2018-11-16 13:39:54	2018-11-16 13:39:54
1791	2	PopCity/auth/roles	GET	192.168.3.2	{"s":"\\/PopCity\\/auth\\/roles","_pjax":"#pjax-container"}	2018-11-16 13:39:55	2018-11-16 13:39:55
1792	2	PopCity/auth/permissions	GET	192.168.3.2	{"s":"\\/PopCity\\/auth\\/permissions","_pjax":"#pjax-container"}	2018-11-16 13:39:58	2018-11-16 13:39:58
1793	2	PopCity/settings	GET	192.168.3.2	{"s":"\\/PopCity\\/settings","_pjax":"#pjax-container"}	2018-11-16 13:39:59	2018-11-16 13:39:59
1794	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-23 10:28:13	2018-11-23 10:28:13
1795	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-23 10:28:26	2018-11-23 10:28:26
1796	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-23 10:28:36	2018-11-23 10:28:36
1797	2	PopCity/web-config	GET	127.0.0.1	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-11-23 10:33:35	2018-11-23 10:33:35
1798	2	PopCity/auth/users	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/users","_pjax":"#pjax-container"}	2018-11-23 10:33:37	2018-11-23 10:33:37
1799	2	PopCity/auth/roles	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/roles","_pjax":"#pjax-container"}	2018-11-23 10:33:37	2018-11-23 10:33:37
1800	2	PopCity/auth/permissions	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/permissions","_pjax":"#pjax-container"}	2018-11-23 10:33:38	2018-11-23 10:33:38
1801	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-23 10:33:38	2018-11-23 10:33:38
1802	2	PopCity/web-config	GET	127.0.0.1	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-11-23 10:33:39	2018-11-23 10:33:39
1803	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-23 10:33:41	2018-11-23 10:33:41
1804	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-23 10:38:10	2018-11-23 10:38:10
1805	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-23 10:38:11	2018-11-23 10:38:11
1806	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-23 10:38:15	2018-11-23 10:38:15
1807	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 10:50:52	2018-11-23 10:50:52
1808	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 11:07:08	2018-11-23 11:07:08
1809	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 12:36:14	2018-11-23 12:36:14
1810	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 12:45:04	2018-11-23 12:45:04
1811	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 13:56:18	2018-11-23 13:56:18
1812	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 14:47:10	2018-11-23 14:47:10
1813	2	PopCity/auth/menu	POST	127.0.0.1	{"parent_id":"0","title":"1","icon":"fa-bars","uri":null,"roles":[null],"_token":"8flLvV9NkaWLKh6lmtSEGDjxvUri5XAXuwoH1GPO","s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 14:47:15	2018-11-23 14:47:15
1814	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-23 14:47:15	2018-11-23 14:47:15
1815	2	PopCity/auth/menu/32	DELETE	127.0.0.1	{"_method":"delete","_token":"8flLvV9NkaWLKh6lmtSEGDjxvUri5XAXuwoH1GPO","s":"\\/PopCity\\/auth\\/menu\\/32"}	2018-11-23 14:47:21	2018-11-23 14:47:21
1816	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-23 14:47:21	2018-11-23 14:47:21
1817	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-26 13:20:25	2018-11-26 13:20:25
1818	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-26 13:20:29	2018-11-26 13:20:29
1819	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission"}	2018-11-26 13:35:06	2018-11-26 13:35:06
1820	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission"}	2018-11-26 15:16:29	2018-11-26 15:16:29
1821	2	PopCity/users/permission	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/permission","_pjax":"#pjax-container"}	2018-11-26 15:16:34	2018-11-26 15:16:34
1822	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-26 15:16:36	2018-11-26 15:16:36
1823	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-26 15:16:41	2018-11-26 15:16:41
1824	2	PopCity/media-manager	GET	127.0.0.1	{"s":"\\/PopCity\\/media-manager"}	2018-11-26 15:17:10	2018-11-26 15:17:10
1825	2	PopCity/media-manager	GET	127.0.0.1	{"s":"\\/PopCity\\/media-manager"}	2018-11-26 16:09:13	2018-11-26 16:09:13
1826	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-26 16:09:16	2018-11-26 16:09:16
1827	2	PopCity/users/role/create	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role\\/create","_pjax":"#pjax-container"}	2018-11-26 16:09:17	2018-11-26 16:09:17
1828	2	PopCity/users/index	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index","_pjax":"#pjax-container"}	2018-11-26 16:09:22	2018-11-26 16:09:22
1829	2	PopCity/users/index/create	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/index\\/create","_pjax":"#pjax-container"}	2018-11-26 16:09:24	2018-11-26 16:09:24
1830	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-26 16:09:27	2018-11-26 16:09:27
1831	2	PopCity	GET	127.0.0.1	{"s":"\\/PopCity"}	2018-11-27 13:38:43	2018-11-27 13:38:43
1832	2	PopCity/web-config	GET	127.0.0.1	{"s":"\\/PopCity\\/web-config","_pjax":"#pjax-container"}	2018-11-27 13:38:46	2018-11-27 13:38:46
1833	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 13:38:47	2018-11-27 13:38:47
1834	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 13:59:06	2018-11-27 13:59:06
1835	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:10:08	2018-11-27 14:10:08
1836	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:13:58	2018-11-27 14:13:58
1837	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:21:30	2018-11-27 14:21:30
1838	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:29:03	2018-11-27 14:29:03
1839	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:45:23	2018-11-27 14:45:23
1840	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 14:59:05	2018-11-27 14:59:05
1841	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 15:09:24	2018-11-27 15:09:24
1842	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 15:25:56	2018-11-27 15:25:56
1843	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 15:37:59	2018-11-27 15:37:59
1844	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 15:38:02	2018-11-27 15:38:02
1845	2	PopCity/auth/menu	POST	127.0.0.1	{"_token":"L5zPCqJJl5UwkXqyuRHf95OUhowEPNfROIBAvrWJ","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":29},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15,\\"children\\":[{\\"id\\":28}]}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23,\\"children\\":[{\\"id\\":27},{\\"id\\":26}]},{\\"id\\":24}]}]},{\\"id\\":30},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":31},{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]","s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 15:38:05	2018-11-27 15:38:05
1846	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 15:38:05	2018-11-27 15:38:05
1847	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 15:38:09	2018-11-27 15:38:09
1848	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 15:44:13	2018-11-27 15:44:13
1849	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 16:05:58	2018-11-27 16:05:58
1850	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 16:05:58	2018-11-27 16:05:58
1851	2	PopCity/auth/menu/25/edit	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu\\/25\\/edit","_pjax":"#pjax-container"}	2018-11-27 16:06:37	2018-11-27 16:06:37
1852	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 16:06:40	2018-11-27 16:06:40
1853	2	PopCity/users/role	GET	127.0.0.1	{"s":"\\/PopCity\\/users\\/role","_pjax":"#pjax-container"}	2018-11-27 16:06:45	2018-11-27 16:06:45
1854	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 16:06:47	2018-11-27 16:06:47
1855	2	PopCity/auth/menu/8/edit	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu\\/8\\/edit","_pjax":"#pjax-container"}	2018-11-27 16:06:50	2018-11-27 16:06:50
1856	2	PopCity/auth/menu/8/edit	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu\\/8\\/edit"}	2018-11-27 16:33:55	2018-11-27 16:33:55
1857	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 16:33:58	2018-11-27 16:33:58
1858	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 16:44:52	2018-11-27 16:44:52
1859	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 17:40:21	2018-11-27 17:40:21
1860	2	PopCity/auth/menu	POST	127.0.0.1	{"_token":"L5zPCqJJl5UwkXqyuRHf95OUhowEPNfROIBAvrWJ","_order":"[{\\"id\\":25},{\\"id\\":6},{\\"id\\":7},{\\"id\\":29},{\\"id\\":8},{\\"id\\":9,\\"children\\":[{\\"id\\":10,\\"children\\":[{\\"id\\":11},{\\"id\\":12}]},{\\"id\\":13},{\\"id\\":14},{\\"id\\":15,\\"children\\":[{\\"id\\":28}]}]},{\\"id\\":19,\\"children\\":[{\\"id\\":20},{\\"id\\":21},{\\"id\\":22,\\"children\\":[{\\"id\\":23,\\"children\\":[{\\"id\\":27},{\\"id\\":26}]},{\\"id\\":24}]}]},{\\"id\\":30},{\\"id\\":16,\\"children\\":[{\\"id\\":17},{\\"id\\":18}]},{\\"id\\":1,\\"children\\":[{\\"id\\":31},{\\"id\\":2},{\\"id\\":3},{\\"id\\":4},{\\"id\\":5}]}]","s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 17:40:31	2018-11-27 17:40:31
1861	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu","_pjax":"#pjax-container"}	2018-11-27 17:40:31	2018-11-27 17:40:31
1862	2	PopCity/auth/menu	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu"}	2018-11-27 18:16:08	2018-11-27 18:16:08
1863	2	PopCity/auth/menu/6/edit	GET	127.0.0.1	{"s":"\\/PopCity\\/auth\\/menu\\/6\\/edit","_pjax":"#pjax-container"}	2018-11-27 18:16:11	2018-11-27 18:16:11
\.


--
-- Name: admin_operation_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_operation_log_id_seq', 1863, true);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, name, slug, http_method, http_path, created_at, updated_at) FROM stdin;
1	平台所有权限	*	\N	*	\N	\N
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 1, true);


--
-- Data for Name: admin_role_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_role_menu (role_id, menu_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: admin_role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_role_permissions (role_id, permission_id, created_at, updated_at) FROM stdin;
1	1	\N	\N
\.


--
-- Data for Name: admin_role_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_role_users (role_id, user_id, created_at, updated_at) FROM stdin;
1	2	\N	\N
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, slug, created_at, updated_at) FROM stdin;
1	Administrator	administrator	\N	\N
\.


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 1, true);


--
-- Data for Name: admin_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_user_permissions (user_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, username, password, name, avatar, remember_token, created_at, updated_at) FROM stdin;
2	admin	$2y$10$cAnsUwyHyIylsIOIH2/h1e.q1RWScaHqRSrvjJFv3TkUCqx8Dmg32	admin	\N	\N	\N	\N
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- Data for Name: angles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.angles (id, user_id, name, "position", direction, up, is_public, is_comment, again_share, is_followed, comment_count, followed_count, share_count, view_count, created_at, updated_at) FROM stdin;
7	1	便民服务中心	{"x":-2834656.323674353,"y":4743889.809616211,"z":3174191.812145247}	{"x":0.6630910701639322,"y":0.314900893119432,"z":-0.6790785375650119}	{"x":-0.19669071344274927,"y":0.9486257032202946,"z":0.24783469982063427}	1	1	1	1	\N	\N	\N	\N	2018-11-16 13:32:24	2018-11-16 13:32:24
8	1	行政中心	{"x":-2834554.8944819816,"y":4744838.1551847765,"z":3173465.777425265}	{"x":0.4744871157756902,"y":-0.7965810558183836,"z":0.3745939114216036}	{"x":-0.19291529949037148,"y":0.3211012503773016,"z":0.9271880468538589}	1	1	1	1	\N	\N	\N	\N	2018-11-16 13:42:03	2018-11-16 13:42:03
\.


--
-- Name: angles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.angles_id_seq', 8, true);


--
-- Name: buildPolygon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."buildPolygon_id_seq"', 11, true);


--
-- Data for Name: build_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.build_types (id, title, color, created_at, updated_at) FROM stdin;
\.


--
-- Name: build_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.build_types_id_seq', 1, false);


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buildings (id, geom, name, build_no, real_estate_id, build_bot_height, build_top_height, guid, floor_sum, upfloor_sum, underfloor_sum, completion_date, design_life, construction_unit, design_unit, project_unit, qllx, qlxz, qlxz1, qlxz2, yt, yt1, yt2, jzmj, supervision_unit, unit, realestate_id, createtime, updatetime, discardtime) FROM stdin;
1	0103000020E6100000010000000C0000006D98D5A478365E4025F619DA9A0B3E40D6F3C2127A365E40CA807C759A0B3E40CF3FE8357A365E4007D7D7DC9C0B3E40266D5BF57A365E40637D96C89C0B3E40CE8303337D365E405D5EE23C9C0B3E40ECBCE0247D365E4088AA76859A0B3E407938C5E97E365E4099FEDFF3990B3E40E8F241817E365E40A95582E28D0B3E40AB80E26B7A365E40444885958E0B3E405A08E16878365E40F5EFF0AB8F0B3E40B5A4886A78365E405FBCD33B970B3E406D98D5A478365E4025F619DA9A0B3E40	1	1	1	7.46005013866284017	104.082805536614998	\N	\N	31	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
2	0103000020E610000001000000100000005230F9B47D365E4040D55A97720B3E40B7BBF70D7E365E409B2204D0780B3E40273E69477E365E40A31547AC7A0B3E4032AD76617F365E40F8DD32487B0B3E40730CF4B580365E40F22E70A57C0B3E409DC2575782365E407D0105517C0B3E40A699ECFC82365E40B999D8557A0B3E406134A60384365E40EF16EFFD780B3E4016D18C7B84365E400A2E1127760B3E402BE1A27C84365E401250E020710B3E406B5F14B583365E40F5E4E4E7710B3E407EE2F06882365E40BA7BEAFC6F0B3E40AD3D6EBB80365E404E592EF86F0B3E401B227DF87E365E40A29C707E700B3E40AAF5EC0C7E365E4017A8117B720B3E405230F9B47D365E4040D55A97720B3E40	2	2	1	7.5182779739254304	104.718374694275994	\N	\N	27	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
3	0103000020E6100000010000000C000000382B280483365E40EF7523C3570B3E406EB7E30985365E40F8292049580B3E4090C274B287365E40F071A541580B3E4013B9BA8489365E405B656D4E570B3E40B0C5C4E089365E40E576572F540B3E40078FAF8289365E40867D325B4D0B3E40BBC208D488365E409913852A4C0B3E401129467C87365E40F18E7CE44A0B3E40794F7BFF85365E40ED4D485A4B0B3E4049B597E283365E403B3C01144C0B3E40D8608A9D82365E4007B01F7D4F0B3E40382B280483365E40EF7523C3570B3E40	3	3	1	7.64091735626734003	103.978487622906997	\N	\N	31	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
4	0103000020E610000001000000100000001CC4B03F8A365E4084E137C22E0B3E4082E9C4A98B365E40FCDD69DF2E0B3E4077B4C9FA8B365E402D0A5214310B3E40B4B3B4418E365E409FEC9A8B300B3E40A3B556878E365E4033A5B22D2E0B3E40497516718F365E40A2C6453C2D0B3E4029A1D10F90365E400A7188832C0B3E409E2A876F90365E402007F1112C0B3E40AF5BAF4F90365E40C2B0EDF0240B3E40AC9EB4B58F365E400A7AE51D230B3E409D3223CE8C365E40B4F4C6E4220B3E40AE8AA2F28A365E405AC9B5DC230B3E40712F5A1F8A365E404C7C25B5240B3E405541CD6189365E406C1C1A72260B3E40B99A589189365E40CEA8A6AA2E0B3E401CC4B03F8A365E4084E137C22E0B3E40	5	5	1	7.15819659350276982	85.6172543351952982	\N	\N	25	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
5	0103000020E6100000010000000E000000ADD80BD083365E404362AA571D0B3E40D706C75584365E400E843AF41A0B3E40CAFC9E9284365E402DFFCE72150B3E40F2C8BEE982365E408A8AC6E7110B3E40E7CF0DDD80365E404CE141A20E0B3E400ECFF5AF7F365E40575629B70C0B3E40BE2D497D7E365E40D38DE5DC0B0B3E408769C60E7E365E40320EA56E110B3E4036E7830E7E365E40FE3D799C140B3E40EE963CDA7E365E408B118CC5180B3E4043C47D9780365E404EB53E411B0B3E40E7624CF681365E40A07509891C0B3E40BEC8533983365E40077B29F91D0B3E40ADD80BD083365E404362AA571D0B3E40	6	6	1	7.63463674436034978	85.5702867748987046	\N	\N	25	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
6	0103000020E6100000010000001A000000A1EEC94770365E409D886ACB0B0B3E40ACC205BF6F365E408AED6E450C0B3E406A38CB0E6F365E40C9330E620D0B3E40A7D1E9856F365E409F2A780F110B3E40BA4ECD746F365E401E2CD2D6140B3E40183E25C36F365E40213A99F4150B3E40D680642F71365E40C5328EFC150B3E40F3E5DE0772365E40BDD4304D170B3E40FEF3465E73365E401EBEA1B1160B3E4014276BB574365E4068941457150B3E40F616499975365E40815E98EC130B3E40687BFA4777365E400D9AEE7D140B3E40D8151AC779365E4039A3B5B7140B3E40C049839D7A365E404B56644B140B3E40B99A70877B365E408F1D17DE120B3E4051D7DEB87B365E4025E8881A100B3E404E0303F77B365E40EA7911450C0B3E40CA70B98D7B365E40B0994A52080B3E408B7CB0D07A365E40ECDC2877070B3E40DD94064B79365E405ED40B34080B3E4034FC58D777365E4039C917AF070B3E40357FBB4B76365E407ADD7AAA070B3E406204729E74365E406C30A974070B3E4092EB52B973365E4014FE9817090B3E40FE5CE80C72365E40E9D181C3090B3E40A1EEC94770365E409D886ACB0B0B3E40	7	7	1	7.15035524113428966	85.7005196838817938	\N	\N	25	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
7	0103000020E6100000010000000C0000002B30E59C71365E403BD535D4350B3E40F9C1DBAD71365E40D5D39E442C0B3E40BB7E26D970365E40F72A77AA2A0B3E405921634C6D365E4087DA488A2B0B3E404480047C68365E40D899BB502E0B3E403ADFDAA768365E405BE048DB320B3E4098EA801169365E408937FBF7360B3E4096EB71966A365E40AB6EEA3F380B3E405203FE6F6C365E402BCEC501380B3E405B34DECB6E365E405F049A84370B3E40EC4E0DE170365E4093A524EE360B3E402B30E59C71365E403BD535D4350B3E40	8	8	1	7.86230638249208003	102.114205654873999	\N	\N	30	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
8	0103000020E6100000010000000F0000003C94B24569365E405A8177A74E0B3E40AB978A7F66365E4042A267A54F0B3E40A9A31CF562365E40AE656521500B3E40D4CB8CD361365E405EE37D35520B3E406EF53C8161365E401B443DDF580B3E405D71F20062365E400C5BDD965A0B3E404DE2DA0863365E402863E6045C0B3E40789BD38964365E402D70E56C5C0B3E40575693F966365E40DBF22C645C0B3E4089E2D29768365E404272BDEC5D0B3E40E87E803E6A365E40C5CC05E35B0B3E401EE9A0546A365E4062B0B7A4560B3E40913F5A4F6A365E40AD551BB9510B3E402671EAE969365E4046ED4DA54F0B3E403C94B24569365E405A8177A74E0B3E40	9	9	1	7.56752691504711006	101.815150137657994	\N	\N	30	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
9	0103000020E6100000010000000D000000CB8D1A4C62365E40C0D053487B0B3E4034D7BA8362365E400FC640EF770B3E400C16CBA762365E40F8C59894750B3E40A0E5319F5F365E40381D98E0700B3E40808282685D365E40FFCE46416D0B3E4013C96B585C365E40BBDAF7566D0B3E40A1712FCC5A365E40934F0D4A750B3E40851CA0EA5A365E40EC29CDA4790B3E403071BE565C365E40AAD3F8787B0B3E407B3DF0F55E365E40F3767632820B3E40DAAFAFCA60365E40D977B2DF810B3E40151115DC61365E4045E23718810B3E40CB8D1A4C62365E40C0D053487B0B3E40	10	10	1	7.36395587624630021	101.264888344884994	\N	\N	30	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
10	0103000020E61000000100000022000000B43089686A365E40E1E5656D990B3E408A7A2FDC68365E4056275D3E970B3E40702515EF67365E40664F3CC5950B3E40C93EFD9F66365E40091DEC03940B3E40F8698C2E65365E40E172D31B920B3E40CC03AAD863365E4000252D31900B3E40F200424862365E40C8CA19528E0B3E40BE9AC23961365E40ABF3D2EF8C0B3E40EE1FA0C560365E40BE4A96688C0B3E40389D187660365E403D174A588E0B3E40EC8C223760365E40797C6B52900B3E401D4AF8FC5F365E40B999F356920B3E400A8C7CE75F365E4057BEDEA3930B3E4094BBA5B95F365E404F3239F2940B3E40811D8AC55F365E40E30A46A6950B3E400F91194560365E402BEB8C95960B3E40504F49E560365E403E84AA7B970B3E4092E663AB60365E403C18628C990B3E40B83F93BB60365E4091ABA4A69A0B3E404088322A62365E404C2A4EC49C0B3E4010F4B20363365E403641D93A9E0B3E40F9B61E7663365E40EBC510689E0B3E40C1243B1A64365E40CB56201E9F0B3E403837AD1965365E40EAD5B957A00B3E40A4AA73B465365E40DDD62942A10B3E40F12B57BA66365E406D26DDF0A20B3E407CCAB7A367365E406A2D3B99A30B3E40EA8AB2CE67365E40ED5DF953A30B3E40B9854C1E69365E4095597C91A40B3E4017B1B74D69365E403696F6C6A20B3E4061FB678F69365E40FE8452E9A00B3E40D55CB70E6A365E4020A8DA8DA00B3E405205E4786A365E406F9608BC9C0B3E40B43089686A365E40E1E5656D990B3E40	11	11	1	7.38828057051781961	76.1857826798752029	\N	\N	22	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
11	0103000020E6100000010000001B0000003DC2943A76365E40EB1DE03EA90B3E40DE9BE71C75365E40A54D2E9EA70B3E402DCD53F573365E408A2AB522A60B3E402D9454C272365E40F02A9482A40B3E4042BCC79471365E404353C0E7A20B3E4056BBA23D6F365E40CB9FADD59F0B3E403F3521166E365E40C334DB429E0B3E405349B0D16C365E406A271C879C0B3E40859CD5836C365E403614DDF29D0B3E404F4362086C365E4001F7A4E1A00B3E40F6CC65DE6B365E407E873BA6A30B3E40A8D8EED86B365E4022018464A50B3E40D67C28A66B365E403C76ABB0A60B3E40CD61ED926B365E40D3D9A4D3A70B3E40E9B2E70E6D365E403EE8384DAA0B3E404255FE186E365E40FF7DCA9EAB0B3E40221FDD246F365E4023F2D0FAAC0B3E40CAFF6CB46F365E4001A21065AE0B3E401A25C84E71365E40C721B43BB00B3E407A12145172365E40567C7EE6B00B3E4060C410B373365E40ED183CF9B20B3E401B4BF3E373365E408BFBD719B30B3E409947A12874365E4050322FD9B00B3E405DB24E2175365E405C50D2A7B20B3E400479876F75365E402D579DFCB20B3E408C79190476365E40D6DC8B94AD0B3E403DC2943A76365E40EB1DE03EA90B3E40	12	12	1	7.48217796278412006	76.2795625145193981	\N	\N	22	\N	\N	70	\N	\N	上虞嘉业房地产开发有限公司	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2018-10-26 10:28:31	2018-10-26 10:28:31	\N
\.


--
-- Data for Name: builds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.builds (id, name, hierarchy, build_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: builds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.builds_id_seq', 1, false);


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (title, type, description, floor, url) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
popcity_cache0a1310b0dc3100d056b6a3818eff0b14f2f13d91:timer	i:1540432551;	1540432551
popcity_cache0a1310b0dc3100d056b6a3818eff0b14f2f13d91	i:1;	1540432551
_cache_API_TOKEN_EXPIRE	s:3:"100";	1855795970
_cachebe9782b24496ad82366e3763ad3ab185f23a5a47:timer	i:1540554974;	1540554974
_cache_API_PIC_MAX_UPLOAD	s:4:"2048";	1855796654
_cache_API_FILE_MAX_UPLOAD	s:4:"2085";	1855796662
_cachescheme-37	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631730.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-49"}";	1540632330
_cache_API_LOGIN_METHOD	s:16:"["name","email"]";	1855796666
_cachebe9782b24496ad82366e3763ad3ab185f23a5a47	i:2;	1540554974
_cachescheme-81	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-109"}";	1540651332
_cachescheme-41	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632049.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-53"}";	1540632650
_cachescheme-43	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632100.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-55"}";	1540632700
_cachescheme-26	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630773.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-38"}";	1540631373
_cachescheme-27	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630846.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-39"}";	1540631446
_cachescheme-100	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-128"}";	1540691146
_cache3d324ef71b260bcbb85812669c8739e7d9cd1ab1:timer	i:1542699364;	1542699364
_cachescheme-53	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-81"}";	1540636953
_cache3d324ef71b260bcbb85812669c8739e7d9cd1ab1	i:10;	1542699364
_cachescheme-45	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632141.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-57"}";	1540632741
_cachescheme-46	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632246.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-58"}";	1540632846
_cache_API-LOGIN-TOKEN-1	s:60:"oxrumKTXOAtjfX65FqpUlJmE6hAiCAwQam1pPd1sfQ9P6jPKqyO2TiPaLHoI";	1543668054
_cachescheme-20	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540629664.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-32"}";	1540630264
_cachescheme-58	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-86"}";	1540637627
_cachee06708938f15c82b1aa6b7df17908e82ab98ba40:timer	i:1540546403;	1540546403
_cachee06708938f15c82b1aa6b7df17908e82ab98ba40	i:1;	1540546403
_cachescheme-59	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-87"}";	1540637660
_cachescheme-61	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-89"}";	1540637678
_cachescheme-40	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632005.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-52"}";	1540632605
_cachescheme-63	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-91"}";	1540637693
_cachescheme-65	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-93"}";	1540637708
_cache674a58435474112cbddeb5e449a88c17cdfc01fe:timer	i:1540629759;	1540629759
_cachescheme-51	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-79"}";	1540636517
_cache674a58435474112cbddeb5e449a88c17cdfc01fe	i:3;	1540629759
_cachescheme-32	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631194.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-44"}";	1540631794
_cachescheme-49	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-77"}";	1540636329
_cachescheme-74	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-102"}";	1540641670
_cachescheme-35	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631412.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-47"}";	1540632012
_cachescheme-67	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-95"}";	1540638318
_cachescheme-75	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-103"}";	1540641723
_cachescheme-24	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630583.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-36"}";	1540631183
_cachescheme-68	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-96"}";	1540638399
_cachescheme-69	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-97"}";	1540638479
_cachescheme-56	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-84"}";	1540637288
_cachescheme-78	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-106"}";	1540642082
_cachescheme-71	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-99"}";	1540638710
_cachescheme-21	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630068.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-33"}";	1540630668
_cachescheme-34	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631365.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-46"}";	1540631965
_cache6249435204f4d9d40c6f5095b306480e7199f539:timer	i:1542707231;	1542707231
_cachescheme-90	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-118"}";	1540653533
_cachescheme-42	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632069.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-54"}";	1540632669
_cachescheme-89	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-117"}";	1540653280
_cachescheme-44	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540632106.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-56"}";	1540632706
_cachescheme-22	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630244.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-34"}";	1540630844
_cachescheme-50	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-78"}";	1540636480
_cachescheme-72	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-100"}";	1540638991
_cachescheme-28	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630893.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-40"}";	1540631493
_cachescheme-29	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630931.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-41"}";	1540631531
_cachescheme-36	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631634.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-48"}";	1540632234
_cachescheme-54	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-82"}";	1540636985
_cachescheme-23	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630519.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-35"}";	1540631119
_cachescheme-30	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630998.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-42"}";	1540631598
_cachescheme-31	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631074.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-43"}";	1540631674
_cache791c401fb1a81d46e110b8884a7167744bc87a46:timer	i:1541554604;	1541554604
_cachescheme-52	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-80"}";	1540636713
_cachescheme-64	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-92"}";	1540637701
_cache791c401fb1a81d46e110b8884a7167744bc87a46	i:1;	1541554604
_cachescheme-25	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540630640.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-37"}";	1540631240
_cachescheme-47	s:4:"null";	1540633707
_cachescheme-73	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-101"}";	1540641027
_cachescheme-33	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631265.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-45"}";	1540631865
_cachescheme-77	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-105"}";	1540641942
_cachescheme-60	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-88"}";	1540637671
_cachescheme-66	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-94"}";	1540638084
_cachescheme-76	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-104"}";	1540641776
_cachescheme-79	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-107"}";	1540650281
_cachescheme-70	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-98"}";	1540638554
_cachescheme-55	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-83"}";	1540637079
_cachescheme-62	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-90"}";	1540637685
_cachescheme-82	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-110"}";	1540652433
_cachescheme-57	s:152:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-85"}";	1540637428
_cachescheme-38	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631869.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-50"}";	1540632469
_cachescheme-39	s:138:"{"user_id":1,"name":"A3.zip","url":"images\\/users\\/huyouheng\\/1540631940.gltf","file_size":"3.68 MB","file_type":"zip","origin":"gltf-51"}";	1540632540
_cachescheme-80	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-108"}";	1540650655
_cachescheme-48	s:132:"{"user_id":1,"name":"A1.gltf","url":"images\\/users\\/huyouheng\\/A1.gltf","file_size":"5.09 MB","file_type":"gltf","origin":"gltf-76"}";	1540633986
_cache6249435204f4d9d40c6f5095b306480e7199f539	i:2;	1542707231
_cachescheme-104	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-132"}";	1540723059
_cachescheme-105	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-133"}";	1540723163
_cachescheme-87	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-115"}";	1540653066
_cache328fcdc0f2f1bcc698610797a6d3f17662d16072:timer	i:1540773951;	1540773951
_cachescheme-115	s:133:"{"user_id":1,"name":"A4.gltf","url":"images\\/users\\/huyouheng\\/A4.gltf","file_size":"6.57 MB","file_type":"gltf","origin":"gltf-143"}";	1540773203
_cachescheme-97	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-125"}";	1540684947
_cache328fcdc0f2f1bcc698610797a6d3f17662d16072	i:2;	1540773951
_cachescheme-106	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-134"}";	1540723371
_cachescheme-99	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-127"}";	1540685006
_cachescheme-92	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-120"}";	1540653597
_cachescheme-93	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-121"}";	1540653696
_cachescheme-94	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-122"}";	1540653758
_cachescheme-102	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-130"}";	1540691755
_cachescheme-108	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-136"}";	1540723409
_cachescheme-113	s:137:"{"user_id":1,"name":"1111.gltf","url":"images\\/users\\/huyouheng\\/1111.gltf","file_size":"7.99 KB","file_type":"gltf","origin":"gltf-141"}";	1540727539
_cachescheme-110	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-138"}";	1540723421
_cachewebConfName	s:12:"管理平台";	1856091999
_cachewebConfVer	s:3:"1.0";	1856091999
_cachewebConfCount	s:2:"15";	1856091999
_cacheac31704be9717df24d144b60380cd594840ffd40:timer	i:1540808334;	1540808334
_cacheac31704be9717df24d144b60380cd594840ffd40	i:1;	1540808334
_cachescheme-112	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-140"}";	1540723441
_cache5de83de220810de5dcabb6c2724662e5e1fc6a8e:timer	i:1542338730;	1542338730
_cache5de83de220810de5dcabb6c2724662e5e1fc6a8e	i:1;	1542338730
_cachescheme-91	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-119"}";	1540653554
_cachescheme-83	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-111"}";	1540652676
_cachescheme-95	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-123"}";	1540653962
_cachescheme-96	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-124"}";	1540684925
_cachescheme-98	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-126"}";	1540684976
_cache0a1310b0dc3100d056b6a3818eff0b14f2f13d91:timer	i:1540887232;	1540887232
_cache0a1310b0dc3100d056b6a3818eff0b14f2f13d91	i:1;	1540887232
_cachescheme-118	s:133:"{"user_id":1,"name":"cc.gltf","url":"images\\/users\\/huyouheng\\/cc.gltf","file_size":"1.23 MB","file_type":"gltf","origin":"gltf-146"}";	1542348453
_cachef2ef28ca7363a399cdd8e0e20882bb05d8ec4be3:timer	i:1543372844;	1543372844
_cachescheme-103	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-131"}";	1540722625
_cachescheme-88	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-116"}";	1540653122
_cachescheme-101	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-129"}";	1540691664
_cachescheme-84	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-112"}";	1540652804
_cachef2ef28ca7363a399cdd8e0e20882bb05d8ec4be3	i:8;	1543372844
_cachescheme-107	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-135"}";	1540723400
_cachescheme-109	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-137"}";	1540723410
_cachescheme-111	s:135:"{"user_id":1,"name":"shu.gltf","url":"images\\/users\\/huyouheng\\/shu.gltf","file_size":"4.35 MB","file_type":"gltf","origin":"gltf-139"}";	1540723421
_cachescheme-85	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-113"}";	1540652851
_cachescheme-117	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-145"}";	1540779700
_cachescheme-116	s:133:"{"user_id":1,"name":"A1.gltf","url":"images\\/users\\/huyouheng\\/A1.gltf","file_size":"5.09 MB","file_type":"gltf","origin":"gltf-144"}";	1540774088
_cache_API_DATA_CACHE	b:1;	1856166702
_cachescheme-114	s:133:"{"user_id":1,"name":"A4.gltf","url":"images\\/users\\/huyouheng\\/A4.gltf","file_size":"6.57 MB","file_type":"gltf","origin":"gltf-142"}";	1540773141
_cachescheme-86	s:153:"{"user_id":1,"name":"xiaogaoceng1.gltf","url":"images\\/users\\/huyouheng\\/xiaogaoceng1.gltf","file_size":"2.45 MB","file_type":"gltf","origin":"gltf-114"}";	1540652922
_cachescheme-119	s:133:"{"user_id":1,"name":"cc.gltf","url":"images\\/users\\/huyouheng\\/cc.gltf","file_size":"1.23 MB","file_type":"gltf","origin":"gltf-147"}";	1542348480
_cache729c5fe117a946a0dd248a86c1296d97e73e2fe3:timer	i:1542706948;	1542706948
_cache729c5fe117a946a0dd248a86c1296d97e73e2fe3	i:11;	1542706948
_cache5c785c036466adea360111aa28563bfd556b5fba:timer	i:1543367971;	1543367971
_cache5c785c036466adea360111aa28563bfd556b5fba	i:1;	1543367971
_cache71db4b4a62ca8564505efa87b0efadfedc7341fa:timer	i:1542343880;	1542343880
_cache_CACHE_DATA_ARRAY	s:8066:"{"1":{"tilesets":{"data":[{"id":13,"name":"\\u4e0a\\u865e","type":"group","count":4,"data":[{"id":10,"name":"4","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block16_cesium\\/Scene\\/symblock16_cesium.json","description":"4","icon":null,"img":null,"per":0,"group_id":13,"created_at":"2018-11-14 15:56:18","updated_at":"2018-11-14 15:56:18","monomer":null},{"id":9,"name":"3","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block15_cesium\\/Scene\\/symblock15_cesium.json","description":"3","icon":null,"img":null,"per":0,"group_id":13,"created_at":"2018-11-14 15:56:00","updated_at":"2018-11-14 15:56:00","monomer":null},{"id":8,"name":"2","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block14_cesium\\/Scene\\/symblock14_cesium.json","description":"2","icon":null,"img":null,"per":0,"group_id":13,"created_at":"2018-11-14 15:55:47","updated_at":"2018-11-14 15:55:47","monomer":null},{"id":7,"name":"1","url":"http:\\/\\/192.168.3.234:84\\/Scene\\/Scene\\/shangyu\\/final\\/sy-block13_cesium\\/Scene\\/symblock13_cesium.json","description":"1","icon":null,"img":null,"per":0,"group_id":13,"created_at":"2018-11-14 15:55:02","updated_at":"2018-11-14 15:55:09","monomer":null}],"per":0}]},"images":{"data":[{"id":58,"name":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u5f71\\u50cf","url":"http:\\/\\/t0.tianditu.com\\/img_w\\/wmts?","layer":"img","style":"default","format":"tiles","tilematrixsetid":"w","description":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u5f71\\u50cf","level":"1","visiblelevel":"18","type":"TDT","ellipsoid":"wgs84","img":null,"maxlevel":"18","per":0,"sort":1,"created_at":"2018-03-29 15:05:23","updated_at":"2018-09-12 14:30:01"},{"id":55,"name":"open street map","url":"https:\\/\\/a.tile.openstreetmap.org\\/","layer":null,"style":null,"format":null,"tilematrixsetid":null,"description":"open street map","level":"2","visiblelevel":"18","type":"OSM","ellipsoid":"wgs84","img":null,"maxlevel":"18","per":0,"sort":4,"created_at":"2018-03-29 15:02:56","updated_at":"2018-09-12 14:29:58"},{"id":72,"name":"Esri World Map","url":"https:\\/\\/server.arcgisonline.com\\/arcgis\\/rest\\/services\\/World_Imagery\\/MapServer","layer":null,"style":null,"format":null,"tilematrixsetid":null,"description":"Esri World Map","level":null,"visiblelevel":null,"type":null,"ellipsoid":null,"img":"fa-pencil","maxlevel":null,"per":0,"sort":5,"created_at":"2018-04-17 11:45:19","updated_at":"2018-10-23 14:16:56"},{"id":56,"name":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u7535\\u5b50\\u5730\\u56fe","url":"http:\\/\\/t0.tianditu.com\\/vec_w\\/wmts?","layer":"vec","style":"default","format":"tiles","tilematrixsetid":"w","description":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u7535\\u5b50\\u5730\\u56fe","level":"1","visiblelevel":"18","type":"TDT","ellipsoid":"wgs84","img":null,"maxlevel":"13","per":0,"sort":8,"created_at":"2018-03-29 15:03:57","updated_at":"2018-10-26 12:54:12"}]},"terrains":{"data":[{"id":2,"name":"google\\u5168\\u7403\\u5730\\u5f62","url":"http:\\/\\/www.supermapol.com\\/iserver\\/services\\/3D-stk_terrain\\/rest\\/realspace\\/datas\\/info\\/data\\/path","description":"google\\u5168\\u7403\\u5730\\u5f62","watermask":"1","vertexnormals":"1","ellipsoid":"wgs84","type":"popdem","img":"fa-adn","per":0,"created_at":"2018-03-28 11:20:09","updated_at":"2018-09-12 16:52:36"},{"id":1,"name":"STK\\u5168\\u7403\\u5730\\u5f62","url":"https:\\/\\/assets.agi.com\\/stk-terrain\\/world","description":"STK\\u5168\\u7403\\u5730\\u5f62","watermask":"1","vertexnormals":"1","ellipsoid":"wgs84","type":"popdem","img":"fa-adn","per":0,"created_at":"2018-03-28 11:15:01","updated_at":"2018-09-12 16:52:37"}]},"toolbar":{"toolbar":[{"id":"layer","title":"\\u57fa\\u7840\\u5e95\\u56fe","img":"images\\/maplayer.svg","fun":"layer","content":{"type":"list","list":[{"title":"\\u5f71\\u50cf","switch":true,"id":"image","part":[{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u5f71\\u50cf","id":58,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":0},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"open street map","id":55,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":0},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"Esri World Map","id":72,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":0},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u5929\\u5730\\u56fe\\u5168\\u7403\\u7535\\u5b50\\u5730\\u56fe","id":56,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":0},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u79bb\\u7ebf\\u5730\\u56fe","id":57,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":1}]},{"title":"\\u5730\\u5f62","switch":true,"id":"terrain","part":[{"img":null,"icon":null,"info":"google\\u5168\\u7403\\u5730\\u5f62","id":2,"buttons":[],"per":0},{"img":null,"icon":null,"info":"STK\\u5168\\u7403\\u5730\\u5f62","id":1,"buttons":[],"per":0}]}]}},{"title":"\\u57ce\\u5e02\\u5b9e\\u666f","switch":true,"id":"tilesets","fun":"tileset","img":"images\\/location.svg","content":{"type":"list","list":[{"title":"\\u503e\\u659c\\u6570\\u636e","img":"images\\/location.svg","id":"tileset","switch":true,"part":[{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u4e0a\\u865e","id":"group-13","buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":0,"part":[{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"4","id":"group-13-10","buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":0,"monomer":null},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"3","id":"group-13-9","buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":0,"monomer":null},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"2","id":"group-13-8","buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":0,"monomer":null},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"1","id":"group-13-7","buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":0,"monomer":null}]},{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u6c34\\u5c1a\\u540d\\u90fd","id":11,"buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":1,"monomer":null}]}]}}]}},"-1":{"toolbar":{"toolbar":[{"id":"layer","title":"\\u57fa\\u7840\\u5e95\\u56fe","img":"images\\/maplayer.svg","fun":"layer","content":{"type":"list","list":[{"title":"\\u5f71\\u50cf","switch":true,"id":"image","part":[{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u79bb\\u7ebf\\u5730\\u56fe","id":57,"buttons":[{"name":"\\u4fe1\\u606f","id":"imageryBtn"},{"name":"\\u8bbe\\u7f6e","id":"imagerySetting"}],"per":1}]},{"title":"\\u5730\\u5f62","switch":true,"id":"terrain","part":[]}]}},{"title":"\\u57ce\\u5e02\\u5b9e\\u666f","switch":true,"id":"tilesets","fun":"tileset","img":"images\\/location.svg","content":{"type":"list","list":[{"title":"\\u503e\\u659c\\u6570\\u636e","img":"images\\/location.svg","id":"tileset","switch":true,"part":[{"img":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","icon":"http:\\/\\/192.168.3.254\\/popcity\\/images\\/city.png","info":"\\u6c34\\u5c1a\\u540d\\u90fd","id":11,"buttons":[{"name":"\\u67e5\\u770b","id":"tilesetBtn"}],"per":1,"monomer":null}]}]}}]}}}";	1857699996
_cache71db4b4a62ca8564505efa87b0efadfedc7341fa	i:13;	1542343880
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, res_id, res_type, from_u, to_u, parent_id, content, active, vote_up, vote_down, commented_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, title, color, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, grid, address, "position", event_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Data for Name: household; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.household (id, bsm, ywh, qlbsm, qlbm, bdcdyh, bdcqzh, gyqk, zl, qllx, qlxz, qlxz1, qlxz2, yt, yt1, yt2, mj, mj1, mj2, syqx, fj, fzjc, fzdq, fznf, fzbm, fzxh, fzgbh, gxsj, build_no, floor_num, room_num, room_alias, created_at, updated_at) FROM stdin;
650	108993397	20161026-0030991	108993391	FDCQ	330604012051GB00708F00030091	浙(2016)绍兴市上虞区不动产权第0016116号	共同共有	百官街道大通水尚名都3幢3003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016116	16116	33100060285	2016/10/26 10:12:04	3	30	03		2018-10-25 13:40:51	2018-10-25 16:41:49
2	109001964	20161027-0031170	109001958	FDCQ	330604012051GB00708F00060049	浙(2016)绍兴市上虞区不动产权第0016288号	共同共有	百官街道大通水尚名都7幢1单元201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.01㎡/房屋建筑面积87.35㎡	5.01	87.35	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016288	16288	33100060338	2016/10/27 9:16:08	7	2	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
3	109001948	20161027-0031171	109001942	FDCQ	330604012051GB00708F00090048	浙(2016)绍兴市上虞区不动产权第0016196号	共同共有	百官街道大通水尚名都10幢2004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016196	16196	33100060031	2016/10/27 9:15:41	10	20	04		2018-10-25 13:40:48	2018-10-25 16:40:55
4	110053173	20170119-0050553	110053167	FDCQ	330604012051GB00708F00090093	浙(2017)绍兴市上虞区不动产权第0004128号	共同共有	百官街道大通水尚名都10幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004128	4128	33001395963	2017/1/19 16:17:48	10	3	01		2018-10-25 13:40:48	2018-10-25 16:40:55
5	110663969	20170328-0060715	110663963	FDCQ	330604012051GB00708F00080060	浙(2017)绍兴市上虞区不动产权第0009889号	共同共有	百官街道大通水尚名都9幢2单元1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009889	9889	33001399896	2017/3/28 15:15:49	9	10	04	2	2018-10-25 13:40:48	2018-10-25 16:40:55
6	108984466	20161025-0030794	108984460	FDCQ	330604012051GB00708F00010022	浙(2016)绍兴市上虞区不动产权第0016051号	共同共有	百官街道大通水尚名都1幢1601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016051	16051	33100060269	2016/10/25 11:14:14	1	16	01		2018-10-25 13:40:48	2018-10-25 16:40:55
7	110778726	20170411-0063057	110778720	FDCQ	330604012051GB00708F00080005	浙(2017)绍兴市上虞区不动产权第0010754号	共同共有	百官街道大通水尚名都9幢1单元1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010754	10754	33001400690	2017/4/11 10:32:08	9	12	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
8	213244589	20170907-0092346	213244583	FDCQ	330604012051GB00708F00060107	浙(2017)绍兴市上虞区不动产权第0024857号	共同共有	百官街道大通水尚名都7幢2单元107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0024857	24857	33001411379	2017/9/7 10:43:43	7	1	07	2	2018-10-25 13:40:48	2018-10-25 16:40:55
9	109030002	20161031-0031821	109029996	FDCQ	330604012051GB00708F00050063	浙(2016)绍兴市上虞区不动产权第0016509号	共同共有	百官街道大通水尚名都6幢2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016509	16509	33100060432	2016/10/31 14:24:55	6	23	03		2018-10-25 13:40:48	2018-10-25 16:40:55
10	109258794	20161123-0036619	109258788	FDCQ	330604012051GB00708F00010040	浙(2016)绍兴市上虞区不动产权第0018925号	共同共有	百官街道大通水尚名都1幢2101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018925	18925	33100063231	2016/11/23 15:49:51	1	21	01		2018-10-25 13:40:48	2018-10-25 16:40:55
11	216574005	20180209-0013473	216573997	FDCQ	330604012051GB00708F00120085	浙(2018)绍兴市上虞区不动产权第0009782号	共同共有	百官街道大通水尚名都12幢2单元905室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0009782	9782	33003118961	2018/2/9 10:27:28	12	9	05	2	2018-10-25 13:40:48	2018-10-25 16:40:55
12	109282377	20161128-0037130	109282371	FDCQ	330604012051GB00708F00040087	浙(2016)绍兴市上虞区不动产权第0019273号	共同共有	百官街道大通水尚名都5幢603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019273	19273	33100063806	2016/11/28 9:18:05	5	6	03		2018-10-25 13:40:48	2018-10-25 16:40:55
13	215276813	20171130-0012119	215276807	FDCQ	330604012051GB00708F00060104	浙(2017)绍兴市上虞区不动产权第0031877号	共同共有	百官街道大通水尚名都7幢2单元1008室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让	浙	绍兴市上虞区	2017	0031877	31877	33001416832	2017/11/30 14:57:29	7	10	08	2	2018-10-25 13:40:48	2018-10-25 16:40:55
14	109141638	20161110-0034005	109141632	FDCQ	330604012051GB00708F00090035	浙(2016)绍兴市上虞区不动产权第0017832号	共同共有	百官街道大通水尚名都10幢1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017832	17832	33100061395	2016/11/10 9:15:19	10	17	03		2018-10-25 13:40:48	2018-10-25 16:40:55
659	109052676	20161102-0032262	109052670	FDCQ	330604012051GB00708F00050052	浙(2016)绍兴市上虞区不动产权第0016746号	共同共有	百官街道大通水尚名都6幢204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.98㎡/房屋建筑面积87.38㎡	4.98	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016746	16746	33100060839	2016/11/2 9:04:18	6	2	04		2018-10-25 13:40:51	2018-10-25 16:41:49
673	109024104	20161031-0031692	109024098	FDCQ	330604012051GB00708F00040080	浙(2016)绍兴市上虞区不动产权第0016623号	共同共有	百官街道大通水尚名都5幢3A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016623	16623	33100060767	2016/10/31 9:26:20	5	4	04		2018-10-25 13:40:51	2018-10-25 16:41:49
16	219955295	20180712-0049064	219955290	FDCQ	330604012051GB00708F00010066	浙(2018)绍兴市上虞区不动产权第0033129号	单独所有	百官街道大通水尚名都1幢2903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0033129	33129	33003371459	2018/7/12 11:50:36	1	29	03		2018-10-25 13:40:48	2018-10-25 16:40:55
17	216770844	20180308-0017278	216770838	FDCQ	330604012051GB00708F00050003	浙(2018)绍兴市上虞区不动产权第0011564号	单独所有	百官街道大通水尚名都6幢1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0011564	11564	33003323307	2018/3/8 9:14:38	6	10	03		2018-10-25 13:40:48	2018-10-25 16:40:55
18	109349139	20161205-0038608	109349133	FDCQ	330604012051GB00708F00080045	浙(2016)绍兴市上虞区不动产权第0020162号	共同共有	百官街道大通水尚名都9幢1单元301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020162	20162	33100064747	2016/12/5 10:28:26	9	3	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
19	216126050	20180118-0006319	216126043	FDCQ	330604012051GB00708F00120077	浙(2018)绍兴市上虞区不动产权第0004854号	共同共有	百官街道大通水尚名都12幢2单元505室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0004854	4854	33003118289	2018/1/18 16:02:03	12	5	05	2	2018-10-25 13:40:48	2018-10-25 16:40:55
20	110768338	20170410-0062809	110768332	FDCQ	330604012051GB00708F00120028	浙(2017)绍兴市上虞区不动产权第0010671号	共同共有	百官街道大通水尚名都12幢1单元2104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010671	10671	33001400671	2017/4/10 11:53:34	12	21	04	1	2018-10-25 13:40:48	2018-10-25 16:40:55
21	109110160	20161107-0033270	109110154	FDCQ	330604012051GB00708F00070099	浙(2016)绍兴市上虞区不动产权第0017210号	共同共有	百官街道大通水尚名都8幢2单元2903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017210	17210	33100061055	2016/11/7 15:09:05	8	29	03	2	2018-10-25 13:40:48	2018-10-25 16:40:55
22	109347400	20161205-0038561	109347395	FDCQ	330604012051GB00708F00090061	浙(2016)绍兴市上虞区不动产权第0020160号	单独所有	百官街道大通水尚名都10幢2301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020160	20160	33100064861	2016/12/5 9:48:27	10	23	01		2018-10-25 13:40:48	2018-10-25 16:40:55
23	109517033	20161220-0042318	109517027	FDCQ	330604012051GB00708F00020030	浙(2016)绍兴市上虞区不动产权第0022397号	共同共有	百官街道大通水尚名都2幢2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022397	22397	33001391655	2016/12/20 9:24:32	2	22	02		2018-10-25 13:40:48	2018-10-25 16:40:55
24	109272936	20161125-0036922	109272930	FDCQ	330604012051GB00708F00010056	浙(2016)绍兴市上虞区不动产权第0019024号	共同共有	百官街道大通水尚名都1幢2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019024	19024	33100063070	2016/11/25 10:14:04	1	26	02		2018-10-25 13:40:48	2018-10-25 16:40:55
25	109277470	20161125-0037023	109277464	FDCQ	330604012051GB00708F00080042	浙(2016)绍兴市上虞区不动产权第0019313号	共同共有	百官街道大通水尚名都9幢1单元2902室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019313	19313	33100063720	2016/11/25 14:28:09	9	29	02	1	2018-10-25 13:40:48	2018-10-25 16:40:55
27	109226813	20161121-0035936	109226807	FDCQ	330604012051GB00708F00070064	浙(2016)绍兴市上虞区不动产权第0018594号	共同共有	百官街道大通水尚名都8幢2单元1204室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018594	18594	33100062829	2016/11/21 10:08:42	8	12	04	2	2018-10-25 13:40:48	2018-10-25 16:40:55
28	109278059	20161125-0037044	109278054	FDCQ	330604012051GB00708F00030123	浙(2016)绍兴市上虞区不动产权第0019012号	单独所有	百官街道大通水尚名都3幢903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019012	19012	33100063257	2016/11/25 14:49:25	3	9	03		2018-10-25 13:40:48	2018-10-25 16:40:55
687	109250436	20161123-0036456	109250430	FDCQ	330604012051GB00708F00010019	浙(2016)绍兴市上虞区不动产权第0018764号	共同共有	百官街道大通水尚名都1幢1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018764	18764	33100062497	2016/11/23 8:56:48	1	15	01		2018-10-25 13:40:51	2018-10-25 16:41:49
701	109168532	20161114-0034637	109168527	FDCQ	330604012051GB00708F00050060	浙(2016)绍兴市上虞区不动产权第0018117号	单独所有	百官街道大通水尚名都6幢2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018117	18117	33100062071	2016/11/14 10:52:31	6	22	04		2018-10-25 13:40:51	2018-10-25 16:41:49
30	109197373	20161116-0035252	109197367	FDCQ	330604012051GB00708F00090083	浙(2016)绍兴市上虞区不动产权第0018334号	共同共有	百官街道大通水尚名都10幢2803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018334	18334	33100062335	2016/11/16 15:08:04	10	28	03		2018-10-25 13:40:48	2018-10-25 16:40:55
31	110084418	20170123-0051202	110084412	FDCQ	330604012051GB00708F00070077	浙(2017)绍兴市上虞区不动产权第0004367号	共同共有	百官街道大通水尚名都8幢2单元1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004367	4367	33001396173	2017/1/23 14:32:49	8	19	03	2	2018-10-25 13:40:48	2018-10-25 16:40:55
32	109070944	20161103-0032587	109070938	FDCQ	330604012051GB00708F00040052	浙(2016)绍兴市上虞区不动产权第0017239号	共同共有	百官街道大通水尚名都5幢204室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.93㎡/房屋建筑面积87.38㎡	4.93	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017239	17239	33100061067	2016/11/3 10:10:26	5	2	04		2018-10-25 13:40:48	2018-10-25 16:40:55
33	109039173	20161101-0031991	109039158	FDCQ	330604012051GB00708F00050033	浙(2016)绍兴市上虞区不动产权第0016611号	共同共有	百官街道大通水尚名都6幢1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016611	16611	33100060807	2016/11/1 9:28:55	6	17	01		2018-10-25 13:40:48	2018-10-25 16:40:55
34	219976403	20180716-0049478	219976396	FDCQ	330604012051GB00708F00090118	浙(2018)绍兴市上虞区不动产权第0033306号	共同共有	百官街道大通水尚名都10幢902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0033306	33306	33003371981	2018/7/16 9:40:56	10	9	02		2018-10-25 13:40:48	2018-10-25 16:40:55
35	216528512	20180206-0012659	216528507	FDCQ	330604012051GB00708F00070037	浙(2018)绍兴市上虞区不动产权第0009468号	单独所有	百官街道大通水尚名都8幢1单元2701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0009468	9468	33003118914	2018/2/6 14:20:24	8	27	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
37	216422917	20180131-0011039	216422910	FDCQ	330604012051GB00708F00100061	浙(2018)绍兴市上虞区不动产权第0008433号	共同共有	百官街道大通水尚名都11幢2单元1705室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0008433	8433	33003320655	2018/1/31 14:52:30	11	17	05	2	2018-10-25 13:40:48	2018-10-25 16:40:55
38	109171548	20161114-0034682	109171542	FDCQ	330604012051GB00708F00120058	浙(2016)绍兴市上虞区不动产权第0018160号	共同共有	百官街道大通水尚名都12幢2单元1506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018160	18160	33100062088	2016/11/14 14:34:50	12	15	06	2	2018-10-25 13:40:48	2018-10-25 16:40:55
39	109069669	20161103-0032554	109069663	FDCQ	330604012051GB00708F00060179	浙(2016)绍兴市上虞区不动产权第0017242号	共同共有	百官街道大通水尚名都7幢2单元3A07室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017242	17242	33100061069	2016/11/3 9:27:51	7	4	07	2	2018-10-25 13:40:48	2018-10-25 16:40:55
40	109069687	20161103-0032556	109069681	FDCQ	330604012051GB00708F00030120	浙(2016)绍兴市上虞区不动产权第0017258号	共同共有	百官街道大通水尚名都3幢804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017258	17258	33100061110	2016/11/3 9:28:22	3	8	04		2018-10-25 13:40:48	2018-10-25 16:40:55
41	109500895	20161219-0041960	109500889	FDCQ	330604012051GB00708F00060180	浙(2016)绍兴市上虞区不动产权第0021938号	共同共有	百官街道大通水尚名都7幢2单元3A08室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021938	21938	33000310231	2016/12/19 10:22:07	7	4	08	2	2018-10-25 13:40:48	2018-10-25 16:40:55
42	219338621	20180530-0038137	219338615	FDCQ	330604012051GB00708F00040097	浙(2018)绍兴市上虞区不动产权第0026975号	单独所有	百官街道大通水尚名都5幢901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0026975	26975	33003333113	2018/5/30 10:34:32	5	9	01		2018-10-25 13:40:48	2018-10-25 16:40:55
715	109069330	20161103-0032547	109069324	FDCQ	330604012051GB00708F00070007	浙(2016)绍兴市上虞区不动产权第0016871号	共同共有	百官街道大通水尚名都8幢1单元12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016871	16871	33100060875	2016/11/3 9:14:53	8	13	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
729	109001636	20161027-0031163	109001631	FDCQ	330604012051GB00708F00010083	浙(2016)绍兴市上虞区不动产权第0016143号	单独所有	百官街道大通水尚名都1幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016143	16143	33100060005	2016/10/27 9:03:31	1	6	02		2018-10-25 13:40:51	2018-10-25 16:41:49
44	215077076	20171109-0008026	215077069	FDCQ	330604012051GB00708F00040075	浙(2017)绍兴市上虞区不动产权第0029990号	共同共有	百官街道大通水尚名都5幢303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让	浙	绍兴市上虞区	2017	0029990	29990	33001415761	2017/11/9 15:00:37	5	3	03		2018-10-25 13:40:48	2018-10-25 16:40:55
45	215043811	20171107-0007266	215043805	FDCQ	330604012051GB00708F00040069	浙(2017)绍兴市上虞区不动产权第0029715号	共同共有	百官街道大通水尚名都5幢2501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0029715	29715	33001414909	2017/11/7 9:00:28	5	25	01		2018-10-25 13:40:48	2018-10-25 16:40:55
46	215035450	20171106-0007092	215035443	FDCQ	330604012051GB00708F00060047	浙(2017)绍兴市上虞区不动产权第0029635号	共同共有	百官街道大通水尚名都7幢1单元2003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0029635	29635	33001415592	2017/11/6 10:55:55	7	20	03	1	2018-10-25 13:40:48	2018-10-25 16:40:55
47	219905032	20180709-0048097	219905025	FDCQ	330604012051GB00708F00120080	浙(2018)绍兴市上虞区不动产权第0032550号	共同共有	百官街道大通水尚名都12幢2单元508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0032550	32550	33003371444	2018/7/9 10:19:15	12	5	08	2	2018-10-25 13:40:48	2018-10-25 16:40:55
48	215103122	20171113-0008595	215103116	FDCQ	330604012051GB00708F00080104	浙(2017)绍兴市上虞区不动产权第0030226号	共同共有	百官街道大通水尚名都9幢2单元304室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0030226	30226	33001416009	2017/11/13 16:02:49	9	3	04	2	2018-10-25 13:40:48	2018-10-25 16:40:55
49	215090623	20171110-0008297	215090618	FDCQ	330604012051GB00708F00090042	浙(2017)绍兴市上虞区不动产权第0030081号	单独所有	百官街道大通水尚名都10幢1902室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0030081	30081	33001414985	2017/11/10 16:11:11	10	19	02		2018-10-25 13:40:48	2018-10-25 16:40:55
50	109154194	20161111-0034302	109154188	FDCQ	330604012051GB00708F00090102	浙(2016)绍兴市上虞区不动产权第0018031号	共同共有	百官街道大通水尚名都10幢502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018031	18031	33100062123	2016/11/11 10:00:32	10	5	02		2018-10-25 13:40:48	2018-10-25 16:40:55
51	214880996	20171020-0004091	214880990	FDCQ	330604012051GB00708F00070018	浙(2017)绍兴市上虞区不动产权第0028526号	共同共有	百官街道大通水尚名都8幢1单元17A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0028526	28526	33001414686	2017/10/20 10:46:25	8	18	02	1	2018-10-25 13:40:48	2018-10-25 16:40:55
53	109199584	20161117-0035303	109199578	FDCQ	330604012051GB00708F00090017	浙(2016)绍兴市上虞区不动产权第0018539号	共同共有	百官街道大通水尚名都10幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018539	18539	33100062802	2016/11/17 8:53:22	10	13	01		2018-10-25 13:40:48	2018-10-25 16:40:55
54	109200728	20161117-0035339	109200722	FDCQ	330604012051GB00708F00120053	浙(2016)绍兴市上虞区不动产权第0018385号	共同共有	百官街道大通水尚名都12幢2单元12A05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018385	18385	33100062356	2016/11/17 9:38:46	12	13	05	2	2018-10-25 13:40:48	2018-10-25 16:40:55
55	112579384	20170808-0086957	112579377	FDCQ	330604012051GB00708F00060012	浙(2017)绍兴市上虞区不动产权第0021504号	共同共有	百官街道大通水尚名都7幢1单元1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0021504	21504	33001409638	2017/8/8 9:55:55	7	11	04	1	2018-10-25 13:40:48	2018-10-25 16:40:55
56	109961246	20170113-0049167	109961240	FDCQ	330604012051GB00708F00070043	浙(2017)绍兴市上虞区不动产权第0003362号	共同共有	百官街道大通水尚名都8幢1单元3001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003362	3362	33001395558	2017/1/13 11:16:35	8	30	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
743	109154635	20161111-0034316	109154629	FDCQ	330604012051GB00708F00070016	浙(2016)绍兴市上虞区不动产权第0017732号	共同共有	百官街道大通水尚名都8幢1单元1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017732	17732	33100061437	2016/11/11 10:18:33	8	17	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
58	108987695	20161025-0030869	108987689	FDCQ	330604012051GB00708F00090089	浙(2016)绍兴市上虞区不动产权第0015929号	共同共有	百官街道大通水尚名都10幢3001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015929	15929	33100059750	2016/10/25 14:42:12	10	30	01		2018-10-25 13:40:48	2018-10-25 16:40:55
59	112737808	20170815-0088292	112737802	FDCQ	330604012051GB00708F00030047	浙(2017)绍兴市上虞区不动产权第0021802号	单独所有	百官街道大通水尚名都3幢2003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0021802	21802	33001409725	2017/8/15 16:04:31	3	20	03		2018-10-25 13:40:48	2018-10-25 16:40:55
60	215631737	20171226-0017780	215631730	FDCQ	330604012051GB00708F00050100	浙(2017)绍兴市上虞区不动产权第0035348号	共同共有	百官街道大通水尚名都6幢904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0035348	35348	33001419408	2017/12/26 9:10:41	6	9	04		2018-10-25 13:40:48	2018-10-25 16:40:55
61	215175890	20171120-0010023	215175883	FDCQ	330604012051GB00708F00020023	浙(2017)绍兴市上虞区不动产权第0030961号	共同共有	百官街道大通水尚名都2幢2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0030961	30961	33001416555	2017/11/20 16:06:19	2	20	01		2018-10-25 13:40:48	2018-10-25 16:40:55
62	215349302	20171208-0013792	215349295	FDCQ	330604012051GB00708F00040005	浙(2017)绍兴市上虞区不动产权第0032621号	共同共有	百官街道大通水尚名都5幢101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.93㎡/房屋建筑面积87.38㎡	4.93	87.38	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0032621	32621	33001418330	2017/12/8 9:17:11	5	1	01		2018-10-25 13:40:48	2018-10-25 16:40:55
63	109089070	20161101-0031971	109089065	FDCQ	330604012051GB00708F00030055	浙(2016)绍兴市上虞区不动产权第0016600号	单独所有	百官街道大通水尚名都3幢2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016600	16600	33100060449	2016/11/4 11:05:01	3	21	03		2018-10-25 13:40:48	2018-10-25 16:40:55
64	109196538	20161116-0035235	109196532	FDCQ	330604012051GB00708F00090012	浙(2016)绍兴市上虞区不动产权第0018332号	共同共有	百官街道大通水尚名都10幢1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018332	18332	33100062334	2016/11/16 14:27:02	10	11	04		2018-10-25 13:40:48	2018-10-25 16:40:55
65	108981615	20161025-0030733	108981609	FDCQ	330604012051GB00708F00030010	浙(2016)绍兴市上虞区不动产权第0016310号	共同共有	百官街道大通水尚名都3幢1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016310	16310	33100060349	2016/10/25 9:49:35	3	11	02		2018-10-25 13:40:48	2018-10-25 16:40:55
66	217174041	20180323-0021460	217174034	FDCQ	330604012051GB00708F00060160	浙(2018)绍兴市上虞区不动产权第0013872号	共同共有	百官街道大通水尚名都7幢2单元2208室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0013872	13872	33003324980	2018/3/23 14:21:34	7	22	08	2	2018-10-25 13:40:48	2018-10-25 16:40:55
67	109260806	20161124-0036667	109260800	FDCQ	330604012051GB00708F00060017	浙(2016)绍兴市上虞区不动产权第0018868号	单独所有	百官街道大通水尚名都7幢1单元12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018868	18868	33100063034	2016/11/24 9:34:17	7	13	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
68	109266293	20161124-0036795	109266287	FDCQ	330604012051GB00708F00100076	浙(2016)绍兴市上虞区不动产权第0019056号	共同共有	百官街道大通水尚名都11幢2单元308室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019056	19056	33100063274	2016/11/24 14:37:49	11	3	08	2	2018-10-25 13:40:48	2018-10-25 16:40:55
69	109265890	20161124-0036786	109265884	FDCQ	330604012051GB00708F00050038	浙(2016)绍兴市上虞区不动产权第0018865号	共同共有	百官街道大通水尚名都6幢17A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018865	18865	33100063032	2016/11/24 14:29:25	6	18	02		2018-10-25 13:40:48	2018-10-25 16:40:55
70	109256945	20161123-0036583	109256939	FDCQ	330604012051GB00708F00050057	浙(2016)绍兴市上虞区不动产权第0018759号	共同共有	百官街道大通水尚名都6幢2201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018759	18759	33100062495	2016/11/23 14:48:25	6	22	01		2018-10-25 13:40:48	2018-10-25 16:40:55
757	109064168	20161102-0032450	109064162	FDCQ	330604012051GB00708F00070002	浙(2016)绍兴市上虞区不动产权第0016739号	共同共有	百官街道大通水尚名都8幢1单元1002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016739	16739	33100060836	2016/11/2 14:52:35	8	10	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
72	108987924	20161025-0030873	108987918	FDCQ	330604012051GB00708F00030042	浙(2016)绍兴市上虞区不动产权第0016169号	共同共有	百官街道大通水尚名都3幢1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016169	16169	33100060302	2016/10/25 14:51:17	3	19	02		2018-10-25 13:40:48	2018-10-25 16:40:55
73	109201627	20161117-0035365	109201621	FDCQ	330604012051GB00708F00010068	浙(2016)绍兴市上虞区不动产权第0018386号	共同共有	百官街道大通水尚名都1幢3002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018386	18386	33100062271	2016/11/17 10:04:04	1	30	02		2018-10-25 13:40:48	2018-10-25 16:40:55
74	110254330	20170217-0054525	110254324	FDCQ	330604012051GB00708F00060115	浙(2017)绍兴市上虞区不动产权第0005726号	共同共有	百官街道大通水尚名都7幢2单元1207室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005726	5726	33001397495	2017/2/17 16:26:07	7	12	07	2	2018-10-25 13:40:48	2018-10-25 16:40:55
75	108997615	20161024-0030634	108997609	FDCQ	330604012051GB00708F00020007	浙(2016)绍兴市上虞区不动产权第0015829号	共同共有	百官街道大通水尚名都2幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015829	15829	33100059726	2016/10/26 14:35:32	2	12	01		2018-10-25 13:40:48	2018-10-25 16:40:55
76	108997957	20161026-0031081	108997952	FDCQ	330604012051GB00708F00010062	浙(2016)绍兴市上虞区不动产权第0016215号	单独所有	百官街道大通水尚名都1幢2802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016215	16215	33100060041	2016/10/26 14:43:01	1	28	02		2018-10-25 13:40:48	2018-10-25 16:40:55
77	108998004	20161026-0031082	108997996	FDCQ	330604012051GB00708F00010037	浙(2016)绍兴市上虞区不动产权第0016156号	共同共有	百官街道大通水尚名都1幢201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.56㎡/房屋建筑面积140.11㎡	6.56	140.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016156	16156	33100060296	2016/10/26 14:43:28	1	2	01		2018-10-25 13:40:48	2018-10-25 16:40:55
78	109319802	20161201-0037931	109319797	FDCQ	330604012051GB00708F00010011	浙(2016)绍兴市上虞区不动产权第0019586号	单独所有	百官街道大通水尚名都1幢1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019586	19586	33100063859	2016/12/1 9:45:10	1	12	02		2018-10-25 13:40:48	2018-10-25 16:40:55
79	109319488	20161201-0037938	109319480	FDCQ	330604012051GB00708F00060014	浙(2016)绍兴市上虞区不动产权第0019718号	共同共有	百官街道大通水尚名都7幢1单元1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019718	19718	33100064121	2016/12/1 9:34:56	7	12	02	1	2018-10-25 13:40:48	2018-10-25 16:40:55
80	109179803	20161115-0034899	109179797	FDCQ	330604012051GB00708F00020049	浙(2016)绍兴市上虞区不动产权第0018203号	共同共有	百官街道大通水尚名都2幢701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018203	18203	33100062204	2016/11/15 10:21:58	2	7	01		2018-10-25 13:40:48	2018-10-25 16:40:55
81	216654166	20180226-0015186	216654160	FDCQ	330604012051GB00708F00020026	浙(2018)绍兴市上虞区不动产权第0010436号	共同共有	百官街道大通水尚名都2幢202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0010436	10436	33003323450	2018/2/26 15:57:15	2	2	02		2018-10-25 13:40:48	2018-10-25 16:40:55
82	109183523	20161115-0034964	109183517	FDCQ	330604012051GB00708F00020044	浙(2016)绍兴市上虞区不动产权第0018199号	共同共有	百官街道大通水尚名都2幢3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018199	18199	33100062182	2016/11/15 14:23:30	2	4	02		2018-10-25 13:40:48	2018-10-25 16:40:55
83	215167402	20171120-0009811	215167395	FDCQ	330604012051GB00708F00020054	浙(2017)绍兴市上虞区不动产权第0030828号	共同共有	百官街道大通水尚名都2幢902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0030828	30828	33001416082	2017/11/20 11:05:05	2	9	02		2018-10-25 13:40:48	2018-10-25 16:40:55
84	215202084	20171122-0010529	215202077	FDCQ	330604012051GB00708F00060191	浙(2017)绍兴市上虞区不动产权第0031233号	共同共有	百官街道大通水尚名都7幢2单元707室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0031233	31233	33001416583	2017/11/22 15:22:32	7	7	07	2	2018-10-25 13:40:48	2018-10-25 16:40:55
771	109096679	20161107-0033036	109096670	FDCQ	330604012051GB00708F00070039	浙(2016)绍兴市上虞区不动产权第0017422号	单独所有	百官街道大通水尚名都8幢1单元2801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017422	17422	33100061170	2016/11/7 8:59:52	8	28	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
86	109526225	20161220-0042525	109526217	FDCQ	330604012051GB00708F00100045	浙(2016)绍兴市上虞区不动产权第0022334号	共同共有	百官街道大通水尚名都11幢2单元105室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022334	22334	33001390061	2016/12/20 14:29:29	11	1	05	2	2018-10-25 13:40:48	2018-10-25 16:40:55
87	109141622	20161110-0034006	109141617	FDCQ	330604012051GB00708F00050054	浙(2016)绍兴市上虞区不动产权第0017860号	单独所有	百官街道大通水尚名都6幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017860	17860	33100062002	2016/11/10 9:14:15	6	21	02		2018-10-25 13:40:48	2018-10-25 16:40:55
88	109142081	20161110-0034012	109142075	FDCQ	330604012051GB00708F00050084	浙(2016)绍兴市上虞区不动产权第0017545号	共同共有	百官街道大通水尚名都6幢504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017545	17545	33100061275	2016/11/10 9:32:58	6	5	04		2018-10-25 13:40:48	2018-10-25 16:40:55
89	109142123	20161110-0034013	109142118	FDCQ	330604012051GB00708F00050092	浙(2016)绍兴市上虞区不动产权第0017570号	单独所有	百官街道大通水尚名都6幢704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017570	17570	33100061289	2016/11/10 9:33:57	6	7	04		2018-10-25 13:40:49	2018-10-25 16:40:55
90	109087363	20161104-0032856	109087356	FDCQ	330604012051GB00708F00070009	浙(2016)绍兴市上虞区不动产权第0017260号	共同共有	百官街道大通水尚名都8幢1单元12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017260	17260	33100061112	2016/11/4 10:16:20	8	13	01	1	2018-10-25 13:40:49	2018-10-25 16:40:55
91	109114549	20161108-0033390	109114543	FDCQ	330604012051GB00708F00060027	浙(2016)绍兴市上虞区不动产权第0017305号	共同共有	百官街道大通水尚名都7幢1单元1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017305	17305	33100061088	2016/11/8 9:36:16	7	15	03	1	2018-10-25 13:40:49	2018-10-25 16:40:55
92	111204495	20170427-0066322	111204489	FDCQ	330604012051GB00708F00020021	浙(2017)绍兴市上虞区不动产权第0011958号	共同共有	百官街道大通水尚名都2幢1901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011958	11958	33001402270	2017/4/27 11:16:30	2	19	01		2018-10-25 13:40:49	2018-10-25 16:40:55
93	108983156	20161025-0030761	108983150	FDCQ	330604012051GB00708F00120036	浙(2016)绍兴市上虞区不动产权第0016209号	共同共有	百官街道大通水尚名都12幢1单元504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016209	16209	33100060037	2016/10/25 10:28:30	12	5	04	1	2018-10-25 13:40:49	2018-10-25 16:40:55
94	109159179	20161111-0034423	109159173	FDCQ	330604012051GB00708F00070111	浙(2016)绍兴市上虞区不动产权第0017738号	共同共有	百官街道大通水尚名都8幢2单元703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017738	17738	33100061438	2016/11/11 14:31:03	8	7	03	2	2018-10-25 13:40:49	2018-10-25 16:40:55
95	110107395	20170125-0051737	110107389	FDCQ	330604012051GB00708F00050062	浙(2017)绍兴市上虞区不动产权第0004508号	共同共有	百官街道大通水尚名都6幢2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004508	4508	33001396055	2017/1/25 14:55:19	6	23	02		2018-10-25 13:40:49	2018-10-25 16:40:55
96	109026356	20161031-0031746	109026350	FDCQ	330604012051GB00708F00030113	浙(2016)绍兴市上虞区不动产权第0016500号	共同共有	百官街道大通水尚名都3幢701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016500	16500	33100060427	2016/10/31 10:22:10	3	7	01		2018-10-25 13:40:49	2018-10-25 16:40:55
97	109027486	20161031-0031768	109027479	FDCQ	330604012051GB00708F00030031	浙(2016)绍兴市上虞区不动产权第0016502号	共同共有	百官街道大通水尚名都3幢1603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016502	16502	33100060428	2016/10/31 11:05:21	3	16	03		2018-10-25 13:40:49	2018-10-25 16:40:55
98	109156451	20161111-0034359	109156444	FDCQ	330604012051GB00708F00080063	浙(2016)绍兴市上虞区不动产权第0017714号	共同共有	百官街道大通水尚名都9幢2单元1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017714	17714	33100061429	2016/11/11 11:08:34	9	12	03	2	2018-10-25 13:40:49	2018-10-25 16:40:55
785	109019131	20161028-0031558	109019125	FDCQ	330604012051GB00708F00040090	浙(2016)绍兴市上虞区不动产权第0016689号	共同共有	百官街道大通水尚名都5幢702室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016689	16689	33100060828	2016/10/28 14:19:39	5	7	02		2018-10-25 13:40:51	2018-10-25 16:41:53
102	109388716	20161208-0039491	109388710	FDCQ	330604012051GB00708F00050098	浙(2016)绍兴市上虞区不动产权第0020613号	共同共有	百官街道大通水尚名都6幢902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020613	20613	33100064935	2016/12/8 9:35:55	6	9	02		2018-10-25 13:40:49	2018-10-25 16:42:53
100	112752522	20170816-0088377	112752516	FDCQ	330604012051GB00708F00080099	浙(2017)绍兴市上虞区不动产权第0022368号	单独所有	百官街道大通水尚名都9幢2单元2903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0022368	22368	33001409873	2017/8/16 10:21:29	9	29	03	2	2018-10-25 13:40:49	2018-10-25 16:40:55
103	109388729	20161208-0039487	109388723	FDCQ	330604012051GB00708F00060164	浙(2016)绍兴市上虞区不动产权第0020655号	共同共有	百官街道大通水尚名都7幢2单元2308室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020655	20655	33100064950	2016/12/8 9:37:30	7	23	08	2	2018-10-25 13:40:49	2018-10-25 16:42:53
104	109874645	20170109-0047560	109874639	FDCQ	330604012051GB00708F00030065	浙(2017)绍兴市上虞区不动产权第0002760号	共同共有	百官街道大通水尚名都3幢23A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002760	2760	33001393972	2017/1/9 11:04:08	3	24	01		2018-10-25 13:40:49	2018-10-25 16:42:53
105	109324922	20161201-0038043	109324915	FDCQ	330604012051GB00708F00080047	浙(2016)绍兴市上虞区不动产权第0019761号	共同共有	百官街道大通水尚名都9幢1单元3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019761	19761	33100064131	2016/12/1 14:31:36	9	4	01	1	2018-10-25 13:40:49	2018-10-25 16:42:53
106	109196676	20161116-0035239	109196670	FDCQ	330604012051GB00708F00080049	浙(2016)绍兴市上虞区不动产权第0018361号	共同共有	百官街道大通水尚名都9幢1单元501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018361	18361	33100062345	2016/11/16 14:34:42	9	5	01	1	2018-10-25 13:40:49	2018-10-25 16:42:53
107	109197713	20161116-0035264	109197707	FDCQ	330604012051GB00708F00040100	浙(2016)绍兴市上虞区不动产权第0018311号	共同共有	百官街道大通水尚名都5幢904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018311	18311	33100062324	2016/11/16 15:33:56	5	9	04		2018-10-25 13:40:49	2018-10-25 16:42:53
108	108983378	20161025-0030764	108983372	FDCQ	330604012051GB00708F00070082	浙(2016)绍兴市上虞区不动产权第0016286号	共同共有	百官街道大通水尚名都8幢2单元204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016286	16286	33100060337	2016/10/25 10:35:50	8	2	04	2	2018-10-25 13:40:49	2018-10-25 16:42:53
109	219283216	20180525-0037184	219283210	FDCQ	330604012051GB00708F00040050	浙(2018)绍兴市上虞区不动产权第0026283号	单独所有	百官街道大通水尚名都5幢202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积89.23㎡	5.03	89.23	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0026283	26283	33003332897	2018/5/25 9:14:12	5	2	02		2018-10-25 13:40:49	2018-10-25 16:42:53
110	109199461	20161117-0035301	109199455	FDCQ	330604012051GB00708F00100025	浙(2016)绍兴市上虞区不动产权第0018401号	共同共有	百官街道大通水尚名都11幢1单元2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018401	18401	33100062363	2016/11/17 8:45:38	11	21	01	1	2018-10-25 13:40:49	2018-10-25 16:42:53
111	109364986	20161206-0038953	109364978	FDCQ	330604012051GB00708F00080064	浙(2016)绍兴市上虞区不动产权第0020275号	共同共有	百官街道大通水尚名都9幢2单元1204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020275	20275	33100064881	2016/12/6 10:43:04	9	12	04	2	2018-10-25 13:40:49	2018-10-25 16:42:53
112	109262484	20161124-0036715	109262478	FDCQ	330604012051GB00708F00010033	浙(2016)绍兴市上虞区不动产权第0019071号	共同共有	百官街道大通水尚名都1幢1903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019071	19071	33100063089	2016/11/24 10:33:49	1	19	03		2018-10-25 13:40:49	2018-10-25 16:42:53
799	109069559	20161103-0032555	109069553	FDCQ	330604012051GB00708F00070035	浙(2016)绍兴市上虞区不动产权第0016873号	共同共有	百官街道大通水尚名都8幢1单元2601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016873	16873	33100060876	2016/11/3 9:25:21	8	26	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
114	108992794	20161026-0030979	108992788	FDCQ	330604012051GB00708F00010079	浙(2016)绍兴市上虞区不动产权第0016029号	共同共有	百官街道大通水尚名都1幢501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016029	16029	33100059970	2016/10/26 9:54:44	1	5	01		2018-10-25 13:40:49	2018-10-25 16:41:07
115	108992931	20161026-0030980	108992925	FDCQ	330604012051GB00708F00020006	浙(2016)绍兴市上虞区不动产权第0016269号	共同共有	百官街道大通水尚名都2幢1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016269	16269	33100060334	2016/10/26 9:59:26	2	11	02		2018-10-25 13:40:49	2018-10-25 16:41:07
116	213242140	20170907-0092331	213242135	FDCQ	330604012051GB00708F00020025	浙(2017)绍兴市上虞区不动产权第0024831号	单独所有	百官街道大通水尚名都2幢201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0024831	24831	33001411077	2017/9/7 10:08:18	2	2	01		2018-10-25 13:40:49	2018-10-25 16:41:07
117	109337718	20161202-0038326	109337711	FDCQ	330604012051GB00708F00090019	浙(2016)绍兴市上虞区不动产权第0019937号	共同共有	百官街道大通水尚名都10幢12A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019937	19937	33100064789	2016/12/2 14:48:35	10	13	03		2018-10-25 13:40:49	2018-10-25 16:41:07
118	108987540	20161025-0030863	108987534	FDCQ	330604012051GB00708F00010076	浙(2016)绍兴市上虞区不动产权第0015970号	共同共有	百官街道大通水尚名都1幢3A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015970	15970	33100060266	2016/10/25 14:37:05	1	4	01		2018-10-25 13:40:49	2018-10-25 16:41:07
119	109258903	20161123-0036628	109258897	FDCQ	330604012051GB00708F00010055	浙(2016)绍兴市上虞区不动产权第0018966号	共同共有	百官街道大通水尚名都1幢2601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018966	18966	33100063064	2016/11/23 15:54:10	1	26	01		2018-10-25 13:40:49	2018-10-25 16:41:07
120	109367009	20161206-0038988	109367003	FDCQ	330604012051GB00708F00100068	浙(2016)绍兴市上虞区不动产权第0020268号	共同共有	百官街道大通水尚名都11幢2单元1908室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020268	20268	33100065014	2016/12/6 11:16:47	11	19	08	2	2018-10-25 13:40:49	2018-10-25 16:41:07
121	109116493	20161108-0033429	109116481	FDCQ	330604012051GB00708F00080076	浙(2016)绍兴市上虞区不动产权第0017317号	单独所有	百官街道大通水尚名都9幢2单元17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017317	17317	33100061095	2016/11/8 10:23:52	9	18	04	2	2018-10-25 13:40:49	2018-10-25 16:41:07
122	109225797	20161121-0035915	109225791	FDCQ	330604012051GB00708F00060015	浙(2016)绍兴市上虞区不动产权第0018661号	共同共有	百官街道大通水尚名都7幢1单元1203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018661	18661	33100062848	2016/11/21 9:30:49	7	12	03	1	2018-10-25 13:40:49	2018-10-25 16:41:07
123	109225998	20161121-0035919	109225992	FDCQ	330604012051GB00708F00060065	浙(2016)绍兴市上虞区不动产权第0018728号	共同共有	百官街道大通水尚名都7幢1单元23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018728	18728	33100062477	2016/11/21 9:35:50	7	24	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
124	109294786	20161129-0037401	109294780	FDCQ	330604012051GB00708F00070031	浙(2016)绍兴市上虞区不动产权第0019482号	共同共有	百官街道大通水尚名都8幢1单元23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019482	19482	33100063748	2016/11/29 9:36:47	8	24	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
125	109025744	20161031-0031735	109025738	FDCQ	330604012051GB00708F00060062	浙(2016)绍兴市上虞区不动产权第0016409号	共同共有	百官街道大通水尚名都7幢1单元2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016409	16409	33100060717	2016/10/31 10:04:58	7	23	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
126	109026068	20161031-0031738	109026063	FDCQ	330604012051GB00708F00050093	浙(2016)绍兴市上虞区不动产权第0016631号	单独所有	百官街道大通水尚名都6幢801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016631	16631	33100060771	2016/10/31 10:12:24	6	8	01		2018-10-25 13:40:49	2018-10-25 16:41:07
813	109104960	20161107-0033151	109104955	FDCQ	330604012051GB00708F00030004	浙(2016)绍兴市上虞区不动产权第0017177号	单独所有	百官街道大通水尚名都3幢1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017177	17177	33100061039	2016/11/7 10:53:28	3	10	04		2018-10-25 13:40:51	2018-10-25 16:41:53
129	112555619	20170807-0086699	112555613	FDCQ	330604012051GB00708F00010024	浙(2017)绍兴市上虞区不动产权第0021422号	共同共有	百官街道大通水尚名都1幢1603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0021422	21422	33001409620	2017/8/7 9:27:20	1	16	03		2018-10-25 13:40:49	2018-10-25 16:41:07
130	110231879	20170215-0054051	110231874	FDCQ	330604012051GB00708F00060028	浙(2017)绍兴市上虞区不动产权第0005591号	单独所有	百官街道大通水尚名都7幢1单元1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005591	5591	33001397460	2017/2/15 15:13:11	7	15	04	1	2018-10-25 13:40:49	2018-10-25 16:41:07
131	109124612	20161108-0033639	109124607	FDCQ	330604012051GB00708F00090063	浙(2016)绍兴市上虞区不动产权第0017649号	单独所有	百官街道大通水尚名都10幢2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017649	17649	33100061345	2016/11/8 15:34:00	10	23	03		2018-10-25 13:40:49	2018-10-25 16:41:07
132	111320975	20170510-0068854	111320969	FDCQ	330604012051GB00708F00090021	浙(2017)绍兴市上虞区不动产权第0013676号	共同共有	百官街道大通水尚名都10幢12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0013676	13676	33001402893	2017/5/10 15:18:03	10	13	01		2018-10-25 13:40:49	2018-10-25 16:41:07
133	112124662	20170714-0083142	112124655	FDCQ	330604012051GB00708F00080101	浙(2017)绍兴市上虞区不动产权第0019521号	共同共有	百官街道大通水尚名都9幢2单元3003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0019521	19521	33001407630	2017/7/14 9:19:23	9	30	03	2	2018-10-25 13:40:49	2018-10-25 16:41:07
134	109013884	20161028-0031439	109013878	FDCQ	330604012051GB00708F00050049	浙(2016)绍兴市上虞区不动产权第0016601号	共同共有	百官街道大通水尚名都6幢201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.98㎡/房屋建筑面积87.38㎡	4.98	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016601	16601	33100060762	2016/10/28 9:47:28	6	2	01		2018-10-25 13:40:49	2018-10-25 16:41:07
135	109032209	20161031-0031871	109032203	FDCQ	330604012051GB00708F00040038	浙(2016)绍兴市上虞区不动产权第0016629号	共同共有	百官街道大通水尚名都5幢17A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016629	16629	33100060770	2016/10/31 15:09:10	5	18	02		2018-10-25 13:40:49	2018-10-25 16:41:07
136	109032309	20161031-0031873	109032303	FDCQ	330604012051GB00708F00050073	浙(2016)绍兴市上虞区不动产权第0016420号	共同共有	百官街道大通水尚名都6幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016420	16420	33100060721	2016/10/31 15:13:54	6	3	01		2018-10-25 13:40:49	2018-10-25 16:41:07
137	109032343	20161031-0031872	109032338	FDCQ	330604012051GB00708F00040029	浙(2016)绍兴市上虞区不动产权第0016412号	单独所有	百官街道大通水尚名都5幢1601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016412	16412	33100060718	2016/10/31 15:14:36	5	16	01		2018-10-25 13:40:49	2018-10-25 16:41:07
138	109220054	20161118-0035775	109220048	FDCQ	330604012051GB00708F00080004	浙(2016)绍兴市上虞区不动产权第0018529号	共同共有	百官街道大通水尚名都9幢1单元1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018529	18529	33100062297	2016/11/18 14:32:26	9	11	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
139	109629533	20161228-0044546	109629528	FDCQ	330604012051GB00708F00090091	浙(2017)绍兴市上虞区不动产权第0001460号	单独所有	百官街道大通水尚名都10幢3003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001460	1460	33001393371	2016/12/28 9:59:15	10	30	03		2018-10-25 13:40:49	2018-10-25 16:41:07
140	109321566	20161201-0037978	109321560	FDCQ	330604012051GB00708F00070006	浙(2016)绍兴市上虞区不动产权第0019820号	共同共有	百官街道大通水尚名都8幢1单元1202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019820	19820	33100064148	2016/12/1 10:32:36	8	12	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
827	109009774	20161027-0031356	109009768	FDCQ	330604012051GB00708F00040010	浙(2016)绍兴市上虞区不动产权第0016302号	共同共有	百官街道大通水尚名都5幢1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016302	16302	33100060345	2016/10/27 15:48:29	5	11	02		2018-10-25 13:40:51	2018-10-25 16:41:53
142	109196707	20161116-0035240	109196702	FDCQ	330604012051GB00708F00080027	浙(2016)绍兴市上虞区不动产权第0018363号	单独所有	百官街道大通水尚名都9幢1单元2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018363	18363	33100062346	2016/11/16 14:37:44	9	22	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
143	108981303	20161025-0030722	108981297	FDCQ	330604012051GB00708F00070081	浙(2016)绍兴市上虞区不动产权第0015979号	共同共有	百官街道大通水尚名都8幢2单元203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015979	15979	33100060270	2016/10/25 9:43:32	8	2	03	2	2018-10-25 13:40:49	2018-10-25 16:41:07
144	109114563	20161108-0033392	109114556	FDCQ	330604012051GB00708F00050065	浙(2016)绍兴市上虞区不动产权第0017297号	共同共有	百官街道大通水尚名都6幢23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017297	17297	33100061086	2016/11/8 9:36:28	6	24	01		2018-10-25 13:40:49	2018-10-25 16:41:07
145	109468607	20161215-0041182	109468601	FDCQ	330604012051GB00708F00060036	浙(2016)绍兴市上虞区不动产权第0021815号	共同共有	百官街道大通水尚名都7幢1单元1704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021815	21815	33001390122	2016/12/15 9:37:44	7	17	04	1	2018-10-25 13:40:49	2018-10-25 16:41:07
146	110130109	20170206-0052276	110130103	FDCQ	330604012051GB00708F00120032	浙(2017)绍兴市上虞区不动产权第0004873号	共同共有	百官街道大通水尚名都12幢1单元304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004873	4873	33001396625	2017/2/6 10:41:30	12	3	04	1	2018-10-25 13:40:49	2018-10-25 16:41:07
147	110130658	20170125-0051728	110130652	FDCQ	330604012051GB00708F00030118	浙(2017)绍兴市上虞区不动产权第0004589号	共同共有	百官街道大通水尚名都3幢802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004589	4589	33001396372	2017/2/6 11:00:23	3	8	02		2018-10-25 13:40:49	2018-10-25 16:41:07
148	109256574	20161123-0036578	109256568	FDCQ	330604012051GB00708F00120057	浙(2016)绍兴市上虞区不动产权第0018935号	共同共有	百官街道大通水尚名都12幢2单元1505室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018935	18935	33100063056	2016/11/23 14:31:03	12	15	05	2	2018-10-25 13:40:49	2018-10-25 16:41:07
149	111264725	20170504-0067748	111264719	FDCQ	330604012051GB00708F00080057	浙(2017)绍兴市上虞区不动产权第0012448号	共同共有	百官街道大通水尚名都9幢1单元901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0012448	12448	33001402659	2017/5/4 11:13:04	9	9	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
150	108971977	20161024-0030488	108971971	FDCQ	330604012051GB00708F00090113	浙(2016)绍兴市上虞区不动产权第0016175号	共同共有	百官街道大通水尚名都10幢801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让。	浙	绍兴市上虞区	2016	0016175	16175	33100060305	2016/10/24 10:37:20	10	8	01		2018-10-25 13:40:49	2018-10-25 16:41:07
151	109032079	20161031-0031868	109032074	FDCQ	330604012051GB00708F00070048	浙(2016)绍兴市上虞区不动产权第0016428号	单独所有	百官街道大通水尚名都8幢1单元3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016428	16428	33100060405	2016/10/31 15:04:50	8	4	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
152	109032111	20161031-0031866	109032104	FDCQ	330604012051GB00708F00120027	浙(2016)绍兴市上虞区不动产权第0016407号	共同共有	百官街道大通水尚名都12幢1单元2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016407	16407	33100060716	2016/10/31 15:05:33	12	21	03	1	2018-10-25 13:40:49	2018-10-25 16:41:07
153	111135264	20170424-0065569	111135258	FDCQ	330604012051GB00708F00020029	浙(2017)绍兴市上虞区不动产权第0011670号	共同共有	百官街道大通水尚名都2幢2201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011670	11670	33001401802	2017/4/24 15:03:35	2	22	01		2018-10-25 13:40:49	2018-10-25 16:41:07
154	109142184	20161110-0034014	109142178	FDCQ	330604012051GB00708F00120047	浙(2016)绍兴市上虞区不动产权第0017908号	共同共有	百官街道大通水尚名都12幢2单元107室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017908	17908	33100062020	2016/11/10 9:36:53	12	1	07	2	2018-10-25 13:40:49	2018-10-25 16:41:07
841	109106466	20161107-0033178	109106460	FDCQ	330604012051GB00708F00040073	浙(2016)绍兴市上虞区不动产权第0017170号	共同共有	百官街道大通水尚名都5幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017170	17170	33100061036	2016/11/7 11:38:40	5	3	01		2018-10-25 13:40:51	2018-10-25 16:41:53
156	109296048	20161129-0037427	109296040	FDCQ	330604012051GB00708F00120084	浙(2016)绍兴市上虞区不动产权第0019453号	共同共有	百官街道大通水尚名都12幢2单元708室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019453	19453	33100063830	2016/11/29 10:13:17	12	7	08	2	2018-10-25 13:40:49	2018-10-25 16:41:07
157	109227355	20161121-0035949	109227349	FDCQ	330604012051GB00708F00010023	浙(2016)绍兴市上虞区不动产权第0018733号	共同共有	百官街道大通水尚名都1幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018733	18733	33100062481	2016/11/21 10:25:07	1	16	02		2018-10-25 13:40:49	2018-10-25 16:41:07
158	109552409	20161222-0043124	109552403	FDCQ	330604012051GB00708F00120013	浙(2016)绍兴市上虞区不动产权第0022858号	共同共有	百官街道大通水尚名都12幢1单元1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022858	22858	33001391357	2016/12/22 9:14:57	12	15	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
159	109309544	20161130-0037714	109309538	FDCQ	330604012051GB00708F00060154	浙(2016)绍兴市上虞区不动产权第0019611号	共同共有	百官街道大通水尚名都7幢2单元2106室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019611	19611	33100063783	2016/11/30 10:28:38	7	21	06	2	2018-10-25 13:40:49	2018-10-25 16:41:07
160	111382837	20170515-0069683	111382831	FDCQ	330604012051GB00708F00030036	浙(2017)绍兴市上虞区不动产权第0014088号	单独所有	百官街道大通水尚名都3幢1704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0014088	14088	33001403716	2017/5/15 10:35:13	3	17	04		2018-10-25 13:40:49	2018-10-25 16:41:07
161	108998360	20161026-0031091	108998354	FDCQ	330604012051GB00708F00070070	浙(2016)绍兴市上虞区不动产权第0016299号	共同共有	百官街道大通水尚名都8幢2单元1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016299	16299	33100060343	2016/10/26 14:57:04	8	15	04	2	2018-10-25 13:40:49	2018-10-25 16:41:07
162	109411673	20161209-0039930	109411667	FDCQ	330604012051GB00708F00030051	浙(2016)绍兴市上虞区不动产权第0021023号	共同共有	百官街道大通水尚名都3幢203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021023	21023	33100065273	2016/12/9 11:29:22	3	2	03		2018-10-25 13:40:49	2018-10-25 16:41:07
163	109186115	20161115-0035017	109186109	FDCQ	330604012051GB00708F00040031	浙(2016)绍兴市上虞区不动产权第0018200号	共同共有	百官街道大通水尚名都5幢1603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018200	18200	33100062203	2016/11/15 15:39:19	5	16	03		2018-10-25 13:40:49	2018-10-25 16:41:07
164	109186489	20161115-0035026	109186483	FDCQ	330604012051GB00708F00060080	浙(2016)绍兴市上虞区不动产权第0018209号	共同共有	百官街道大通水尚名都7幢1单元3A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018209	18209	33100062187	2016/11/15 15:53:30	7	4	04	1	2018-10-25 13:40:49	2018-10-25 16:41:07
165	109070445	20161103-0032573	109070439	FDCQ	330604012051GB00708F00060019	浙(2016)绍兴市上虞区不动产权第0017300号	共同共有	百官街道大通水尚名都7幢1单元12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017300	17300	33100061130	2016/11/3 9:55:42	7	13	03	1	2018-10-25 13:40:49	2018-10-25 16:41:07
166	109215083	20161118-0035654	109215076	FDCQ	330604012051GB00708F00120066	浙(2016)绍兴市上虞区不动产权第0018302号	共同共有	百官街道大通水尚名都12幢2单元1906室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让。	浙	绍兴市上虞区	2016	0018302	18302	33100062417	2016/11/18 10:27:04	12	19	06	2	2018-10-25 13:40:49	2018-10-25 16:41:07
167	109226016	20161121-0035917	109226010	FDCQ	330604012051GB00708F00120065	浙(2016)绍兴市上虞区不动产权第0018766号	共同共有	百官街道大通水尚名都12幢2单元1905室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018766	18766	33100062871	2016/11/21 9:36:06	12	19	05	2	2018-10-25 13:40:49	2018-10-25 16:41:07
168	109269995	20161124-0036854	109269989	FDCQ	330604012051GB00708F00120030	浙(2016)绍兴市上虞区不动产权第0019135号	共同共有	百官街道大通水尚名都12幢1单元302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019135	19135	33100063288	2016/11/24 16:34:36	12	3	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
855	109132355	20161109-0033794	109132349	FDCQ	330604012051GB00708F00060128	浙(2016)绍兴市上虞区不动产权第0017710号	共同共有	百官街道大通水尚名都7幢2单元1508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017710	17710	33100061366	2016/11/9 10:48:44	7	15	08	2	2018-10-25 13:40:51	2018-10-25 16:41:58
170	109253640	20161123-0036522	109253634	FDCQ	330604012051GB00708F00120043	浙(2016)绍兴市上虞区不动产权第0018754号	共同共有	百官街道大通水尚名都12幢1单元903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018754	18754	33100062493	2016/11/23 10:58:56	12	9	03	1	2018-10-25 13:40:49	2018-10-25 16:41:07
171	110101277	20170125-0051612	110101271	FDCQ	330604012051GB00708F00090096	浙(2017)绍兴市上虞区不动产权第0004514号	共同共有	百官街道大通水尚名都10幢304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004514	4514	33001396057	2017/1/25 9:21:18	10	3	04		2018-10-25 13:40:49	2018-10-25 16:41:07
172	109098064	20161107-0033079	109098058	FDCQ	330604012051GB00708F00030090	浙(2016)绍兴市上虞区不动产权第0017475号	共同共有	百官街道大通水尚名都3幢3002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017475	17475	33100061194	2016/11/7 9:40:45	3	30	02		2018-10-25 13:40:49	2018-10-25 16:41:07
173	110134427	20170206-0052375	110134421	FDCQ	330604012051GB00708F00050091	浙(2017)绍兴市上虞区不动产权第0004754号	共同共有	百官街道大通水尚名都6幢703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004754	4754	33001396287	2017/2/6 15:09:16	6	7	03		2018-10-25 13:40:49	2018-10-25 16:41:07
174	109474793	20161215-0041328	109474787	FDCQ	330604012051GB00708F00080039	浙(2016)绍兴市上虞区不动产权第0021807号	共同共有	百官街道大通水尚名都9幢1单元2801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021807	21807	33001390120	2016/12/15 15:04:09	9	28	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
175	109171101	20161114-0034673	109171095	FDCQ	330604012051GB00708F00120046	浙(2016)绍兴市上虞区不动产权第0018039号	单独所有	百官街道大通水尚名都12幢2单元106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018039	18039	33100062052	2016/11/14 14:25:09	12	1	06	2	2018-10-25 13:40:49	2018-10-25 16:41:07
176	110134593	20170206-0052377	110134587	FDCQ	330604012051GB00708F00080002	浙(2017)绍兴市上虞区不动产权第0004875号	共同共有	百官街道大通水尚名都9幢1单元1002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004875	4875	33001396627	2017/2/6 15:13:53	9	10	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
177	109013710	20161028-0031434	109013704	FDCQ	330604012051GB00708F00030052	浙(2016)绍兴市上虞区不动产权第0016467号	共同共有	百官街道大通水尚名都3幢204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016467	16467	33100060417	2016/10/28 9:42:14	3	2	04		2018-10-25 13:40:49	2018-10-25 16:41:07
178	215840170	20180108-0001827	215840163	FDCQ	330604012051GB00708F00100010	浙(2018)绍兴市上虞区不动产权第0001053号	共同共有	百官街道大通水尚名都11幢1单元12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0001053	1053	33003114294	2018/1/8 16:19:07	11	13	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
179	108981710	20161025-0030734	108981704	FDCQ	330604012051GB00708F00010077	浙(2016)绍兴市上虞区不动产权第0015944号	共同共有	百官街道大通水尚名都1幢3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015944	15944	33100059956	2016/10/25 9:52:13	1	4	02		2018-10-25 13:40:49	2018-10-25 16:41:07
180	109212084	20161118-0035583	109212079	FDCQ	330604012051GB00708F00080050	浙(2016)绍兴市上虞区不动产权第0018509号	单独所有	百官街道大通水尚名都9幢1单元502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018509	18509	33100062396	2016/11/18 9:12:02	9	5	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
181	109196597	20161116-0035236	109196591	FDCQ	330604012051GB00708F00060111	浙(2016)绍兴市上虞区不动产权第0018342号	共同共有	百官街道大通水尚名都7幢2单元1107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018342	18342	33100062339	2016/11/16 14:30:47	7	11	07	2	2018-10-25 13:40:49	2018-10-25 16:41:07
182	110189461	20170209-0053193	110189449	FDCQ	330604012051GB00708F00030084	浙(2017)绍兴市上虞区不动产权第0005348号	共同共有	百官街道大通水尚名都3幢2804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005348	5348	33001397217	2017/2/9 15:34:11	3	28	04		2018-10-25 13:40:49	2018-10-25 16:41:07
869	108970789	20161024-0030501	108970783	FDCQ	330604012051GB00708F00060173	浙(2016)绍兴市上虞区不动产权第0016305号	共同共有	百官街道大通水尚名都7幢2单元305室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016305	16305	33100060347	2016/10/24 10:04:59	7	3	05	2	2018-10-25 13:40:52	2018-10-25 16:41:58
184	109040233	20161101-0032012	109040227	FDCQ	330604012051GB00708F00050020	浙(2016)绍兴市上虞区不动产权第0016609号	共同共有	百官街道大通水尚名都6幢12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016609	16609	33100060805	2016/11/1 9:45:57	6	13	04		2018-10-25 13:40:49	2018-10-25 16:41:07
185	109096498	20161103-0032634	109096493	FDCQ	330604012051GB00708F00050031	浙(2016)绍兴市上虞区不动产权第0016888号	单独所有	百官街道大通水尚名都6幢1603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016888	16888	33100060886	2016/11/7 8:54:31	6	16	03		2018-10-25 13:40:49	2018-10-25 16:41:07
186	109551900	20161222-0043112	109551893	FDCQ	330604012051GB00708F00120059	浙(2016)绍兴市上虞区不动产权第0023019号	共同共有	百官街道大通水尚名都12幢2单元1507室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023019	23019	33001391884	2016/12/22 9:03:31	12	15	07	2	2018-10-25 13:40:49	2018-10-25 16:41:07
187	214824990	20171016-0002975	214824983	FDCQ	330604012051GB00708F00040036	浙(2017)绍兴市上虞区不动产权第0028157号	共同共有	百官街道大通水尚名都5幢1704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0028157	28157	33001413616	2017/10/16 9:36:17	5	17	04		2018-10-25 13:40:49	2018-10-25 16:41:07
188	213477428	20170927-0000698	213477417	FDCQ	330604012051GB00708F00080032	浙(2017)绍兴市上虞区不动产权第0026856号	共同共有	百官街道大通水尚名都9幢1单元23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026856	26856	33001413242	2017/9/27 8:45:08	9	24	02	1	2018-10-25 13:40:49	2018-10-25 16:41:07
189	109170013	20161114-0034661	109170007	FDCQ	330604012051GB00708F00050022	浙(2016)绍兴市上虞区不动产权第0017895号	共同共有	百官街道大通水尚名都6幢12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017895	17895	33100061489	2016/11/14 11:41:03	6	13	02		2018-10-25 13:40:49	2018-10-25 16:41:07
190	109121647	20161108-0033550	109121641	FDCQ	330604012051GB00708F00080109	浙(2016)绍兴市上虞区不动产权第0017552号	共同共有	百官街道大通水尚名都9幢2单元603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017552	17552	33100061315	2016/11/8 14:26:43	9	6	03	2	2018-10-25 13:40:49	2018-10-25 16:41:07
191	109166863	20161114-0034596	109166857	FDCQ	330604012051GB00708F00050012	浙(2016)绍兴市上虞区不动产权第0018124号	共同共有	百官街道大通水尚名都6幢1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018124	18124	33100062072	2016/11/14 10:04:17	6	11	04		2018-10-25 13:40:49	2018-10-25 16:41:07
192	110229866	20170215-0054002	110229860	FDCQ	330604012051GB00708F00060119	浙(2017)绍兴市上虞区不动产权第0005255号	共同共有	百官街道大通水尚名都7幢2单元12A07室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005255	5255	33001397306	2017/2/15 14:21:21	7	13	07	2	2018-10-25 13:40:49	2018-10-25 16:41:07
193	109201342	20161117-0035354	109201337	FDCQ	330604012051GB00708F00120078	浙(2016)绍兴市上虞区不动产权第0018387号	单独所有	百官街道大通水尚名都12幢2单元506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018387	18387	33100062357	2016/11/17 9:54:04	12	5	06	2	2018-10-25 13:40:49	2018-10-25 16:41:07
194	109272603	20161125-0036908	109272597	FDCQ	330604012051GB00708F00050070	浙(2016)绍兴市上虞区不动产权第0019005号	共同共有	百官街道大通水尚名都6幢2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019005	19005	33100063067	2016/11/25 10:04:45	6	25	02		2018-10-25 13:40:49	2018-10-25 16:41:07
195	109096565	20161103-0032544	109096559	FDCQ	330604012051GB00708F00100047	浙(2016)绍兴市上虞区不动产权第0016893号	共同共有	百官街道大通水尚名都11幢2单元107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016893	16893	33100060888	2016/11/7 8:57:03	11	1	07	2	2018-10-25 13:40:49	2018-10-25 16:41:07
196	108990991	20161026-0030937	108990985	FDCQ	330604012051GB00708F00010016	浙(2016)绍兴市上虞区不动产权第0016074号	共同共有	百官街道大通水尚名都1幢12B01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016074	16074	33100060277	2016/10/26 9:01:09	1	13	01		2018-10-25 13:40:49	2018-10-25 16:41:07
883	109042975	20161101-0032062	109042969	FDCQ	330604012051GB00708F00030122	浙(2016)绍兴市上虞区不动产权第0016794号	共同共有	百官街道大通水尚名都3幢902室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016794	16794	33100060861	2016/11/1 10:59:58	3	9	02		2018-10-25 13:40:52	2018-10-25 16:41:58
198	109282214	20161128-0037128	109282209	FDCQ	330604012051GB00708F00030064	浙(2016)绍兴市上虞区不动产权第0019228号	单独所有	百官街道大通水尚名都3幢2304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019228	19228	33100063094	2016/11/28 9:11:09	3	23	04		2018-10-25 13:40:49	2018-10-25 16:41:07
199	109156628	20161111-0034364	109156617	FDCQ	330604012051GB00708F00090073	浙(2016)绍兴市上虞区不动产权第0018037号	共同共有	百官街道大通水尚名都10幢2601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018037	18037	33100062125	2016/11/11 11:12:08	10	26	01		2018-10-25 13:40:49	2018-10-25 16:41:07
200	213560068	20171010-0002092	213560061	FDCQ	330604012051GB00708F00040002	浙(2017)绍兴市上虞区不动产权第0027123号	共同共有	百官街道大通水尚名都5幢1002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0027123	27123	33001413857	2017/10/10 15:52:52	5	10	02		2018-10-25 13:40:49	2018-10-25 16:41:07
201	213416043	20170921-0094851	213416031	FDCQ	330604012051GB00708F00020038	浙(2017)绍兴市上虞区不动产权第0025936号	共同共有	百官街道大通水尚名都2幢2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0025936	25936	33001412844	2017/9/21 9:08:21	2	26	02		2018-10-25 13:40:49	2018-10-25 16:41:07
202	109489987	20161216-0041698	109489982	FDCQ	330604012051GB00708F00070071	浙(2016)绍兴市上虞区不动产权第0021959号	单独所有	百官街道大通水尚名都8幢2单元1603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021959	21959	33000310238	2016/12/16 16:03:04	8	16	03	2	2018-10-25 13:40:49	2018-10-25 16:41:07
203	109211669	20161118-0035570	109211664	FDCQ	330604012051GB00708F00090087	浙(2016)绍兴市上虞区不动产权第0018590号	单独所有	百官街道大通水尚名都10幢2903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018590	18590	33100062826	2016/11/18 8:56:24	10	29	03		2018-10-25 13:40:49	2018-10-25 16:41:07
204	109212361	20161118-0035591	109212355	FDCQ	330604012051GB00708F00080013	浙(2016)绍兴市上虞区不动产权第0018510号	共同共有	百官街道大通水尚名都9幢1单元1601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018510	18510	33100062397	2016/11/18 9:19:19	9	16	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
205	109213832	20161118-0035630	109213826	FDCQ	330604012051GB00708F00030071	浙(2016)绍兴市上虞区不动产权第0018785号	共同共有	百官街道大通水尚名都3幢2503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018785	18785	33100062878	2016/11/18 9:58:58	3	25	03		2018-10-25 13:40:49	2018-10-25 16:41:07
206	110218684	20170214-0053751	110218679	FDCQ	330604012051GB00708F00030059	浙(2017)绍兴市上虞区不动产权第0005257号	单独所有	百官街道大通水尚名都3幢2203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005257	5257	33001397100	2017/2/14 11:13:06	3	22	03		2018-10-25 13:40:49	2018-10-25 16:41:07
207	109122554	20161108-0033586	109122548	FDCQ	330604012051GB00708F00090023	浙(2016)绍兴市上虞区不动产权第0017644号	共同共有	百官街道大通水尚名都10幢12B03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017644	17644	33100061343	2016/11/8 14:46:36	10	13	03		2018-10-25 13:40:49	2018-10-25 16:41:07
208	109189810	20161116-0035092	109189804	FDCQ	330604012051GB00708F00090055	浙(2016)绍兴市上虞区不动产权第0018350号	共同共有	百官街道大通水尚名都10幢2103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018350	18350	33100062256	2016/11/16 9:24:07	10	21	03		2018-10-25 13:40:49	2018-10-25 16:41:07
209	109154051	20161111-0034299	109154045	FDCQ	330604012051GB00708F00120081	浙(2016)绍兴市上虞区不动产权第0018018号	共同共有	百官街道大通水尚名都12幢2单元705室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018018	18018	33100062117	2016/11/11 9:55:26	12	7	05	2	2018-10-25 13:40:49	2018-10-25 16:41:07
210	109173929	20161114-0034745	109173924	FDCQ	330604012051GB00708F00080094	浙(2016)绍兴市上虞区不动产权第0018138号	单独所有	百官街道大通水尚名都9幢2单元2604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018138	18138	33100062078	2016/11/14 15:52:20	9	26	04	2	2018-10-25 13:40:49	2018-10-25 16:41:07
897	109184233	20161115-0034979	109184228	FDCQ	330604012051GB00708F00050023	浙(2016)绍兴市上虞区不动产权第0018293号	单独所有	百官街道大通水尚名都6幢12B03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018293	18293	33100062320	2016/11/15 14:46:52	6	13	03		2018-10-25 13:40:52	2018-10-25 16:41:58
213	109200621	20161117-0035340	109200611	FDCQ	330604012051GB00708F00100032	浙(2016)绍兴市上虞区不动产权第0018400号	共同共有	百官街道大通水尚名都11幢1单元304室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018400	18400	33100062276	2016/11/17 9:35:39	11	3	04	1	2018-10-25 13:40:49	2018-10-25 16:42:53
214	109190554	20161116-0035113	109190548	FDCQ	330604012051GB00708F00080048	浙(2016)绍兴市上虞区不动产权第0018370号	共同共有	百官街道大通水尚名都9幢1单元3A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018370	18370	33100062350	2016/11/16 9:47:20	9	4	02	1	2018-10-25 13:40:49	2018-10-25 16:42:53
215	108571354	20160901-0023119	108571223	FDCQ	330604012051GB00708F00020010	浙(2016)绍兴市上虞区不动产权第0010259号	单独所有	百官街道大通水尚名都2幢12A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	资料详见1幢。	浙	绍兴市上虞区	2016	0010259	10259	2016/9/9 8:52:44	2	13	02		2018-10-25 13:40:49	2018-10-25 16:42:53
216	109177776	20161115-0034842	109177770	FDCQ	330604012051GB00708F00090031	浙(2016)绍兴市上虞区不动产权第0018156号	共同共有	百官街道大通水尚名都10幢1603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018156	18156	33100062163	2016/11/15 9:37:29	10	16	03		2018-10-25 13:40:49	2018-10-25 16:42:53
217	109114297	20161108-0033382	109114291	FDCQ	330604012051GB00708F00020027	浙(2016)绍兴市上虞区不动产权第0017574号	共同共有	百官街道大通水尚名都2幢2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017574	17574	33100061323	2016/11/8 9:33:02	2	21	01		2018-10-25 13:40:49	2018-10-25 16:42:53
220	109162318	20161111-0034507	109162312	FDCQ	330604012051GB00708F00120008	浙(2016)绍兴市上虞区不动产权第0017690号	共同共有	百官街道大通水尚名都12幢1单元1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017690	17690	33100061420	2016/11/11 16:23:31	12	11	04	1	2018-10-25 13:40:49	2018-10-25 16:41:24
221	109122691	20161108-0033590	109122685	FDCQ	330604012051GB00708F00090070	浙(2016)绍兴市上虞区不动产权第0017322号	共同共有	百官街道大通水尚名都10幢2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017322	17322	33100061098	2016/11/8 14:50:22	10	25	02		2018-10-25 13:40:49	2018-10-25 16:41:24
222	109220813	20161118-0035791	109220807	FDCQ	330604012051GB00708F00090079	浙(2016)绍兴市上虞区不动产权第0018787号	共同共有	百官街道大通水尚名都10幢2703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018787	18787	33100062879	2016/11/18 14:52:13	10	27	03		2018-10-25 13:40:49	2018-10-25 16:41:24
223	109173110	20161114-0034714	109173104	FDCQ	330604012051GB00708F00080080	浙(2016)绍兴市上虞区不动产权第0017873号	共同共有	百官街道大通水尚名都9幢2单元2004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017873	17873	33100061481	2016/11/14 15:19:50	9	20	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
224	110302071	20170223-0055181	110302064	FDCQ	330604012051GB00708F00040096	浙(2017)绍兴市上虞区不动产权第0006069号	共同共有	百官街道大通水尚名都5幢804室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0006069	6069	33001397639	2017/2/23 10:24:00	5	8	04		2018-10-25 13:40:49	2018-10-25 16:41:24
218	109227956	20161121-0035962	109227950	FDCQ	330604012051GB00708F00070094	浙(2016)绍兴市上虞区不动产权第0018742号	共同共有	百官街道大通水尚名都8幢2单元2604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018742	18742	33100062486	2016/11/21 10:46:29	8	26	04	2	2018-10-25 13:40:49	2018-10-25 16:42:53
219	109165235	20161114-0034565	109165229	FDCQ	330604012051GB00708F00120015	浙(2016)绍兴市上虞区不动产权第0018157号	共同共有	百官街道大通水尚名都12幢1单元1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018157	18157	33100062087	2016/11/14 9:08:35	12	15	03	1	2018-10-25 13:40:49	2018-10-25 16:42:53
911	109041212	20161101-0032032	109041204	FDCQ	330604012051GB00708F00030101	浙(2016)绍兴市上虞区不动产权第0016578号	共同共有	百官街道大通水尚名都3幢3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016578	16578	33100060440	2016/11/1 10:10:51	3	4	01		2018-10-25 13:40:52	2018-10-25 16:41:58
226	109192800	20161116-0035105	109192794	FDCQ	330604012051GB00708F00100009	浙(2016)绍兴市上虞区不动产权第0018321号	共同共有	百官街道大通水尚名都11幢1单元12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018321	18321	33100062330	2016/11/16 11:00:05	11	13	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
227	109225619	20161121-0035903	109225613	FDCQ	330604012051GB00708F00070083	浙(2016)绍兴市上虞区不动产权第0018799号	共同共有	百官街道大通水尚名都8幢2单元2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018799	18799	33100062885	2016/11/21 9:24:26	8	21	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
228	109221337	20161118-0035805	109221331	FDCQ	330604012051GB00708F00040014	浙(2016)绍兴市上虞区不动产权第0018584号	共同共有	百官街道大通水尚名都5幢1202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018584	18584	33100062432	2016/11/18 15:06:31	5	12	02		2018-10-25 13:40:49	2018-10-25 16:41:24
229	109220319	20161118-0035782	109220313	FDCQ	330604012051GB00708F00090060	浙(2016)绍兴市上虞区不动产权第0018541号	共同共有	百官街道大通水尚名都10幢2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018541	18541	33100062413	2016/11/18 14:39:38	10	22	04		2018-10-25 13:40:49	2018-10-25 16:41:24
230	108991609	20161026-0030950	108991604	FDCQ	330604012051GB00708F00050026	浙(2016)绍兴市上虞区不动产权第0016211号	单独所有	百官街道大通水尚名都6幢1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016211	16211	33100060038	2016/10/26 9:17:33	6	15	02		2018-10-25 13:40:49	2018-10-25 16:41:24
231	108573632	20160901-0023170	108573264	FDCQ	330604012051GB00708F00080021	浙(2016)绍兴市上虞区不动产权第0010016号	单独所有	百官街道大通水尚名都9幢1单元2001室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	资料详见1幢。	浙	绍兴市上虞区	2016	0010016	10016	2016/9/9 8:55:57	9	20	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
232	110218080	20170214-0053736	110218074	FDCQ	330604012051GB00708F00120009	浙(2017)绍兴市上虞区不动产权第0005267号	共同共有	百官街道大通水尚名都12幢1单元12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005267	5267	33001397402	2017/2/14 10:55:59	12	13	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
233	109131513	20161109-0033779	109131507	FDCQ	330604012051GB00708F00100057	浙(2016)绍兴市上虞区不动产权第0017469号	共同共有	百官街道大通水尚名都11幢2单元1505室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017469	17469	33100061241	2016/11/9 10:19:36	11	15	05	2	2018-10-25 13:40:49	2018-10-25 16:41:24
234	109330713	20161202-0038177	109330707	FDCQ	330604012051GB00708F00090011	浙(2016)绍兴市上虞区不动产权第0019936号	共同共有	百官街道大通水尚名都10幢1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019936	19936	33100064163	2016/12/2 9:43:08	10	11	03		2018-10-25 13:40:49	2018-10-25 16:41:24
235	109121405	20161108-0033545	109121399	FDCQ	330604012051GB00708F00070029	浙(2016)绍兴市上虞区不动产权第0017542号	共同共有	百官街道大通水尚名都8幢1单元2301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017542	17542	33100061311	2016/11/8 14:22:04	8	23	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
236	109170216	20161114-0034663	109170210	FDCQ	330604012051GB00708F00060174	浙(2016)绍兴市上虞区不动产权第0018007号	共同共有	百官街道大通水尚名都7幢2单元306室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018007	18007	33100062040	2016/11/14 11:47:35	7	3	06	2	2018-10-25 13:40:49	2018-10-25 16:41:24
237	109172407	20161114-0034704	109172401	FDCQ	330604012051GB00708F00010084	浙(2016)绍兴市上虞区不动产权第0018165号	共同共有	百官街道大通水尚名都1幢603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018165	18165	33100062090	2016/11/14 14:56:59	1	6	03		2018-10-25 13:40:49	2018-10-25 16:41:24
238	110141049	20170207-0052527	110141044	FDCQ	330604012051GB00708F00090075	浙(2017)绍兴市上虞区不动产权第0004934号	单独所有	百官街道大通水尚名都10幢2603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004934	4934	33001396919	2017/2/7 10:54:10	10	26	03		2018-10-25 13:40:49	2018-10-25 16:41:24
925	109111083	20161107-0033296	109111077	FDCQ	330604012051GB00708F00040077	浙(2016)绍兴市上虞区不动产权第0017500号	共同共有	百官街道大通水尚名都5幢3A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017500	17500	33100061259	2016/11/7 15:38:47	5	4	01		2018-10-25 13:40:52	2018-10-25 16:41:58
240	109173708	20161114-0034729	109173703	FDCQ	330604012051GB00708F00040001	浙(2016)绍兴市上虞区不动产权第0018166号	单独所有	百官街道大通水尚名都5幢1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018166	18166	33100062091	2016/11/14 15:46:36	5	10	01		2018-10-25 13:40:49	2018-10-25 16:41:24
241	109173504	20161114-0034730	109173498	FDCQ	330604012051GB00708F00090106	浙(2016)绍兴市上虞区不动产权第0017852号	共同共有	百官街道大通水尚名都10幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017852	17852	33100061473	2016/11/14 15:36:48	10	6	02		2018-10-25 13:40:49	2018-10-25 16:41:24
242	109298038	20161129-0037474	109298032	FDCQ	330604012051GB00708F00120004	浙(2016)绍兴市上虞区不动产权第0019480号	共同共有	百官街道大通水尚名都12幢1单元104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019480	19480	33100063747	2016/11/29 11:03:14	12	1	04	1	2018-10-25 13:40:49	2018-10-25 16:41:24
243	109298138	20161129-0037477	109298132	FDCQ	330604012051GB00708F00090090	浙(2016)绍兴市上虞区不动产权第0019466号	共同共有	百官街道大通水尚名都10幢3002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019466	19466	33100063740	2016/11/29 11:05:02	10	30	02		2018-10-25 13:40:49	2018-10-25 16:41:24
244	113074174	20170829-0090655	113074167	FDCQ	330604012051GB00708F00030018	浙(2017)绍兴市上虞区不动产权第0024339号	共同共有	百官街道大通水尚名都3幢12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0024339	24339	33001409990	2017/8/29 9:07:58	3	13	02		2018-10-25 13:40:49	2018-10-25 16:41:24
245	109143522	20161110-0034050	109143517	FDCQ	330604012051GB00708F00030072	浙(2016)绍兴市上虞区不动产权第0017912号	单独所有	百官街道大通水尚名都3幢2504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017912	17912	33100061495	2016/11/10 10:13:12	3	25	04		2018-10-25 13:40:49	2018-10-25 16:41:24
246	213416534	20170921-0094859	213416525	FDCQ	330604012051GB00708F00060007	浙(2017)绍兴市上虞区不动产权第0025907号	共同共有	百官街道大通水尚名都7幢1单元103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0025907	25907	33001412149	2017/9/21 9:16:56	7	1	03	1	2018-10-25 13:40:49	2018-10-25 16:41:24
247	108993106	20161026-0030984	108993101	FDCQ	330604012051GB00708F00010012	浙(2016)绍兴市上虞区不动产权第0016049号	单独所有	百官街道大通水尚名都1幢1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016049	16049	33100059980	2016/10/26 10:04:24	1	12	03		2018-10-25 13:40:49	2018-10-25 16:41:24
248	109257140	20161123-0036587	109257134	FDCQ	330604012051GB00708F00090009	浙(2016)绍兴市上虞区不动产权第0018937号	共同共有	百官街道大通水尚名都10幢1101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018937	18937	33100063057	2016/11/23 14:53:52	10	11	01		2018-10-25 13:40:49	2018-10-25 16:41:24
249	108997518	20161026-0031075	108997512	FDCQ	330604012051GB00708F00010009	浙(2016)绍兴市上虞区不动产权第0016163号	共同共有	百官街道大通水尚名都1幢1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016163	16163	33100060299	2016/10/26 14:33:29	1	11	03		2018-10-25 13:40:49	2018-10-25 16:41:24
250	108993295	20161026-0030986	108993289	FDCQ	330604012051GB00708F00120014	浙(2016)绍兴市上虞区不动产权第0016301号	共同共有	百官街道大通水尚名都12幢1单元1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016301	16301	33100060344	2016/10/26 10:09:16	12	15	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
251	109109511	20161107-0033252	109109505	FDCQ	330604012051GB00708F00070114	浙(2016)绍兴市上虞区不动产权第0017211号	共同共有	百官街道大通水尚名都8幢2单元804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017211	17211	33100061056	2016/11/7 14:50:55	8	8	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
252	109109710	20161107-0033256	109109704	FDCQ	330604012051GB00708F00120062	浙(2016)绍兴市上虞区不动产权第0017435号	共同共有	百官街道大通水尚名都12幢2单元1706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017435	17435	33100061176	2016/11/7 14:54:49	12	17	06	2	2018-10-25 13:40:49	2018-10-25 16:41:24
939	109123517	20161108-0033614	109123511	FDCQ	330604012051GB00708F00020002	浙(2016)绍兴市上虞区不动产权第0017571号	共同共有	百官街道大通水尚名都2幢1002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017571	17571	33100061322	2016/11/8 15:09:22	2	10	02		2018-10-25 13:40:52	2018-10-25 16:41:58
254	109090283	20161104-0032901	109090277	FDCQ	330604012051GB00708F00040053	浙(2016)绍兴市上虞区不动产权第0016998号	共同共有	百官街道大通水尚名都5幢2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016998	16998	33100061008	2016/11/4 11:51:58	5	21	01		2018-10-25 13:40:49	2018-10-25 16:41:24
255	109259667	20161123-0036645	109259661	FDCQ	330604012051GB00708F00070021	浙(2016)绍兴市上虞区不动产权第0018902号	共同共有	百官街道大通水尚名都8幢1单元2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018902	18902	33100063225	2016/11/23 16:28:45	8	20	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
256	110145074	20170207-0052611	110145069	FDCQ	330604012051GB00708F00030022	浙(2017)绍兴市上虞区不动产权第0004999号	单独所有	百官街道大通水尚名都3幢12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004999	4999	33001396343	2017/2/7 15:28:09	3	13	02		2018-10-25 13:40:49	2018-10-25 16:41:24
257	109317614	20161130-0037900	109317608	FDCQ	330604012051GB00708F00060171	浙(2016)绍兴市上虞区不动产权第0019616号	共同共有	百官街道大通水尚名都7幢2单元2507室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019616	19616	33100063785	2016/11/30 16:07:02	7	25	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
258	110318939	20170224-0055391	110318932	FDCQ	330604012051GB00708F00060083	浙(2017)绍兴市上虞区不动产权第0006256号	共同共有	百官街道大通水尚名都7幢1单元503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0006256	6256	33001397795	2017/2/24 11:00:12	7	5	03	1	2018-10-25 13:40:49	2018-10-25 16:41:24
259	109336915	20161202-0038315	109336909	FDCQ	330604012051GB00708F00050053	浙(2016)绍兴市上虞区不动产权第0019921号	共同共有	百官街道大通水尚名都6幢2101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019921	19921	33100064783	2016/12/2 14:32:45	6	21	01		2018-10-25 13:40:49	2018-10-25 16:41:24
260	109085614	20161104-0032821	109085608	FDCQ	330604012051GB00708F00090092	浙(2016)绍兴市上虞区不动产权第0017266号	共同共有	百官街道大通水尚名都10幢3004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017266	17266	33100061116	2016/11/4 9:19:21	10	30	04		2018-10-25 13:40:49	2018-10-25 16:41:24
261	109085488	20161104-0032817	109085483	FDCQ	330604012051GB00708F00070056	浙(2016)绍兴市上虞区不动产权第0017212号	单独所有	百官街道大通水尚名都8幢1单元802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017212	17212	33100061111	2016/11/4 9:12:01	8	8	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
262	109086270	20161104-0032835	109086264	FDCQ	330604012051GB00708F00070105	浙(2016)绍兴市上虞区不动产权第0017013号	共同共有	百官街道大通水尚名都8幢2单元3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017013	17013	33100061014	2016/11/4 9:40:11	8	4	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
263	110106974	20170125-0051730	110106969	FDCQ	330604012051GB00708F00070116	浙(2017)绍兴市上虞区不动产权第0004545号	单独所有	百官街道大通水尚名都8幢2单元904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004545	4545	33001396067	2017/1/25 14:39:48	8	9	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
264	110107045	20170125-0051734	110107040	FDCQ	330604012051GB00708F00080059	浙(2017)绍兴市上虞区不动产权第0004522号	单独所有	百官街道大通水尚名都9幢2单元1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004522	4522	33001396364	2017/1/25 14:42:10	9	10	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
265	110107923	20170125-0051757	110107917	FDCQ	330604012051GB00708F00080022	浙(2017)绍兴市上虞区不动产权第0004516号	共同共有	百官街道大通水尚名都9幢1单元2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004516	4516	33001396058	2017/1/25 15:07:49	9	20	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
266	109589663	20161226-0043940	109589657	FDCQ	330604012051GB00708F00060195	浙(2017)绍兴市上虞区不动产权第0000387号	共同共有	百官街道大通水尚名都7幢2单元807室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000387	387	33001392793	2016/12/26 11:03:35	7	8	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
953	109012892	20161028-0031417	109012886	FDCQ	330604012051GB00708F00010085	浙(2016)绍兴市上虞区不动产权第0016342号	共同共有	百官街道大通水尚名都1幢701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016342	16342	33100060385	2016/10/28 9:20:18	1	7	01		2018-10-25 13:40:52	2018-10-25 16:42:02
268	109318955	20161201-0037929	109318949	FDCQ	330604012051GB00708F00080112	浙(2016)绍兴市上虞区不动产权第0019757号	共同共有	百官街道大通水尚名都9幢2单元704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019757	19757	33100064130	2016/12/1 9:16:31	9	7	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
269	109161430	20161111-0034482	109161424	FDCQ	330604012051GB00708F00070104	浙(2016)绍兴市上虞区不动产权第0017888号	共同共有	百官街道大通水尚名都8幢2单元304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017888	17888	33100062012	2016/11/11 15:51:10	8	3	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
270	109116932	20161108-0033439	109116927	FDCQ	330604012051GB00708F00050097	浙(2016)绍兴市上虞区不动产权第0017303号	单独所有	百官街道大通水尚名都6幢901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017303	17303	33100061087	2016/11/8 10:36:58	6	9	01		2018-10-25 13:40:49	2018-10-25 16:41:24
271	109100166	20161107-0033101	109100153	FDCQ	330604012051GB00708F00020046	浙(2016)绍兴市上虞区不动产权第0017470号	共同共有	百官街道大通水尚名都2幢502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017470	17470	33100061192	2016/11/7 10:02:06	2	5	02		2018-10-25 13:40:49	2018-10-25 16:41:24
272	109074134	20161103-0032641	109074129	FDCQ	330604012051GB00708F00050099	浙(2016)绍兴市上虞区不动产权第0017255号	单独所有	百官街道大通水尚名都6幢903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017255	17255	33100061108	2016/11/3 11:29:04	6	9	03		2018-10-25 13:40:49	2018-10-25 16:41:24
273	109126579	20161102-0032269	109126574	FDCQ	330604012051GB00708F00030099	浙(2016)绍兴市上虞区不动产权第0016872号	单独所有	百官街道大通水尚名都3幢3103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016872	16872	33100060924	2016/11/8 16:31:00	3	31	03		2018-10-25 13:40:49	2018-10-25 16:41:24
274	109078239	20161103-0032695	109078234	FDCQ	330604012051GB00708F00070089	浙(2016)绍兴市上虞区不动产权第0017197号	单独所有	百官街道大通水尚名都8幢2单元23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017197	17197	33100060991	2016/11/3 14:46:18	8	24	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
275	109078163	20161103-0032698	109078157	FDCQ	330604012051GB00708F00090006	浙(2016)绍兴市上虞区不动产权第0017189号	共同共有	百官街道大通水尚名都10幢102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.51㎡/房屋建筑面积95.12㎡	4.51	95.12	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017189	17189	33100060988	2016/11/3 14:44:58	10	1	02		2018-10-25 13:40:49	2018-10-25 16:41:24
276	109079852	20161103-0032726	109079846	FDCQ	330604012051GB00708F00040060	浙(2016)绍兴市上虞区不动产权第0016879号	共同共有	百官街道大通水尚名都5幢2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016879	16879	33100060880	2016/11/3 15:13:05	5	22	04		2018-10-25 13:40:49	2018-10-25 16:41:24
277	109166386	20161114-0034585	109166380	FDCQ	330604012051GB00708F00070107	浙(2016)绍兴市上虞区不动产权第0018137号	共同共有	百官街道大通水尚名都8幢2单元503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018137	18137	33100062077	2016/11/14 9:53:11	8	5	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
278	108983551	20161025-0030767	108983546	FDCQ	330604012051GB00708F00120025	浙(2016)绍兴市上虞区不动产权第0016292号	单独所有	百官街道大通水尚名都12幢1单元2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016292	16292	33100060340	2016/10/25 10:41:11	12	21	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
279	109064466	20161102-0032462	109064460	FDCQ	330604012051GB00708F00020004	浙(2016)绍兴市上虞区不动产权第0016927号	共同共有	百官街道大通水尚名都2幢102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.22㎡/房屋建筑面积178.65㎡	8.22	178.65	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016927	16927	33100060898	2016/11/2 15:00:40	2	1	02		2018-10-25 13:40:49	2018-10-25 16:41:24
280	112098033	20170712-0082800	112098026	FDCQ	330604012051GB00708F00120021	浙(2017)绍兴市上虞区不动产权第0019652号	共同共有	百官街道大通水尚名都12幢1单元1901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0019652	19652	33001407441	2017/7/12 16:27:05	12	19	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
967	109112911	20161108-0033345	109112906	FDCQ	330604012051GB00708F00090059	浙(2016)绍兴市上虞区不动产权第0017646号	单独所有	百官街道大通水尚名都10幢2203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017646	17646	33100061344	2016/11/8 8:54:47	10	22	03		2018-10-25 13:40:52	2018-10-25 16:42:02
282	110109354	20170125-0051799	110109348	FDCQ	330604012051GB00708F00120067	浙(2017)绍兴市上虞区不动产权第0004511号	单独所有	百官街道大通水尚名都12幢2单元1907室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004511	4511	33001396056	2017/1/25 15:49:26	12	19	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
283	213525775	20170930-0001497	213525770	FDCQ	330604012051GB00708F00120068	浙(2017)绍兴市上虞区不动产权第0026994号	单独所有	百官街道大通水尚名都12幢2单元1908室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026994	26994	33001413063	2017/9/30 11:27:45	12	19	08	2	2018-10-25 13:40:49	2018-10-25 16:41:24
284	109906344	20170111-0048232	109906338	FDCQ	330604012051GB00708F00100041	浙(2017)绍兴市上虞区不动产权第0003109号	共同共有	百官街道大通水尚名都11幢1单元901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003109	3109	33001395507	2017/1/11 9:01:32	11	9	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
285	110751495	20170407-0062421	110751488	FDCQ	330604012051GB00708F00090010	浙(2017)绍兴市上虞区不动产权第0010231号	共同共有	百官街道大通水尚名都10幢1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010231	10231	33001400751	2017/4/7 9:35:23	10	11	02		2018-10-25 13:40:49	2018-10-25 16:41:24
286	110134006	20170206-0052364	110134000	FDCQ	330604012051GB00708F00060135	浙(2017)绍兴市上虞区不动产权第0004876号	共同共有	百官街道大通水尚名都7幢2单元1707室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004876	4876	33001396628	2017/2/6 14:55:57	7	17	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
287	109077055	20161103-0032686	109077050	FDCQ	330604012051GB00708F00050014	浙(2016)绍兴市上虞区不动产权第0016881号	单独所有	百官街道大通水尚名都6幢1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016881	16881	33100060882	2016/11/3 14:26:26	6	12	02		2018-10-25 13:40:49	2018-10-25 16:41:24
288	109076886	20161103-0032680	109076875	FDCQ	330604012051GB00708F00060124	浙(2016)绍兴市上虞区不动产权第0016869号	单独所有	百官街道大通水尚名都7幢2单元12B08室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016869	16869	33100060874	2016/11/3 14:21:55	7	13	08	2	2018-10-25 13:40:49	2018-10-25 16:41:24
289	109270642	20161125-0036868	109270636	FDCQ	330604012051GB00708F00030043	浙(2016)绍兴市上虞区不动产权第0019018号	共同共有	百官街道大通水尚名都3幢1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019018	19018	33100063069	2016/11/25 9:09:22	3	19	03		2018-10-25 13:40:49	2018-10-25 16:41:24
290	109270657	20161125-0036869	109270651	FDCQ	330604012051GB00708F00060064	浙(2016)绍兴市上虞区不动产权第0019307号	共同共有	百官街道大通水尚名都7幢1单元2304室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019307	19307	33100063718	2016/11/25 9:10:37	7	23	04	1	2018-10-25 13:40:49	2018-10-25 16:41:24
291	110503204	20170313-0057831	110503195	FDCQ	330604012051GB00708F00010090	浙(2017)绍兴市上虞区不动产权第0008463号	共同共有	百官街道大通水尚名都1幢803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0008463	8463	33001398698	2017/3/13 10:14:26	1	8	03		2018-10-25 13:40:49	2018-10-25 16:41:24
292	110197709	20170210-0053348	110197704	FDCQ	330604012051GB00708F00060196	浙(2017)绍兴市上虞区不动产权第0005387号	单独所有	百官街道大通水尚名都7幢2单元808室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005387	5387	33001397048	2017/2/10 11:44:15	7	8	08	2	2018-10-25 13:40:49	2018-10-25 16:41:24
293	109142507	20161110-0034024	109142501	FDCQ	330604012051GB00708F00090062	浙(2016)绍兴市上虞区不动产权第0017904号	共同共有	百官街道大通水尚名都10幢2302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017904	17904	33100061492	2016/11/10 9:48:48	10	23	02		2018-10-25 13:40:49	2018-10-25 16:41:24
294	108574891	20160901-0023146	108574577	FDCQ	330604012051GB00708F00040084	浙(2016)绍兴市上虞区不动产权第0009789号	单独所有	百官街道大通水尚名都5幢504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	资料详见1幢。	浙	绍兴市上虞区	2016	0009789	9789	2016/9/9 8:57:59	5	5	04		2018-10-25 13:40:49	2018-10-25 16:41:24
981	109046782	20161101-0032140	109046771	FDCQ	330604012051GB00708F00030067	浙(2016)绍兴市上虞区不动产权第0016790号	共同共有	百官街道大通水尚名都3幢23A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016790	16790	33100060860	2016/11/1 14:34:59	3	24	03		2018-10-25 13:40:52	2018-10-25 16:42:02
296	109134104	20161109-0033836	109134098	FDCQ	330604012051GB00708F00040064	浙(2016)绍兴市上虞区不动产权第0017688号	共同共有	百官街道大通水尚名都5幢2304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017688	17688	33100061359	2016/11/9 11:43:09	5	23	04		2018-10-25 13:40:49	2018-10-25 16:41:24
297	109102902	20161107-0033107	109102897	FDCQ	330604012051GB00708F00060069	浙(2016)绍兴市上虞区不动产权第0017460号	单独所有	百官街道大通水尚名都7幢1单元2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017460	17460	33100061187	2016/11/7 10:12:50	7	25	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
298	109099155	20161107-0033095	109099149	FDCQ	330604012051GB00708F00010034	浙(2016)绍兴市上虞区不动产权第0017196号	共同共有	百官街道大通水尚名都1幢2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017196	17196	33100061047	2016/11/7 9:56:57	1	20	01		2018-10-25 13:40:49	2018-10-25 16:41:24
299	109145433	20161110-0034079	109145427	FDCQ	330604012051GB00708F00120087	浙(2016)绍兴市上虞区不动产权第0017559号	共同共有	百官街道大通水尚名都12幢2单元907室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017559	17559	33100061283	2016/11/10 10:59:43	12	9	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
300	109145421	20161110-0034076	109145415	FDCQ	330604012051GB00708F00060074	浙(2016)绍兴市上虞区不动产权第0017917号	共同共有	百官街道大通水尚名都7幢1单元302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017917	17917	33100062025	2016/11/10 10:59:38	7	3	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
301	109410001	20161209-0039911	109409995	FDCQ	330604012051GB00708F00050019	浙(2016)绍兴市上虞区不动产权第0020725号	共同共有	百官街道大通水尚名都6幢12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020725	20725	33100065210	2016/12/9 11:00:01	6	13	03		2018-10-25 13:40:49	2018-10-25 16:41:24
302	111921428	20170627-0079483	111921422	FDCQ	330604012051GB00708F00100067	浙(2017)绍兴市上虞区不动产权第0018654号	共同共有	百官街道大通水尚名都11幢2单元1907室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0018654	18654	33001406601	2017/6/27 15:10:15	11	19	07	2	2018-10-25 13:40:49	2018-10-25 16:41:24
303	108991775	20161026-0030955	108991769	FDCQ	330604012051GB00708F00040026	浙(2016)绍兴市上虞区不动产权第0016179号	共同共有	百官街道大通水尚名都5幢1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016179	16179	33100060306	2016/10/26 9:24:49	5	15	02		2018-10-25 13:40:49	2018-10-25 16:41:24
304	109155787	20161111-0034347	109155782	FDCQ	330604012051GB00708F00080001	浙(2016)绍兴市上虞区不动产权第0017711号	单独所有	百官街道大通水尚名都9幢1单元1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017711	17711	33100061428	2016/11/11 10:56:28	9	10	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
305	109113632	20161108-0033367	109113625	FDCQ	330604012051GB00708F00120029	浙(2016)绍兴市上虞区不动产权第0017558号	共同共有	百官街道大通水尚名都12幢1单元301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017558	17558	33100061317	2016/11/8 9:19:31	12	3	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
306	109086791	20161104-0032847	109086785	FDCQ	330604012051GB00708F00100019	浙(2016)绍兴市上虞区不动产权第0017293号	共同共有	百官街道大通水尚名都11幢1单元1703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017293	17293	33100061128	2016/11/4 9:55:01	11	17	03	1	2018-10-25 13:40:49	2018-10-25 16:41:24
307	108966016	20161021-0030398	108966010	FDCQ	330604012051GB00708F00030089	浙(2016)绍兴市上虞区不动产权第0016171号	共同共有	百官街道大通水尚名都3幢3001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016171	16171	33100060303	2016/10/21 15:01:26	3	30	01		2018-10-25 13:40:49	2018-10-25 16:41:24
308	108994307	20161026-0031006	108994301	FDCQ	330604012051GB00708F00040071	浙(2016)绍兴市上虞区不动产权第0016173号	共同共有	百官街道大通水尚名都5幢2503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016173	16173	33100060304	2016/10/26 10:45:47	5	25	03		2018-10-25 13:40:49	2018-10-25 16:41:24
995	109296468	20161129-0037430	109296462	FDCQ	330604012051GB00708F00120016	浙(2016)绍兴市上虞区不动产权第0019468号	共同共有	百官街道大通水尚名都12幢1单元1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019468	19468	33100063741	2016/11/29 10:25:24	12	15	04	1	2018-10-25 13:40:52	2018-10-25 16:42:02
321	109064347	20161102-0032455	109064341	FDCQ	330604012051GB00708F00060066	浙(2016)绍兴市上虞区不动产权第0017088号	共同共有	百官街道大通水尚名都7幢1单元23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017088	17088	33100060966	2016/11/2 14:57:36	7	24	02	1	2018-10-25 13:40:49	2018-10-25 16:42:53
322	109088015	20161104-0032868	109088007	FDCQ	330604012051GB00708F00070046	浙(2016)绍兴市上虞区不动产权第0017262号	共同共有	百官街道大通水尚名都8幢1单元302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017262	17262	33100061113	2016/11/4 10:33:32	8	3	02	1	2018-10-25 13:40:49	2018-10-25 16:42:53
310	108998111	20161026-0031087	108998106	FDCQ	330604012051GB00708F00010013	浙(2016)绍兴市上虞区不动产权第0016069号	单独所有	百官街道大通水尚名都1幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016069	16069	33100060275	2016/10/26 14:46:38	1	13	01		2018-10-25 13:40:49	2018-10-25 16:41:24
311	110143480	20170207-0052584	110143474	FDCQ	330604012051GB00708F00060029	浙(2017)绍兴市上虞区不动产权第0004932号	共同共有	百官街道大通水尚名都7幢1单元1601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004932	4932	33001396918	2017/2/7 14:46:24	7	16	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
312	110078559	20170123-0051130	110078552	FDCQ	330604012051GB00708F00010092	浙(2017)绍兴市上虞区不动产权第0004295号	共同共有	百官街道大通水尚名都1幢902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004295	4295	33001395987	2017/1/23 10:57:28	1	9	02		2018-10-25 13:40:49	2018-10-25 16:41:24
313	109409473	20161209-0039845	109409467	FDCQ	330604012051GB00708F00060090	浙(2016)绍兴市上虞区不动产权第0020719号	共同共有	百官街道大通水尚名都7幢1单元702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020719	20719	33100065208	2016/12/9 10:42:32	7	7	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
314	109056607	20161102-0032345	109056601	FDCQ	330604012051GB00708F00010070	浙(2016)绍兴市上虞区不动产权第0016747号	共同共有	百官街道大通水尚名都1幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016747	16747	33100060840	2016/11/2 10:39:02	1	3	01		2018-10-25 13:40:49	2018-10-25 16:41:24
315	109527978	20161220-0042549	109527972	FDCQ	330604012051GB00708F00090119	浙(2016)绍兴市上虞区不动产权第0022383号	共同共有	百官街道大通水尚名都10幢903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022383	22383	33001391652	2016/12/20 15:00:20	10	9	03		2018-10-25 13:40:49	2018-10-25 16:41:24
316	109030770	20161031-0031838	109030764	FDCQ	330604012051GB00708F00030112	浙(2016)绍兴市上虞区不动产权第0016504号	共同共有	百官街道大通水尚名都3幢604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016504	16504	33100060429	2016/10/31 14:43:07	3	6	04		2018-10-25 13:40:49	2018-10-25 16:41:24
317	109023849	20161031-0031685	109023842	FDCQ	330604012051GB00708F00030039	浙(2016)绍兴市上虞区不动产权第0016499号	共同共有	百官街道大通水尚名都3幢17A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016499	16499	33100060426	2016/10/31 9:21:03	3	18	03		2018-10-25 13:40:49	2018-10-25 16:41:24
318	109204611	20161117-0035430	109204606	FDCQ	330604012051GB00708F00120038	浙(2016)绍兴市上虞区不动产权第0018431号	单独所有	百官街道大通水尚名都12幢1单元702室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018431	18431	33100062287	2016/11/17 11:43:28	12	7	02	1	2018-10-25 13:40:49	2018-10-25 16:41:24
319	109404982	20161209-0039808	109404976	FDCQ	330604012051GB00708F00090116	浙(2016)绍兴市上虞区不动产权第0021007号	共同共有	百官街道大通水尚名都10幢804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021007	21007	33100065270	2016/12/9 9:21:12	10	8	04		2018-10-25 13:40:49	2018-10-25 16:41:24
1009	109465472	20161214-0041112	109465466	FDCQ	330604012051GB00708F00080085	浙(2016)绍兴市上虞区不动产权第0021646号	共同共有	百官街道大通水尚名都9幢2单元2203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021646	21646	33001390104	2016/12/14 15:51:24	9	22	03	2	2018-10-25 13:40:52	2018-10-25 16:42:02
324	109086596	20161104-0032844	109086591	FDCQ	330604012051GB00708F00030061	浙(2016)绍兴市上虞区不动产权第0017005号	单独所有	百官街道大通水尚名都3幢2301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017005	17005	33100061010	2016/11/4 9:47:16	3	23	01		2018-10-25 13:40:49	2018-10-25 16:42:53
325	109087200	20161104-0032854	109087194	FDCQ	330604012051GB00708F00100084	浙(2016)绍兴市上虞区不动产权第0017296号	共同共有	百官街道大通水尚名都11幢2单元708室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017296	17296	33100061129	2016/11/4 10:08:50	11	7	08	2	2018-10-25 13:40:49	2018-10-25 16:42:53
326	109007901	20161027-0031301	109007895	FDCQ	330604012051GB00708F00060073	浙(2016)绍兴市上虞区不动产权第0016195号	共同共有	百官街道大通水尚名都7幢1单元301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016195	16195	33100060030	2016/10/27 14:53:08	7	3	01	1	2018-10-25 13:40:49	2018-10-25 16:42:53
328	109053476	20161102-0032281	109053470	FDCQ	330604012051GB00708F00060038	浙(2016)绍兴市上虞区不动产权第0016896号	共同共有	百官街道大通水尚名都7幢1单元17A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016896	16896	33100060930	2016/11/2 9:31:08	7	18	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
329	216618286	20180213-0014378	216618280	FDCQ	330604012051GB00708F00090077	浙(2018)绍兴市上虞区不动产权第0010128号	共同共有	百官街道大通水尚名都10幢2701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0010128	10128	33001419991	2018/2/13 15:03:47	10	27	01		2018-10-25 13:40:49	2018-10-25 16:41:35
330	109024208	20161031-0031691	109024202	FDCQ	330604012051GB00708F00030033	浙(2016)绍兴市上虞区不动产权第0016408号	共同共有	百官街道大通水尚名都3幢1701室	国有建设用地使用权/房屋（构筑物）所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016408	16408	33100060396	2016/10/31 9:27:32	3	17	01		2018-10-25 13:40:49	2018-10-25 16:41:35
331	109088328	20161104-0032876	109088322	FDCQ	330604012051GB00708F00030037	浙(2016)绍兴市上虞区不动产权第0017009号	共同共有	百官街道大通水尚名都3幢17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017009	17009	33100061011	2016/11/4 10:43:16	3	18	01		2018-10-25 13:40:49	2018-10-25 16:41:35
332	109006776	20161027-0031283	109006770	FDCQ	330604012051GB00708F00020013	浙(2016)绍兴市上虞区不动产权第0016176号	共同共有	百官街道大通水尚名都2幢1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016176	16176	33100060022	2016/10/27 14:20:19	2	15	01		2018-10-25 13:40:49	2018-10-25 16:41:35
333	109030387	20161031-0031826	109030381	FDCQ	330604012051GB00708F00030058	浙(2016)绍兴市上虞区不动产权第0016425号	共同共有	百官街道大通水尚名都3幢2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016425	16425	33100060724	2016/10/31 14:33:30	3	22	02		2018-10-25 13:40:49	2018-10-25 16:41:35
334	109166608	20161114-0034590	109166602	FDCQ	330604012051GB00708F00120018	浙(2016)绍兴市上虞区不动产权第0018043号	共同共有	百官街道大通水尚名都12幢1单元1702室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018043	18043	33100062053	2016/11/14 9:59:04	12	17	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
335	109167368	20161114-0034611	109167362	FDCQ	330604012051GB00708F00120075	浙(2016)绍兴市上虞区不动产权第0018162号	共同共有	百官街道大通水尚名都12幢2单元307室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018162	18162	33100062089	2016/11/14 10:18:19	12	3	07	2	2018-10-25 13:40:49	2018-10-25 16:41:35
336	109873977	20170109-0047542	109873970	FDCQ	330604012051GB00708F00010003	浙(2017)绍兴市上虞区不动产权第0002669号	单独所有	百官街道大通水尚名都1幢1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002669	2669	33001394048	2017/1/9 10:49:47	1	10	03		2018-10-25 13:40:49	2018-10-25 16:41:35
1023	109422033	20161212-0040139	109422026	FDCQ	330604012051GB00708F00080044	浙(2016)绍兴市上虞区不动产权第0021190号	共同共有	百官街道大通水尚名都9幢1单元3002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021190	21190	33100065301	2016/12/12 9:41:46	9	30	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
338	108972304	20161024-0030533	108972299	FDCQ	330604012051GB00708F00080024	浙(2016)绍兴市上虞区不动产权第0015847号	单独所有	百官街道大通水尚名都9幢1单元202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015847	15847	33100059730	2016/10/24 10:46:21	9	2	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
339	109112963	20161108-0033346	109112957	FDCQ	330604012051GB00708F00100016	浙(2016)绍兴市上虞区不动产权第0017324号	共同共有	百官街道大通水尚名都11幢1单元1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017324	17324	33100061099	2016/11/8 8:57:39	11	15	04	1	2018-10-25 13:40:49	2018-10-25 16:41:35
340	109113042	20161108-0033347	109113036	FDCQ	330604012051GB00708F00100033	浙(2016)绍兴市上虞区不动产权第0017562号	共同共有	百官街道大通水尚名都11幢1单元501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017562	17562	33100061319	2016/11/8 9:01:08	11	5	01	1	2018-10-25 13:40:49	2018-10-25 16:41:35
341	109238358	20161122-0036181	109238352	FDCQ	330604012051GB00708F00080054	浙(2016)绍兴市上虞区不动产权第0018901号	共同共有	百官街道大通水尚名都9幢1单元702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018901	18901	33100063224	2016/11/22 9:54:25	9	7	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
342	109542153	20161221-0042857	109542147	FDCQ	330604012051GB00708F00120042	浙(2016)绍兴市上虞区不动产权第0022500号	共同共有	百官街道大通水尚名都12幢1单元902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022500	22500	33001391403	2016/12/21 11:53:41	12	9	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
343	109189115	20161116-0035068	109189109	FDCQ	330604012051GB00708F00080052	浙(2016)绍兴市上虞区不动产权第0018314号	共同共有	百官街道大通水尚名都9幢1单元602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018314	18314	33100062243	2016/11/16 9:01:04	9	6	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
344	109228631	20161121-0035972	109228625	FDCQ	330604012051GB00708F00030038	浙(2016)绍兴市上虞区不动产权第0018732号	共同共有	百官街道大通水尚名都3幢17A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018732	18732	33100062480	2016/11/21 11:00:12	3	18	02		2018-10-25 13:40:49	2018-10-25 16:41:35
345	109377832	20161207-0039219	109377826	FDCQ	330604012051GB00708F00070040	浙(2016)绍兴市上虞区不动产权第0020504号	共同共有	百官街道大通水尚名都8幢1单元2802室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020504	20504	33100064920	2016/12/7 9:56:26	8	28	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
346	109127313	20161102-0032277	109127308	FDCQ	330604012051GB00708F00050018	浙(2016)绍兴市上虞区不动产权第0016932号	单独所有	百官街道大通水尚名都6幢12A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016932	16932	33100060943	2016/11/8 16:50:58	6	13	02		2018-10-25 13:40:49	2018-10-25 16:41:35
347	109240149	20161122-0036220	109240143	FDCQ	330604012051GB00708F00060109	浙(2016)绍兴市上虞区不动产权第0018637号	共同共有	百官街道大通水尚名都7幢2单元1105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018637	18637	33100062449	2016/11/22 10:32:44	7	11	05	2	2018-10-25 13:40:49	2018-10-25 16:41:35
348	108578596	20160901-0023151	108578186	FDCQ	330604012051GB00708F00050002	浙(2016)绍兴市上虞区不动产权第0009548号	单独所有	百官街道大通水尚名都6幢1002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.10㎡/房屋建筑面积89.41㎡	5.10	89.41	国有建设用地使用权2083年01月09日止	\N	资料详见1幢。	浙	绍兴市上虞区	2016	0009548	9548	2016/9/9 9:03:01	6	10	02		2018-10-25 13:40:49	2018-10-25 16:41:35
349	109217768	20161118-0035723	109217762	FDCQ	330604012051GB00708F00060147	浙(2016)绍兴市上虞区不动产权第0018535号	共同共有	百官街道大通水尚名都7幢2单元2007室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018535	18535	33100062411	2016/11/18 11:31:39	7	20	07	2	2018-10-25 13:40:49	2018-10-25 16:41:35
350	109594657	20161226-0044039	109594651	FDCQ	330604012051GB00708F00060056	浙(2017)绍兴市上虞区不动产权第0000160号	共同共有	百官街道大通水尚名都7幢1单元2104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000160	160	33001392156	2016/12/26 14:35:11	7	21	04	1	2018-10-25 13:40:49	2018-10-25 16:41:35
1037	109414602	20161209-0039989	109414595	FDCQ	330604012051GB00708F00070033	浙(2016)绍兴市上虞区不动产权第0020784号	共同共有	百官街道大通水尚名都8幢1单元2501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020784	20784	33100065254	2016/12/9 14:46:13	8	25	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
352	109226480	20161121-0035928	109226474	FDCQ	330604012051GB00708F00060082	浙(2016)绍兴市上虞区不动产权第0018668号	共同共有	百官街道大通水尚名都7幢1单元502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018668	18668	33100062850	2016/11/21 9:56:31	7	5	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
353	109226502	20161121-0035925	109226496	FDCQ	330604012051GB00708F00120022	浙(2016)绍兴市上虞区不动产权第0018763号	共同共有	百官街道大通水尚名都12幢1单元1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018763	18763	33100062870	2016/11/21 9:58:01	12	19	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
354	109226612	20161121-0035929	109226606	FDCQ	330604012051GB00708F00010032	浙(2016)绍兴市上虞区不动产权第0018676号	共同共有	百官街道大通水尚名都1幢1902室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018676	18676	33100062853	2016/11/21 10:01:52	1	19	02		2018-10-25 13:40:49	2018-10-25 16:41:35
355	109888953	20170110-0047909	109888947	FDCQ	330604012051GB00708F00090030	浙(2017)绍兴市上虞区不动产权第0002894号	共同共有	百官街道大通水尚名都10幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002894	2894	33001394968	2017/1/10 8:59:30	10	16	02		2018-10-25 13:40:49	2018-10-25 16:41:35
356	109187849	20161115-0035046	109187843	FDCQ	330604012051GB00708F00020024	浙(2016)绍兴市上虞区不动产权第0018071号	共同共有	百官街道大通水尚名都2幢2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018071	18071	33100062061	2016/11/15 16:29:14	2	20	02		2018-10-25 13:40:49	2018-10-25 16:41:35
357	109166099	20161107-0033330	109166093	FDCQ	330604012051GB00708F00100007	浙(2016)绍兴市上虞区不动产权第0017465号	共同共有	百官街道大通水尚名都11幢1单元1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017465	17465	33100061190	2016/11/14 9:44:07	11	11	03	1	2018-10-25 13:40:49	2018-10-25 16:41:35
358	109228689	20161121-0035971	109228683	FDCQ	330604012051GB00708F00060002	浙(2016)绍兴市上虞区不动产权第0018663号	共同共有	百官街道大通水尚名都7幢1单元1002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018663	18663	33100062849	2016/11/21 11:00:59	7	10	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
359	109070275	20161025-0030759	109070269	FDCQ	330604012051GB00708F00120069	浙(2016)绍兴市上虞区不动产权第0016295号	共同共有	百官街道大通水尚名都12幢2单元2105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016295	16295	33100060341	2016/11/3 9:50:58	12	21	05	2	2018-10-25 13:40:49	2018-10-25 16:41:35
360	109161446	20161111-0034481	109161440	FDCQ	330604012051GB00708F00080108	浙(2016)绍兴市上虞区不动产权第0017709号	共同共有	百官街道大通水尚名都9幢2单元504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017709	17709	33100061427	2016/11/11 15:51:22	9	5	04	2	2018-10-25 13:40:49	2018-10-25 16:41:35
361	109486782	20161216-0041579	109486774	FDCQ	330604012051GB00708F00020012	浙(2016)绍兴市上虞区不动产权第0021852号	共同共有	百官街道大通水尚名都2幢12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让	浙	绍兴市上虞区	2016	0021852	21852	33001390228	2016/12/16 14:40:55	2	13	02		2018-10-25 13:40:49	2018-10-25 16:41:35
362	109327310	20161201-0038092	109327304	FDCQ	330604012051GB00708F00010048	浙(2016)绍兴市上虞区不动产权第0019818号	共同共有	百官街道大通水尚名都1幢2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019818	19818	33100064777	2016/12/1 15:34:58	1	23	03		2018-10-25 13:40:49	2018-10-25 16:41:35
363	110141688	20170207-0052538	110141682	FDCQ	330604012051GB00708F00010060	浙(2017)绍兴市上虞区不动产权第0004997号	单独所有	百官街道大通水尚名都1幢2703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004997	4997	33001396342	2017/2/7 11:28:31	1	27	03		2018-10-25 13:40:49	2018-10-25 16:41:35
364	109199884	20161117-0035315	109199872	FDCQ	330604012051GB00708F00080058	浙(2016)绍兴市上虞区不动产权第0018395号	共同共有	百官街道大通水尚名都9幢1单元902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018395	18395	33100062361	2016/11/17 9:02:23	9	9	02	1	2018-10-25 13:40:49	2018-10-25 16:41:35
1051	109511568	20161219-0042195	109511562	FDCQ	330604012051GB00708F00080006	浙(2016)绍兴市上虞区不动产权第0022306号	共同共有	百官街道大通水尚名都9幢1单元1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022306	22306	33001390193	2016/12/19 15:34:45	9	12	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
366	109572100	20161223-0043544	109572095	FDCQ	330604012051GB00708F00060139	浙(2016)绍兴市上虞区不动产权第0023143号	单独所有	百官街道大通水尚名都7幢2单元17A07室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023143	23143	33001392215	2016/12/23 10:55:38	7	18	07	2	2018-10-25 13:40:50	2018-10-25 16:41:35
367	109337335	20161202-0038322	109337330	FDCQ	330604012051GB00708F00010086	浙(2016)绍兴市上虞区不动产权第0019932号	单独所有	百官街道大通水尚名都1幢702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019932	19932	33100064162	2016/12/2 14:42:19	1	7	02		2018-10-25 13:40:50	2018-10-25 16:41:35
368	109166110	20161114-0034579	109166104	FDCQ	330604012051GB00708F00090072	浙(2016)绍兴市上虞区不动产权第0017857号	共同共有	百官街道大通水尚名都10幢2504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017857	17857	33100061475	2016/11/14 9:44:12	10	25	04		2018-10-25 13:40:50	2018-10-25 16:41:35
369	109219930	20161118-0035773	109219924	FDCQ	330604012051GB00708F00120034	浙(2016)绍兴市上虞区不动产权第0018525号	共同共有	百官街道大通水尚名都12幢1单元502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018525	18525	33100062406	2016/11/18 14:27:59	12	5	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
370	109176108	20161115-0034803	109176102	FDCQ	330604012051GB00708F00090104	浙(2016)绍兴市上虞区不动产权第0018155号	共同共有	百官街道大通水尚名都10幢504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018155	18155	33100062162	2016/11/15 8:54:56	10	5	04		2018-10-25 13:40:50	2018-10-25 16:41:35
371	109184564	20161115-0034969	109184558	FDCQ	330604012051GB00708F00050069	浙(2016)绍兴市上虞区不动产权第0018204号	共同共有	百官街道大通水尚名都6幢2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018204	18204	33100062185	2016/11/15 14:58:44	6	25	01		2018-10-25 13:40:50	2018-10-25 16:41:35
372	109239410	20161122-0036203	109239404	FDCQ	330604012051GB00708F00060138	浙(2016)绍兴市上虞区不动产权第0018858号	共同共有	百官街道大通水尚名都7幢2单元17A06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018858	18858	33100063205	2016/11/22 10:15:16	7	18	06	2	2018-10-25 13:40:50	2018-10-25 16:41:35
373	109454789	20161214-0040902	109454783	FDCQ	330604012051GB00708F00080035	浙(2016)绍兴市上虞区不动产权第0021454号	共同共有	百官街道大通水尚名都9幢1单元2601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021454	21454	33100065192	2016/12/14 10:05:25	9	26	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
374	110222080	20170214-0053820	110222074	FDCQ	330604012051GB00708F00100087	浙(2017)绍兴市上虞区不动产权第0005289号	共同共有	百官街道大通水尚名都11幢2单元907室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005289	5289	33001397187	2017/2/14 15:09:40	11	9	07	2	2018-10-25 13:40:50	2018-10-25 16:41:35
375	109192716	20161116-0035141	109192710	FDCQ	330604012051GB00708F00090027	浙(2016)绍兴市上虞区不动产权第0018317号	共同共有	百官街道大通水尚名都10幢1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018317	18317	33100062328	2016/11/16 10:58:49	10	15	03		2018-10-25 13:40:50	2018-10-25 16:41:35
376	109241941	20161122-0036260	109241935	FDCQ	330604012051GB00708F00080069	浙(2016)绍兴市上虞区不动产权第0018812号	共同共有	百官街道大通水尚名都9幢2单元1503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018812	18812	33100063015	2016/11/22 11:06:00	9	15	03	2	2018-10-25 13:40:50	2018-10-25 16:41:35
377	109571890	20161223-0043535	109571884	FDCQ	330604012051GB00708F00100054	浙(2016)绍兴市上虞区不动产权第0023605号	共同共有	百官街道大通水尚名都11幢2单元12A06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023605	23605	33001391920	2016/12/23 10:51:25	11	13	06	2	2018-10-25 13:40:50	2018-10-25 16:41:35
378	109572517	20161223-0043549	109572511	FDCQ	330604012051GB00708F00090033	浙(2016)绍兴市上虞区不动产权第0024143号	共同共有	百官街道大通水尚名都10幢1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0024143	24143	33001392800	2016/12/23 11:04:03	10	17	01		2018-10-25 13:40:50	2018-10-25 16:41:35
1065	109445739	20161213-0040694	109445732	FDCQ	330604012051GB00708F00040019	浙(2016)绍兴市上虞区不动产权第0021316号	共同共有	百官街道大通水尚名都5幢12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让	浙	绍兴市上虞区	2016	0021316	21316	33100065173	2016/12/13 14:30:42	5	13	03		2018-10-25 13:40:52	2018-10-25 16:42:07
380	109184256	20161115-0034980	109184250	FDCQ	330604012051GB00708F00080072	浙(2016)绍兴市上虞区不动产权第0018151号	共同共有	百官街道大通水尚名都9幢2单元1604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018151	18151	33100062160	2016/11/15 14:46:58	9	16	04	2	2018-10-25 13:40:50	2018-10-25 16:41:35
381	110294625	20170222-0055067	110294620	FDCQ	330604012051GB00708F00080053	浙(2017)绍兴市上虞区不动产权第0006024号	单独所有	百官街道大通水尚名都9幢1单元701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0006024	6024	33001398057	2017/2/22 14:33:53	9	7	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
382	109231316	20161121-0036031	109231310	FDCQ	330604012051GB00708F00080014	浙(2016)绍兴市上虞区不动产权第0018603号	共同共有	百官街道大通水尚名都9幢1单元1602室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018603	18603	33100062830	2016/11/21 14:13:07	9	16	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
383	109222111	20161118-0035823	109222105	FDCQ	330604012051GB00708F00040043	浙(2016)绍兴市上虞区不动产权第0018592号	共同共有	百官街道大通水尚名都5幢1903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018592	18592	33100062827	2016/11/18 15:30:04	5	19	03		2018-10-25 13:40:50	2018-10-25 16:41:35
384	109199689	20161117-0035309	109199683	FDCQ	330604012051GB00708F00100079	浙(2016)绍兴市上虞区不动产权第0018438号	共同共有	百官街道大通水尚名都11幢2单元507室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018438	18438	33100062290	2016/11/17 8:56:55	11	5	07	2	2018-10-25 13:40:50	2018-10-25 16:41:35
385	109199760	20161117-0035311	109199754	FDCQ	330604012051GB00708F00120031	浙(2016)绍兴市上虞区不动产权第0018383号	共同共有	百官街道大通水尚名都12幢1单元303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018383	18383	33100062355	2016/11/17 8:59:59	12	3	03	1	2018-10-25 13:40:50	2018-10-25 16:41:35
386	109404430	20161209-0039803	109404424	FDCQ	330604012051GB00708F00020022	浙(2016)绍兴市上虞区不动产权第0020714号	共同共有	百官街道大通水尚名都2幢1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020714	20714	33100065206	2016/12/9 9:09:17	2	19	02		2018-10-25 13:40:50	2018-10-25 16:41:35
387	109216671	20161118-0035698	109216665	FDCQ	330604012051GB00708F00050095	浙(2016)绍兴市上虞区不动产权第0018532号	共同共有	百官街道大通水尚名都6幢803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018532	18532	33100062410	2016/11/18 11:04:21	6	8	03		2018-10-25 13:40:50	2018-10-25 16:41:35
388	109196791	20161116-0035244	109196785	FDCQ	330604012051GB00708F00080017	浙(2016)绍兴市上虞区不动产权第0018337号	共同共有	百官街道大通水尚名都9幢1单元17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018337	18337	33100062337	2016/11/16 14:44:03	9	18	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
389	109197361	20161116-0035254	109197356	FDCQ	330604012051GB00708F00060175	浙(2016)绍兴市上虞区不动产权第0018356号	单独所有	百官街道大通水尚名都7幢2单元307室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018356	18356	33100062343	2016/11/16 15:08:00	7	3	07	2	2018-10-25 13:40:50	2018-10-25 16:41:35
390	108982719	20161025-0030746	108982713	FDCQ	330604012051GB00708F00060070	浙(2016)绍兴市上虞区不动产权第0016134号	共同共有	百官街道大通水尚名都7幢1单元2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016134	16134	33100060290	2016/10/25 10:12:11	7	25	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
391	109141880	20161110-0034009	109141870	FDCQ	330604012051GB00708F00080074	浙(2016)绍兴市上虞区不动产权第0017944号	单独所有	百官街道大通水尚名都9幢2单元1704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017944	17944	33100062028	2016/11/10 9:24:17	9	17	04	2	2018-10-25 13:40:50	2018-10-25 16:41:35
392	109072050	20161103-0032609	109072044	FDCQ	330604012051GB00708F00050032	浙(2016)绍兴市上虞区不动产权第0017237号	共同共有	百官街道大通水尚名都6幢1604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017237	17237	33100061066	2016/11/3 10:42:32	6	16	04		2018-10-25 13:40:50	2018-10-25 16:41:35
1079	110239351	20170216-0054202	110239346	FDCQ	330604012051GB00708F00120056	浙(2017)绍兴市上虞区不动产权第0005566号	单独所有	百官街道大通水尚名都12幢2单元12A08室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005566	5566	33001397325	2017/2/16 14:31:02	12	13	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
394	109234148	20161121-0036095	109234142	FDCQ	330604012051GB00708F00120040	浙(2016)绍兴市上虞区不动产权第0018769号	共同共有	百官街道大通水尚名都12幢1单元704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018769	18769	33100062872	2016/11/21 15:26:18	12	7	04	1	2018-10-25 13:40:50	2018-10-25 16:41:35
395	109644697	20161228-0044849	109644691	FDCQ	330604012051GB00708F00100072	浙(2017)绍兴市上虞区不动产权第0000591号	共同共有	百官街道大通水尚名都11幢2单元2108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000591	591	33001392192	2016/12/28 16:34:44	11	21	08	2	2018-10-25 13:40:50	2018-10-25 16:41:35
396	109165754	20161114-0034573	109165748	FDCQ	330604012051GB00708F00070032	浙(2016)绍兴市上虞区不动产权第0017846号	共同共有	百官街道大通水尚名都8幢1单元23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017846	17846	33100061470	2016/11/14 9:26:31	8	24	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
397	109117116	20161108-0033443	109117110	FDCQ	330604012051GB00708F00010064	浙(2016)绍兴市上虞区不动产权第0017567号	共同共有	百官街道大通水尚名都1幢2901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017567	17567	33100061321	2016/11/8 10:41:16	1	29	01		2018-10-25 13:40:50	2018-10-25 16:41:35
398	109165305	20161114-0034566	109165299	FDCQ	330604012051GB00708F00090101	浙(2016)绍兴市上虞区不动产权第0017858号	共同共有	百官街道大通水尚名都10幢501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017858	17858	33100061476	2016/11/14 9:11:22	10	5	01		2018-10-25 13:40:50	2018-10-25 16:41:35
399	109165572	20161114-0034569	109165566	FDCQ	330604012051GB00708F00090020	浙(2016)绍兴市上虞区不动产权第0018304号	共同共有	百官街道大通水尚名都10幢12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018304	18304	33100062239	2016/11/14 9:21:14	10	13	04		2018-10-25 13:40:50	2018-10-25 16:41:35
400	109572564	20161223-0043552	109572558	FDCQ	330604012051GB00708F00080111	浙(2016)绍兴市上虞区不动产权第0023085号	共同共有	百官街道大通水尚名都9幢2单元703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023085	23085	33001391389	2016/12/23 11:04:33	9	7	03	2	2018-10-25 13:40:50	2018-10-25 16:41:35
401	109189730	20161116-0035091	109189724	FDCQ	330604012051GB00708F00080003	浙(2016)绍兴市上虞区不动产权第0018322号	共同共有	百官街道大通水尚名都9幢1单元1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018322	18322	33100062247	2016/11/16 9:20:30	9	11	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
402	109232870	20161121-0036066	109232864	FDCQ	330604012051GB00708F00050047	浙(2016)绍兴市上虞区不动产权第0018652号	共同共有	百官街道大通水尚名都6幢2003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018652	18652	33100062846	2016/11/21 14:52:16	6	20	03		2018-10-25 13:40:50	2018-10-25 16:41:35
403	109214224	20161118-0035633	109214214	FDCQ	330604012051GB00708F00070086	浙(2016)绍兴市上虞区不动产权第0018746号	共同共有	百官街道大通水尚名都8幢2单元2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018746	18746	33100062863	2016/11/18 10:06:46	8	22	04	2	2018-10-25 13:40:50	2018-10-25 16:41:35
404	109199886	20161117-0035313	109199878	FDCQ	330604012051GB00708F00060046	浙(2016)绍兴市上虞区不动产权第0018543号	共同共有	百官街道大通水尚名都7幢1单元2002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018543	18543	33100062804	2016/11/17 9:02:24	7	20	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
405	109099101	20161107-0033091	109099095	FDCQ	330604012051GB00708F00060126	浙(2016)绍兴市上虞区不动产权第0017525号	共同共有	百官街道大通水尚名都7幢2单元1506室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017525	17525	33100061303	2016/11/7 9:55:49	7	15	06	2	2018-10-25 13:40:50	2018-10-25 16:41:35
406	109100468	20161107-0033102	109100459	FDCQ	330604012051GB00708F00050067	浙(2016)绍兴市上虞区不动产权第0017161号	共同共有	百官街道大通水尚名都6幢23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017161	17161	33100061032	2016/11/7 10:02:53	6	24	03		2018-10-25 13:40:50	2018-10-25 16:41:35
1093	109814964	20170104-0046353	109814959	FDCQ	330604012051GB00708F00010030	浙(2017)绍兴市上虞区不动产权第0001630号	单独所有	百官街道大通水尚名都1幢17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001630	1630	33001393391	2017/1/4 15:22:42	1	18	03		2018-10-25 13:40:52	2018-10-25 16:42:07
408	109220484	20161118-0035783	109220478	FDCQ	330604012051GB00708F00050058	浙(2016)绍兴市上虞区不动产权第0018586号	共同共有	百官街道大通水尚名都6幢2202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018586	18586	33100062433	2016/11/18 14:44:15	6	22	02		2018-10-25 13:40:50	2018-10-25 16:41:35
409	109482760	20161216-0041506	109482755	FDCQ	330604012051GB00708F00010028	浙(2016)绍兴市上虞区不动产权第0021846号	单独所有	百官街道大通水尚名都1幢17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021846	21846	33001390226	2016/12/16 11:08:03	1	18	01		2018-10-25 13:40:50	2018-10-25 16:41:35
410	109129507	20161109-0033737	109129502	FDCQ	330604012051GB00708F00030088	浙(2016)绍兴市上虞区不动产权第0017779号	单独所有	百官街道大通水尚名都3幢2904室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017779	17779	33100061447	2016/11/9 9:25:31	3	29	04		2018-10-25 13:40:50	2018-10-25 16:41:35
411	109129531	20161109-0033739	109129524	FDCQ	330604012051GB00708F00070067	浙(2016)绍兴市上虞区不动产权第0017712号	共同共有	百官街道大通水尚名都8幢2单元12B03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017712	17712	33100061367	2016/11/9 9:26:09	8	13	03	2	2018-10-25 13:40:50	2018-10-25 16:41:35
412	109185861	20161115-0035013	109185855	FDCQ	330604012051GB00708F00090117	浙(2016)绍兴市上虞区不动产权第0017898号	共同共有	百官街道大通水尚名都10幢901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017898	17898	33100062164	2016/11/15 15:35:23	10	9	01		2018-10-25 13:40:50	2018-10-25 16:41:35
413	109007664	20161027-0031297	109007658	FDCQ	330604012051GB00708F00070053	浙(2016)绍兴市上虞区不动产权第0016239号	共同共有	百官街道大通水尚名都8幢1单元701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016239	16239	33100060326	2016/10/27 14:46:28	8	7	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
414	109039661	20161101-0031997	109039655	FDCQ	330604012051GB00708F00040086	浙(2016)绍兴市上虞区不动产权第0016596号	共同共有	百官街道大通水尚名都5幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	资料详见1幢。	浙	绍兴市上虞区	2016	0016596	16596	33100060760	2016/11/1 9:38:08	5	6	02		2018-10-25 13:40:50	2018-10-25 16:41:36
415	109007231	20161027-0031288	109007223	FDCQ	330604012051GB00708F00070068	浙(2016)绍兴市上虞区不动产权第0016238号	共同共有	百官街道大通水尚名都8幢2单元12B04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016238	16238	33100060325	2016/10/27 14:36:06	8	13	04	2	2018-10-25 13:40:50	2018-10-25 16:41:36
416	109007647	20161027-0031294	109007641	FDCQ	330604012051GB00708F00030114	浙(2016)绍兴市上虞区不动产权第0016185号	共同共有	百官街道大通水尚名都3幢702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016185	16185	33100060026	2016/10/27 14:45:37	3	7	02		2018-10-25 13:40:50	2018-10-25 16:41:36
417	109008865	20161027-0031329	109008859	FDCQ	330604012051GB00708F00010044	浙(2016)绍兴市上虞区不动产权第0016172号	共同共有	百官街道大通水尚名都1幢2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016172	16172	33100060020	2016/10/27 15:20:24	1	22	02		2018-10-25 13:40:50	2018-10-25 16:41:36
418	109008782	20161027-0031328	109008776	FDCQ	330604012051GB00708F00010005	浙(2016)绍兴市上虞区不动产权第0016219号	共同共有	百官街道大通水尚名都1幢102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.98㎡/房屋建筑面积106.43㎡	4.98	106.43	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016219	16219	33100060319	2016/10/27 15:17:23	1	1	02		2018-10-25 13:40:50	2018-10-25 16:41:36
419	109180092	20161115-0034904	109180084	FDCQ	330604012051GB00708F00040095	浙(2016)绍兴市上虞区不动产权第0018291号	共同共有	百官街道大通水尚名都5幢803室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018291	18291	33100062319	2016/11/15 10:28:38	5	8	03		2018-10-25 13:40:50	2018-10-25 16:41:36
420	110145617	20170207-0052626	110145612	FDCQ	330604012051GB00708F00080077	浙(2017)绍兴市上虞区不动产权第0004966号	单独所有	百官街道大通水尚名都9幢2单元1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004966	4966	33001396656	2017/2/7 15:41:53	9	19	03	2	2018-10-25 13:40:50	2018-10-25 16:41:36
1107	112374050	20170726-0084853	112374045	FDCQ	330604012051GB00708F00090058	浙(2017)绍兴市上虞区不动产权第0020847号	单独所有	百官街道大通水尚名都10幢2202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0020847	20847	33001409214	2017/7/26 10:02:44	10	22	02		2018-10-25 13:40:52	2018-10-25 16:42:07
428	109232909	20161121-0036068	109232904	FDCQ	330604012051GB00708F00100077	浙(2016)绍兴市上虞区不动产权第0018734号	单独所有	百官街道大通水尚名都11幢2单元505室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018734	18734	33100062482	2016/11/21 14:52:29	11	5	05	2	2018-10-25 13:40:50	2018-10-25 16:42:53
429	109167580	20161114-0034613	109167574	FDCQ	330604012051GB00708F00060095	浙(2016)绍兴市上虞区不动产权第0018005号	共同共有	百官街道大通水尚名都7幢1单元803室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018005	18005	33100062039	2016/11/14 10:24:13	7	8	03	1	2018-10-25 13:40:50	2018-10-25 16:42:53
430	109252973	20161123-0036507	109252967	FDCQ	330604012051GB00708F00050072	浙(2016)绍兴市上虞区不动产权第0018920号	共同共有	百官街道大通水尚名都6幢2504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018920	18920	33100063230	2016/11/23 10:36:03	6	25	04		2018-10-25 13:40:50	2018-10-25 16:42:53
431	109300550	20161129-0037533	109300545	FDCQ	330604012051GB00708F00060048	浙(2016)绍兴市上虞区不动产权第0019470号	单独所有	百官街道大通水尚名都7幢1单元2004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019470	19470	33100063742	2016/11/29 14:29:23	7	20	04	1	2018-10-25 13:40:50	2018-10-25 16:42:53
432	109285891	20161128-0037227	109285885	FDCQ	330604012051GB00708F00100005	浙(2016)绍兴市上虞区不动产权第0019231号	共同共有	百官街道大通水尚名都11幢1单元1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019231	19231	33100063097	2016/11/28 10:58:09	11	11	01	1	2018-10-25 13:40:50	2018-10-25 16:42:53
422	110252051	20170217-0054477	110252045	FDCQ	330604012051GB00708F00010078	浙(2017)绍兴市上虞区不动产权第0005774号	共同共有	百官街道大通水尚名都1幢3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005774	5774	33001397381	2017/2/17 15:03:51	1	4	03		2018-10-25 13:40:50	2018-10-25 16:41:36
423	109128770	20161109-0033724	109128764	FDCQ	330604012051GB00708F00100075	浙(2016)绍兴市上虞区不动产权第0017416号	共同共有	百官街道大通水尚名都11幢2单元307室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017416	17416	33100061220	2016/11/9 9:08:19	11	3	07	2	2018-10-25 13:40:50	2018-10-25 16:41:36
424	109124362	20161108-0033634	109124357	FDCQ	330604012051GB00708F00040085	浙(2016)绍兴市上虞区不动产权第0017294号	单独所有	百官街道大通水尚名都5幢601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017294	17294	33100061084	2016/11/8 15:28:03	5	6	01		2018-10-25 13:40:50	2018-10-25 16:41:36
425	109464250	20161214-0041080	109464244	FDCQ	330604012051GB00708F00060137	浙(2016)绍兴市上虞区不动产权第0021387号	共同共有	百官街道大通水尚名都7幢2单元17A05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021387	21387	33100065180	2016/12/14 15:15:48	7	18	05	2	2018-10-25 13:40:50	2018-10-25 16:41:36
426	109231812	20161121-0036038	109231807	FDCQ	330604012051GB00708F00080056	浙(2016)绍兴市上虞区不动产权第0018738号	单独所有	百官街道大通水尚名都9幢1单元802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018738	18738	33100062484	2016/11/21 14:24:27	9	8	02	1	2018-10-25 13:40:50	2018-10-25 16:41:36
433	109185457	20161115-0035001	109185451	FDCQ	330604012051GB00708F00020015	浙(2016)绍兴市上虞区不动产权第0018176号	共同共有	百官街道大通水尚名都2幢1601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018176	18176	33100062095	2016/11/15 15:24:44	2	16	01		2018-10-25 13:40:50	2018-10-25 16:42:53
434	109088109	20161104-0032872	109088103	FDCQ	330604012051GB00708F00030110	浙(2016)绍兴市上虞区不动产权第0017010号	共同共有	百官街道大通水尚名都3幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017010	17010	33100061012	2016/11/4 10:36:10	3	6	02		2018-10-25 13:40:50	2018-10-25 16:42:53
1121	110097636	20170124-0051521	110097630	FDCQ	330604012051GB00708F00120010	浙(2017)绍兴市上虞区不动产权第0004470号	共同共有	百官街道大通水尚名都12幢1单元12A02室	国有建设用地使用权/房屋（构筑物）所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004470	4470	33001396037	2017/1/24 15:15:27	12	13	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
436	109189522	20161116-0035090	109189516	FDCQ	330604012051GB00708F00070001	浙(2016)绍兴市上虞区不动产权第0018359号	共同共有	百官街道大通水尚名都8幢1单元1001室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018359	18359	33100062344	2016/11/16 9:14:07	8	10	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
437	109102794	20161107-0033108	109102788	FDCQ	330604012051GB00708F00070058	浙(2016)绍兴市上虞区不动产权第0017420号	共同共有	百官街道大通水尚名都8幢1单元902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017420	17420	33100061169	2016/11/7 10:11:11	8	9	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
438	109642579	20161228-0044805	109642573	FDCQ	330604012051GB00708F00010088	浙(2017)绍兴市上虞区不动产权第0001227号	共同共有	百官街道大通水尚名都1幢801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001227	1227	33001393342	2016/12/28 15:43:05	1	8	01		2018-10-25 13:40:50	2018-10-25 16:41:40
439	109232504	20161121-0036056	109232498	FDCQ	330604012051GB00708F00080106	浙(2016)绍兴市上虞区不动产权第0018760号	共同共有	百官街道大通水尚名都9幢2单元3A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018760	18760	33100062869	2016/11/21 14:42:56	9	4	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
440	109580374	20161223-0043709	109580368	FDCQ	330604012051GB00708F00060193	浙(2016)绍兴市上虞区不动产权第0023107号	共同共有	百官街道大通水尚名都7幢2单元805室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023107	23107	33001391802	2016/12/23 15:52:04	7	8	05	2	2018-10-25 13:40:50	2018-10-25 16:41:40
441	109595201	20161226-0044047	109595194	FDCQ	330604012051GB00708F00090084	浙(2017)绍兴市上虞区不动产权第0000113号	共同共有	百官街道大通水尚名都10幢2804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000113	113	33001392242	2016/12/26 14:39:51	10	28	04		2018-10-25 13:40:50	2018-10-25 16:41:40
442	109161563	20161111-0034485	109161557	FDCQ	330604012051GB00708F00100006	浙(2016)绍兴市上虞区不动产权第0017985号	共同共有	百官街道大通水尚名都11幢1单元1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017985	17985	33100062032	2016/11/11 15:55:46	11	11	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
443	109103698	20161107-0033124	109103692	FDCQ	330604012051GB00708F00120005	浙(2016)绍兴市上虞区不动产权第0017183号	共同共有	百官街道大通水尚名都12幢1单元1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017183	17183	33100061041	2016/11/7 10:28:49	12	11	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
444	109133405	20161109-0033824	109133399	FDCQ	330604012051GB00708F00100060	浙(2016)绍兴市上虞区不动产权第0017786号	共同共有	百官街道大通水尚名都11幢2单元1508室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017786	17786	33100061451	2016/11/9 11:18:51	11	15	08	2	2018-10-25 13:40:50	2018-10-25 16:41:40
445	109171824	20161114-0034687	109171819	FDCQ	330604012051GB00708F00090025	浙(2016)绍兴市上虞区不动产权第0018114号	单独所有	百官街道大通水尚名都10幢1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018114	18114	33100062070	2016/11/14 14:41:58	10	15	01		2018-10-25 13:40:50	2018-10-25 16:41:40
446	109171758	20161114-0034686	109171752	FDCQ	330604012051GB00708F00080110	浙(2016)绍兴市上虞区不动产权第0018012号	共同共有	百官街道大通水尚名都9幢2单元604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018012	18012	33100062042	2016/11/14 14:39:56	9	6	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
447	109172112	20161114-0034694	109172106	FDCQ	330604012051GB00708F00090013	浙(2016)绍兴市上虞区不动产权第0017855号	共同共有	百官街道大通水尚名都10幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017855	17855	33100061474	2016/11/14 14:50:38	10	12	01		2018-10-25 13:40:50	2018-10-25 16:41:40
448	109185470	20161115-0035003	109185465	FDCQ	330604012051GB00708F00070005	浙(2016)绍兴市上虞区不动产权第0018212号	单独所有	百官街道大通水尚名都8幢1单元1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018212	18212	33100062189	2016/11/15 15:25:36	8	12	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
1135	110452964	20170308-0057225	110452959	FDCQ	330604012051GB00708F00100030	浙(2017)绍兴市上虞区不动产权第0007669号	单独所有	百官街道大通水尚名都11幢1单元302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0007669	7669	33001398802	2017/3/8 14:58:16	11	3	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
450	216628032	20180222-0014600	216628025	FDCQ	330604012051GB00708F00050041	浙(2018)绍兴市上虞区不动产权第0012755号	共同共有	百官街道大通水尚名都6幢1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	遗失补证	浙	绍兴市上虞区	2018	0012755	12755	33003324794	2018/2/22 11:16:10	6	19	01		2018-10-25 13:40:50	2018-10-25 16:41:40
451	111082184	20170418-0064532	111082178	FDCQ	330604012051GB00708F00090100	浙(2017)绍兴市上虞区不动产权第0011324号	共同共有	百官街道大通水尚名都10幢3A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011324	11324	33001401517	2017/4/18 14:49:07	10	4	04		2018-10-25 13:40:50	2018-10-25 16:41:40
452	110240228	20170216-0054222	110240222	FDCQ	330604012051GB00708F00010020	浙(2017)绍兴市上虞区不动产权第0005662号	共同共有	百官街道大通水尚名都1幢1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005662	5662	33001397473	2017/2/16 15:02:10	1	15	02		2018-10-25 13:40:50	2018-10-25 16:41:40
453	110240228	20170216-0054222	110240222	FDCQ	330604012051GB00708F00010020	浙(2017)绍兴市上虞区不动产权第0005662号	共同共有	百官街道大通水尚名都1幢1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005662	5662	33001397473	2017/2/16 15:02:10	1	15	02		2018-10-25 13:40:50	2018-10-25 16:41:40
454	109468463	20161215-0041179	109468457	FDCQ	330604012051GB00708F00080083	浙(2016)绍兴市上虞区不动产权第0021818号	共同共有	百官街道大通水尚名都9幢2单元2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021818	21818	33001390123	2016/12/15 9:34:28	9	21	03	2	2018-10-25 13:40:50	2018-10-25 16:41:40
455	109095421	20161104-0033012	109095415	FDCQ	330604012051GB00708F00070049	浙(2016)绍兴市上虞区不动产权第0017014号	共同共有	百官街道大通水尚名都8幢1单元501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017014	17014	33100061015	2016/11/4 16:09:03	8	5	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
456	109129930	20161109-0033749	109129924	FDCQ	330604012051GB00708F00080097	浙(2016)绍兴市上虞区不动产权第0017759号	共同共有	百官街道大通水尚名都9幢2单元2803室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017759	17759	33100061380	2016/11/9 9:40:06	9	28	03	2	2018-10-25 13:40:50	2018-10-25 16:41:40
457	109256474	20161123-0036573	109256468	FDCQ	330604012051GB00708F00060110	浙(2016)绍兴市上虞区不动产权第0018947号	共同共有	百官街道大通水尚名都7幢2单元1106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018947	18947	33100063060	2016/11/23 14:24:13	7	11	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
458	109256496	20161123-0036574	109256490	FDCQ	330604012051GB00708F00060081	浙(2016)绍兴市上虞区不动产权第0018943号	共同共有	百官街道大通水尚名都7幢1单元501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018943	18943	33100063061	2016/11/23 14:24:26	7	5	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
459	109338063	20161202-0038333	109338057	FDCQ	330604012051GB00708F00060141	浙(2016)绍兴市上虞区不动产权第0019938号	共同共有	百官街道大通水尚名都7幢2单元1905室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019938	19938	33100064164	2016/12/2 15:00:40	7	19	05	2	2018-10-25 13:40:50	2018-10-25 16:41:40
460	109258827	20161123-0036621	109258822	FDCQ	330604012051GB00708F00040030	浙(2016)绍兴市上虞区不动产权第0018761号	单独所有	百官街道大通水尚名都5幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018761	18761	33100062496	2016/11/23 15:51:01	5	16	02		2018-10-25 13:40:50	2018-10-25 16:41:40
461	109128356	20161109-0033712	109128350	FDCQ	330604012051GB00708F00100002	浙(2016)绍兴市上虞区不动产权第0017467号	共同共有	百官街道大通水尚名都11幢1单元102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017467	17467	33100061240	2016/11/9 8:53:50	11	1	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
462	109246147	20161122-0036364	109246141	FDCQ	330604012051GB00708F00050076	浙(2016)绍兴市上虞区不动产权第0018860号	共同共有	百官街道大通水尚名都6幢304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018860	18860	33100063207	2016/11/22 14:48:10	6	3	04		2018-10-25 13:40:50	2018-10-25 16:41:40
1149	215317802	20171205-0013052	215317795	FDCQ	330604012051GB00708F00050034	浙(2017)绍兴市上虞区不动产权第0032304号	共同共有	百官街道大通水尚名都6幢1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0032304	32304	33001416491	2017/12/5 15:31:38	6	17	02		2018-10-25 13:40:52	2018-10-25 16:42:08
464	109124106	20161108-0033626	109124100	FDCQ	330604012051GB00708F00030053	浙(2016)绍兴市上虞区不动产权第0017577号	共同共有	百官街道大通水尚名都3幢2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017577	17577	33100061325	2016/11/8 15:20:45	3	21	01		2018-10-25 13:40:50	2018-10-25 16:41:40
465	109167296	20161114-0034610	109167290	FDCQ	330604012051GB00708F00060113	浙(2016)绍兴市上虞区不动产权第0017848号	共同共有	百官街道大通水尚名都7幢2单元1205室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017848	17848	33100061471	2016/11/14 10:16:06	7	12	05	2	2018-10-25 13:40:50	2018-10-25 16:41:40
466	109124130	20161108-0033624	109124124	FDCQ	330604012051GB00708F00090014	浙(2016)绍兴市上虞区不动产权第0017651号	共同共有	百官街道大通水尚名都10幢1202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017651	17651	33100061347	2016/11/8 15:21:06	10	12	02		2018-10-25 13:40:50	2018-10-25 16:41:40
467	109167787	20161114-0034620	109167777	FDCQ	330604012051GB00708F00040027	浙(2016)绍兴市上虞区不动产权第0017813号	共同共有	百官街道大通水尚名都5幢1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017813	17813	33100061456	2016/11/14 10:28:07	5	15	03		2018-10-25 13:40:50	2018-10-25 16:41:40
468	109461755	20161212-0040120	109461749	FDCQ	330604012051GB00708F00060198	浙(2016)绍兴市上虞区不动产权第0021013号	共同共有	百官街道大通水尚名都7幢2单元906室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021013	21013	33100065243	2016/12/14 14:28:20	7	9	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
469	111198365	20170426-0066205	111198359	FDCQ	330604012051GB00708F00080082	浙(2017)绍兴市上虞区不动产权第0011949号	共同共有	百官街道大通水尚名都9幢2单元204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011949	11949	33001402403	2017/4/26 16:25:51	9	2	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
470	111198365	20170426-0066205	111198359	FDCQ	330604012051GB00708F00080082	浙(2017)绍兴市上虞区不动产权第0011949号	共同共有	百官街道大通水尚名都9幢2单元204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011949	11949	33001402403	2017/4/26 16:25:51	9	2	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
471	109070348	20161103-0032572	109070342	FDCQ	330604012051GB00708F00070051	浙(2016)绍兴市上虞区不动产权第0016882号	共同共有	百官街道大通水尚名都8幢1单元601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016882	16882	33100060883	2016/11/3 9:53:03	8	6	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
472	109063147	20161102-0032435	109063141	FDCQ	330604012051GB00708F00060023	浙(2016)绍兴市上虞区不动产权第0016735号	共同共有	百官街道大通水尚名都7幢1单元12B03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016735	16735	33100060834	2016/11/2 14:30:35	7	13	03	1	2018-10-25 13:40:50	2018-10-25 16:41:40
473	109116455	20161108-0033428	109116449	FDCQ	330604012051GB00708F00070092	浙(2016)绍兴市上虞区不动产权第0017612号	共同共有	百官街道大通水尚名都8幢2单元2504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017612	17612	33100061338	2016/11/8 10:23:40	8	25	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
474	109154402	20161111-0034310	109154395	FDCQ	330604012051GB00708F00020053	浙(2016)绍兴市上虞区不动产权第0017872号	共同共有	百官街道大通水尚名都2幢901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017872	17872	33100062007	2016/11/11 10:08:21	2	9	01		2018-10-25 13:40:50	2018-10-25 16:41:40
475	109154487	20161111-0034312	109154481	FDCQ	330604012051GB00708F00020020	浙(2016)绍兴市上虞区不动产权第0018042号	共同共有	百官街道大通水尚名都2幢17A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018042	18042	33100062128	2016/11/11 10:13:35	2	18	02		2018-10-25 13:40:50	2018-10-25 16:41:40
476	216634772	20180223-0014736	216634767	FDCQ	330604012051GB00708F00040072	浙(2018)绍兴市上虞区不动产权第0010270号	单独所有	百官街道大通水尚名都5幢2504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0010270	10270	33003320959	2018/2/23 14:45:16	5	25	04		2018-10-25 13:40:50	2018-10-25 16:41:40
1163	111097020	20170419-0064800	111097014	FDCQ	330604012051GB00708F00060187	浙(2017)绍兴市上虞区不动产权第0011326号	共同共有	百官街道大通水尚名都7幢2单元607室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011326	11326	33001401518	2017/4/19 16:14:11	7	6	07	2	2018-10-25 13:40:53	2018-10-25 16:42:12
479	109095210	20161102-0032449	109095205	FDCQ	330604012051GB00708F00050043	浙(2016)绍兴市上虞区不动产权第0016752号	单独所有	百官街道大通水尚名都6幢1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016752	16752	33100060842	2016/11/4 15:54:38	6	19	03		2018-10-25 13:40:50	2018-10-25 16:41:40
480	109095201	20161102-0032316	109095196	FDCQ	330604012051GB00708F00050083	浙(2016)绍兴市上虞区不动产权第0016749号	单独所有	百官街道大通水尚名都6幢503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016749	16749	33100060841	2016/11/4 15:54:20	6	5	03		2018-10-25 13:40:50	2018-10-25 16:41:40
481	109095219	20161102-0032430	109095214	FDCQ	330604012051GB00708F00060067	浙(2016)绍兴市上虞区不动产权第0016754号	单独所有	百官街道大通水尚名都7幢1单元23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016754	16754	33100060843	2016/11/4 15:54:52	7	24	03	1	2018-10-25 13:40:50	2018-10-25 16:41:40
482	109095230	20161102-0032362	109095225	FDCQ	330604012051GB00708F00070096	浙(2016)绍兴市上虞区不动产权第0016756号	单独所有	百官街道大通水尚名都8幢2单元2704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016756	16756	33100060844	2016/11/4 15:55:17	8	27	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
483	109095681	20161104-0033020	109095676	FDCQ	330604012051GB00708F00080102	浙(2016)绍兴市上虞区不动产权第0016993号	单独所有	百官街道大通水尚名都9幢2单元3004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016993	16993	33100061006	2016/11/4 16:32:50	9	30	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
484	109042629	20161101-0032059	109042621	FDCQ	330604012051GB00708F00020032	浙(2016)绍兴市上虞区不动产权第0016572号	共同共有	百官街道大通水尚名都2幢2302室	国有建设用地使用权/房屋（构筑物）所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016572	16572	33100060438	2016/11/1 10:51:16	2	23	02		2018-10-25 13:40:50	2018-10-25 16:41:40
485	109114009	20161108-0033379	109114003	FDCQ	330604012051GB00708F00040013	浙(2016)绍兴市上虞区不动产权第0017295号	共同共有	百官街道大通水尚名都5幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017295	17295	33100061085	2016/11/8 9:27:04	5	12	01		2018-10-25 13:40:50	2018-10-25 16:41:40
486	109118149	20161108-0033464	109118143	FDCQ	330604012051GB00708F00030060	浙(2016)绍兴市上虞区不动产权第0017575号	共同共有	百官街道大通水尚名都3幢2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017575	17575	33100061324	2016/11/8 11:08:06	3	22	04		2018-10-25 13:40:50	2018-10-25 16:41:40
487	109213209	20161118-0035616	109213203	FDCQ	330604012051GB00708F00070076	浙(2016)绍兴市上虞区不动产权第0018531号	共同共有	百官街道大通水尚名都8幢2单元17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018531	18531	33100062298	2016/11/18 9:45:47	8	18	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
488	109223419	20161118-0035859	109223413	FDCQ	330604012051GB00708F00080115	浙(2016)绍兴市上虞区不动产权第0017973号	共同共有	百官街道大通水尚名都9幢2单元903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017973	17973	33100062103	2016/11/18 16:08:41	9	9	03	2	2018-10-25 13:40:50	2018-10-25 16:41:40
489	109132329	20161109-0033796	109132323	FDCQ	330604012051GB00708F00100059	浙(2016)绍兴市上虞区不动产权第0017787号	共同共有	百官街道大通水尚名都11幢2单元1507室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017787	17787	33100061452	2016/11/9 10:48:18	11	15	07	2	2018-10-25 13:40:50	2018-10-25 16:41:40
490	109222564	20161118-0035837	109222557	FDCQ	330604012051GB00708F00040028	浙(2016)绍兴市上虞区不动产权第0018778号	共同共有	百官街道大通水尚名都5幢1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018778	18778	33100062875	2016/11/18 15:45:30	5	15	04		2018-10-25 13:40:50	2018-10-25 16:41:40
1177	111533697	20170523-0071604	111533691	FDCQ	330604012051GB00708F00050061	浙(2017)绍兴市上虞区不动产权第0014354号	共同共有	百官街道大通水尚名都6幢2301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0014354	14354	33001403920	2017/5/23 15:27:40	6	23	01		2018-10-25 13:40:53	2018-10-25 16:42:13
492	109233534	20161121-0036086	109233528	FDCQ	330604012051GB00708F00120035	浙(2016)绍兴市上虞区不动产权第0018793号	共同共有	百官街道大通水尚名都12幢1单元503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018793	18793	33100062882	2016/11/21 15:10:26	12	5	03	1	2018-10-25 13:40:50	2018-10-25 16:41:40
493	108971780	20161024-0030523	108971774	FDCQ	330604012051GB00708F00060071	浙(2016)绍兴市上虞区不动产权第0016259号	共同共有	百官街道大通水尚名都7幢1单元2503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016259	16259	33100060352	2016/10/24 10:31:01	7	25	03	1	2018-10-25 13:40:50	2018-10-25 16:41:40
494	108976298	20161024-0030610	108976292	FDCQ	330604012051GB00708F00010074	浙(2016)绍兴市上虞区不动产权第0016039号	共同共有	百官街道大通水尚名都1幢3102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016039	16039	33100059974	2016/10/24 14:42:00	1	31	02		2018-10-25 13:40:50	2018-10-25 16:41:40
495	108970599	20161024-0030494	108970593	FDCQ	330604012051GB00708F00100040	浙(2016)绍兴市上虞区不动产权第0016204号	共同共有	百官街道大通水尚名都11幢1单元704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让	浙	绍兴市上虞区	2016	0016204	16204	33100060034	2016/10/24 10:01:53	11	7	04	1	2018-10-25 13:40:50	2018-10-25 16:41:40
496	109116756	20161108-0033436	109116751	FDCQ	330604012051GB00708F00080098	浙(2016)绍兴市上虞区不动产权第0017643号	单独所有	百官街道大通水尚名都9幢2单元2804室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017643	17643	33100061408	2016/11/8 10:31:05	9	28	04	2	2018-10-25 13:40:50	2018-10-25 16:41:40
497	109135652	20161109-0033868	109135646	FDCQ	330604012051GB00708F00060145	浙(2016)绍兴市上虞区不动产权第0017454号	共同共有	百官街道大通水尚名都7幢2单元2005室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017454	17454	33100061236	2016/11/9 14:17:32	7	20	05	2	2018-10-25 13:40:50	2018-10-25 16:41:40
498	109136069	20161109-0033880	109136063	FDCQ	330604012051GB00708F00090047	浙(2016)绍兴市上虞区不动产权第0017788号	共同共有	百官街道大通水尚名都10幢2003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017788	17788	33100061385	2016/11/9 14:31:11	10	20	03		2018-10-25 13:40:50	2018-10-25 16:41:40
499	109008281	20161027-0031308	109008275	FDCQ	330604012051GB00708F00070044	浙(2016)绍兴市上虞区不动产权第0016278号	共同共有	百官街道大通水尚名都8幢1单元3002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016278	16278	33100060335	2016/10/27 15:01:30	8	30	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
500	109008472	20161027-0031319	109008466	FDCQ	330604012051GB00708F00010093	浙(2016)绍兴市上虞区不动产权第0016250号	共同共有	百官街道大通水尚名都1幢903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016250	16250	33100060045	2016/10/27 15:06:39	1	9	03		2018-10-25 13:40:50	2018-10-25 16:41:40
501	109047214	20161101-0032146	109047208	FDCQ	330604012051GB00708F00010027	浙(2016)绍兴市上虞区不动产权第0016748号	共同共有	百官街道大通水尚名都1幢1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016748	16748	33100060797	2016/11/1 14:41:35	1	17	03		2018-10-25 13:40:50	2018-10-25 16:41:40
502	109159015	20161111-0034419	109159009	FDCQ	330604012051GB00708F00100018	浙(2016)绍兴市上虞区不动产权第0018256号	共同共有	百官街道大通水尚名都11幢1单元1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018256	18256	33100062213	2016/11/11 14:24:23	11	17	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
503	109159156	20161111-0034422	109159150	FDCQ	330604012051GB00708F00100008	浙(2016)绍兴市上虞区不动产权第0018000号	共同共有	百官街道大通水尚名都11幢1单元1104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018000	18000	33100062109	2016/11/11 14:30:41	11	11	04	1	2018-10-25 13:40:50	2018-10-25 16:41:40
504	109159194	20161111-0034424	109159188	FDCQ	330604012051GB00708F00090105	浙(2016)绍兴市上虞区不动产权第0017718号	共同共有	百官街道大通水尚名都10幢601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017718	17718	33100061431	2016/11/11 14:31:43	10	6	01		2018-10-25 13:40:50	2018-10-25 16:41:40
1186	215854818	20180109-0002115	215854812	FDCQ	330604012051GB00708F00080055	浙(2018)绍兴市上虞区不动产权第0001208号	共同共有	百官街道大通水尚名都9幢1单元801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0001208	1208	33003114535	2018/1/9 14:43:42	9	8	01	1	2018-10-25 13:40:53	2018-10-25 16:42:13
506	109049887	20161101-0032210	109049881	FDCQ	330604012051GB00708F00050059	浙(2016)绍兴市上虞区不动产权第0016789号	共同共有	百官街道大通水尚名都6幢2203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016789	16789	33100060909	2016/11/1 15:42:48	6	22	03		2018-10-25 13:40:50	2018-10-25 16:41:40
507	109084506	20161104-0032804	109084500	FDCQ	330604012051GB00708F00030117	浙(2016)绍兴市上虞区不动产权第0017335号	共同共有	百官街道大通水尚名都3幢801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017335	17335	33100061144	2016/11/4 8:52:45	3	8	01		2018-10-25 13:40:50	2018-10-25 16:41:40
508	109084517	20161101-0031999	109084512	FDCQ	330604012051GB00708F00030015	浙(2016)绍兴市上虞区不动产权第0016608号	单独所有	百官街道大通水尚名都3幢1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016608	16608	33100060804	2016/11/4 8:52:50	3	12	03		2018-10-25 13:40:50	2018-10-25 16:41:40
509	109125246	20161108-0033657	109125240	FDCQ	330604012051GB00708F00090069	浙(2016)绍兴市上虞区不动产权第0017319号	共同共有	百官街道大通水尚名都10幢2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017319	17319	33100061096	2016/11/8 15:50:40	10	25	01		2018-10-25 13:40:50	2018-10-25 16:41:40
510	109126043	20161108-0033673	109126037	FDCQ	330604012051GB00708F00010014	浙(2016)绍兴市上虞区不动产权第0017331号	共同共有	百官街道大通水尚名都1幢12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017331	17331	33100061203	2016/11/8 16:18:00	1	13	02		2018-10-25 13:40:50	2018-10-25 16:41:40
511	109125026	20161108-0033646	109125021	FDCQ	330604012051GB00708F00040067	浙(2016)绍兴市上虞区不动产权第0017540号	单独所有	百官街道大通水尚名都5幢23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017540	17540	33100061310	2016/11/8 15:46:02	5	24	03		2018-10-25 13:40:50	2018-10-25 16:41:40
512	109238586	20161122-0036177	109238580	FDCQ	330604012051GB00708F00080025	浙(2016)绍兴市上虞区不动产权第0018641号	共同共有	百官街道大通水尚名都9幢1单元2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018641	18641	33100062452	2016/11/22 9:58:54	9	21	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
513	108967605	20161021-0030436	108967599	FDCQ	330604012051GB00708F00040098	浙(2016)绍兴市上虞区不动产权第0016265号	共同共有	百官街道大通水尚名都5幢902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016265	16265	33100060332	2016/10/21 15:55:51	5	9	02		2018-10-25 13:40:50	2018-10-25 16:41:40
514	108967324	20161021-0030431	108967318	FDCQ	330604012051GB00708F00010017	浙(2016)绍兴市上虞区不动产权第0016043号	共同共有	百官街道大通水尚名都1幢12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016043	16043	33100059976	2016/10/21 15:46:37	1	13	02		2018-10-25 13:40:50	2018-10-25 16:41:40
515	108991447	20161026-0030945	108991442	FDCQ	330604012051GB00708F00070061	浙(2016)绍兴市上虞区不动产权第0016297号	单独所有	百官街道大通水尚名都8幢2单元1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016297	16297	33100060342	2016/10/26 9:13:11	8	11	03	2	2018-10-25 13:40:50	2018-10-25 16:41:40
516	108992513	20161026-0030972	108992508	FDCQ	330604012051GB00708F00010035	浙(2016)绍兴市上虞区不动产权第0016076号	单独所有	百官街道大通水尚名都1幢2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016076	16076	33100060278	2016/10/26 9:45:09	1	20	02		2018-10-25 13:40:50	2018-10-25 16:41:40
517	108993223	20161026-0030988	108993217	FDCQ	330604012051GB00708F00060189	浙(2016)绍兴市上虞区不动产权第0016119号	共同共有	百官街道大通水尚名都7幢2单元705室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016119	16119	33100059995	2016/10/26 10:07:47	7	7	05	2	2018-10-25 13:40:50	2018-10-25 16:41:40
518	108978959	20161024-0030675	108978953	FDCQ	330604012051GB00708F00070101	浙(2016)绍兴市上虞区不动产权第0016207号	共同共有	百官街道大通水尚名都8幢2单元3003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016207	16207	33100060036	2016/10/24 16:18:16	8	30	03	2	2018-10-25 13:40:50	2018-10-25 16:41:40
1191	217843909	20180509-0033769	217843903	FDCQ	330604012051GB00708F00010029	浙(2018)绍兴市上虞区不动产权第0024598号	共同共有	百官街道大通水尚名都1幢17A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0024598	24598	33003330357	2018/5/9 15:37:18	1	18	02		2018-10-25 13:40:53	2018-10-25 16:42:13
520	109095802	20161101-0031964	109095796	FDCQ	330604012051GB00708F00040059	浙(2016)绍兴市上虞区不动产权第0016591号	共同共有	百官街道大通水尚名都5幢2203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016591	16591	33100060758	2016/11/4 16:42:22	5	22	03		2018-10-25 13:40:50	2018-10-25 16:41:40
521	109097018	20161107-0033043	109097012	FDCQ	330604012051GB00708F00060166	浙(2016)绍兴市上虞区不动产权第0017461号	共同共有	百官街道大通水尚名都7幢2单元23A06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017461	17461	33100061188	2016/11/7 9:12:31	7	24	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
522	109106560	20161107-0033175	109106554	FDCQ	330604012051GB00708F00060041	浙(2016)绍兴市上虞区不动产权第0017523号	共同共有	百官街道大通水尚名都7幢1单元1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017523	17523	33100061301	2016/11/7 11:40:07	7	19	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
523	109128921	20161109-0033726	109128915	FDCQ	330604012051GB00708F00060182	浙(2016)绍兴市上虞区不动产权第0017683号	共同共有	百官街道大通水尚名都7幢2单元506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017683	17683	33100061357	2016/11/9 9:11:48	7	5	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
524	109128932	20161109-0033727	109128926	FDCQ	330604012051GB00708F00120051	浙(2016)绍兴市上虞区不动产权第0017780号	共同共有	百官街道大通水尚名都12幢2单元1107室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017780	17780	33100061448	2016/11/9 9:11:57	12	11	07	2	2018-10-25 13:40:50	2018-10-25 16:41:40
525	109129980	20161109-0033750	109129974	FDCQ	330604012051GB00708F00050055	浙(2016)绍兴市上虞区不动产权第0017432号	共同共有	百官街道大通水尚名都6幢2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017432	17432	33100061226	2016/11/9 9:41:55	6	21	03		2018-10-25 13:40:50	2018-10-25 16:41:40
526	109164865	20161110-0034053	109164859	FDCQ	330604012051GB00708F00100055	浙(2016)绍兴市上虞区不动产权第0017547号	共同共有	百官街道大通水尚名都11幢2单元12A07室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017547	17547	33100061277	2016/11/14 8:41:22	11	13	07	2	2018-10-25 13:40:50	2018-10-25 16:41:40
527	109164899	20161110-0034145	109164894	FDCQ	330604012051GB00708F00100017	浙(2016)绍兴市上虞区不动产权第0017546号	单独所有	百官街道大通水尚名都11幢1单元1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017546	17546	33100061276	2016/11/14 8:44:01	11	17	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
528	109223520	20161118-0035860	109223515	FDCQ	330604012051GB00708F00120071	浙(2016)绍兴市上虞区不动产权第0018508号	单独所有	百官街道大通水尚名都12幢2单元2107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018508	18508	33100062395	2016/11/18 16:11:52	12	21	07	2	2018-10-25 13:40:50	2018-10-25 16:41:40
529	109225144	20161121-0035901	109225138	FDCQ	330604012051GB00708F00100070	浙(2016)绍兴市上虞区不动产权第0018675号	共同共有	百官街道大通水尚名都11幢2单元2106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018675	18675	33100062467	2016/11/21 9:12:38	11	21	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
530	109249880	20161122-0036442	109249873	FDCQ	330604012051GB00708F00030075	浙(2016)绍兴市上虞区不动产权第0018814号	共同共有	百官街道大通水尚名都3幢2603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象.五年内限制转让	浙	绍兴市上虞区	2016	0018814	18814	33100063017	2016/11/22 16:40:04	3	26	03		2018-10-25 13:40:50	2018-10-25 16:41:40
531	108977961	20161024-0030652	108977955	FDCQ	330604012051GB00708F00100029	浙(2016)绍兴市上虞区不动产权第0016059号	共同共有	百官街道大通水尚名都11幢1单元301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016059	16059	33100059985	2016/10/24 15:32:22	11	3	01	1	2018-10-25 13:40:50	2018-10-25 16:41:40
532	109047678	20161101-0032164	109047672	FDCQ	330604012051GB00708F00030003	浙(2016)绍兴市上虞区不动产权第0016788号	共同共有	百官街道大通水尚名都3幢1003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016788	16788	33100060859	2016/11/1 14:54:08	3	10	03		2018-10-25 13:40:50	2018-10-25 16:41:40
535	109062988	20161102-0032432	109062982	FDCQ	330604012051GB00708F00060140	浙(2016)绍兴市上虞区不动产权第0016897号	共同共有	百官街道大通水尚名都7幢2单元17A08室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016897	16897	33100060931	2016/11/2 14:27:33	7	18	08	2	2018-10-25 13:40:50	2018-10-25 16:42:53
536	109063372	20161102-0032437	109063366	FDCQ	330604012051GB00708F00050090	浙(2016)绍兴市上虞区不动产权第0017090号	共同共有	百官街道大通水尚名都6幢702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017090	17090	33100060967	2016/11/2 14:36:18	6	7	02		2018-10-25 13:40:50	2018-10-25 16:42:53
537	109063083	20161102-0032433	109063077	FDCQ	330604012051GB00708F00080079	浙(2016)绍兴市上虞区不动产权第0016900号	共同共有	百官街道大通水尚名都9幢2单元2003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016900	16900	33100060932	2016/11/2 14:28:57	9	20	03	2	2018-10-25 13:40:50	2018-10-25 16:42:53
538	109064791	20161102-0032468	109064785	FDCQ	330604012051GB00708F00070091	浙(2016)绍兴市上虞区不动产权第0017084号	共同共有	百官街道大通水尚名都8幢2单元2503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017084	17084	33100060963	2016/11/2 15:08:32	8	25	03	2	2018-10-25 13:40:50	2018-10-25 16:42:53
534	109047915	20161101-0032168	109047910	FDCQ	330604012051GB00708F00060170	浙(2016)绍兴市上虞区不动产权第0016587号	单独所有	百官街道大通水尚名都7幢2单元2506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016587	16587	33100060756	2016/11/1 15:00:54	7	25	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
544	109009518	20161027-0031343	109009512	FDCQ	330604012051GB00708F00020035	浙(2016)绍兴市上虞区不动产权第0016183号	共同共有	百官街道大通水尚名都2幢2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016183	16183	33100060025	2016/10/27 15:37:15	2	25	01		2018-10-25 13:40:50	2018-10-25 16:41:44
545	109011844	20161025-0030868	109011838	FDCQ	330604012051GB00708F00050044	浙(2016)绍兴市上虞区不动产权第0015931号	共同共有	百官街道大通水尚名都6幢1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015931	15931	33100059951	2016/10/28 8:33:52	6	19	04		2018-10-25 13:40:50	2018-10-25 16:41:44
546	109012309	20161028-0031405	109012303	FDCQ	330604012051GB00708F00030027	浙(2016)绍兴市上虞区不动产权第0016646号	共同共有	百官街道大通水尚名都3幢1503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016646	16646	33100060778	2016/10/28 9:02:44	3	15	03		2018-10-25 13:40:50	2018-10-25 16:41:44
539	109136257	20161109-0033884	109136251	FDCQ	330604012051GB00708F00040016	浙(2016)绍兴市上虞区不动产权第0017439号	共同共有	百官街道大通水尚名都5幢1204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017439	17439	33100061229	2016/11/9 14:35:38	5	12	04		2018-10-25 13:40:50	2018-10-25 16:42:53
540	109136379	20161109-0033887	109136373	FDCQ	330604012051GB00708F00030094	浙(2016)绍兴市上虞区不动产权第0017691号	共同共有	百官街道大通水尚名都3幢302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017691	17691	33100061360	2016/11/9 14:39:17	3	3	02		2018-10-25 13:40:50	2018-10-25 16:42:53
541	109136432	20161109-0033889	109136426	FDCQ	330604012051GB00708F00090111	浙(2016)绍兴市上虞区不动产权第0017473号	共同共有	百官街道大通水尚名都10幢703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017473	17473	33100061243	2016/11/9 14:41:08	10	7	03		2018-10-25 13:40:50	2018-10-25 16:42:53
542	109136601	20161109-0033893	109136595	FDCQ	330604012051GB00708F00040065	浙(2016)绍兴市上虞区不动产权第0017685号	共同共有	百官街道大通水尚名都5幢23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017685	17685	33100061358	2016/11/9 14:50:19	5	24	01		2018-10-25 13:40:50	2018-10-25 16:42:53
543	109137508	20161109-0033917	109137502	FDCQ	330604012051GB00708F00060024	浙(2016)绍兴市上虞区不动产权第0017452号	共同共有	百官街道大通水尚名都7幢1单元12B04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017452	17452	33100061235	2016/11/9 15:12:00	7	13	04	1	2018-10-25 13:40:50	2018-10-25 16:42:53
101	213220981	20170906-0092128	213220974	FDCQ	330604012051GB00708F00050085	浙(2017)绍兴市上虞区不动产权第0024762号	共同共有	百官街道大通水尚名都6幢601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0024762	24762	33001411355	2017/9/6 11:14:42	6	6	01		2018-10-25 13:40:49	2018-10-25 16:42:53
548	109012518	20161028-0031408	109012512	FDCQ	330604012051GB00708F00020045	浙(2016)绍兴市上虞区不动产权第0016693号	共同共有	百官街道大通水尚名都2幢501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016693	16693	33100060788	2016/10/28 9:09:40	2	5	01		2018-10-25 13:40:50	2018-10-25 16:41:44
549	109012562	20161028-0031410	109012556	FDCQ	330604012051GB00708F00030068	浙(2016)绍兴市上虞区不动产权第0016736号	共同共有	百官街道大通水尚名都3幢23A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016736	16736	33100060793	2016/10/28 9:10:12	3	24	04		2018-10-25 13:40:50	2018-10-25 16:41:44
550	109048601	20161101-0032177	109048595	FDCQ	330604012051GB00708F00070087	浙(2016)绍兴市上虞区不动产权第0016781号	共同共有	百官街道大通水尚名都8幢2单元2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016781	16781	33100060855	2016/11/1 15:17:54	8	23	03	2	2018-10-25 13:40:50	2018-10-25 16:41:44
551	109048840	20161101-0032181	109048834	FDCQ	330604012051GB00708F00040018	浙(2016)绍兴市上虞区不动产权第0016599号	共同共有	百官街道大通水尚名都5幢12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016599	16599	33100060761	2016/11/1 15:24:29	5	13	02		2018-10-25 13:40:50	2018-10-25 16:41:44
552	109283912	20161128-0037174	109283906	FDCQ	330604012051GB00708F00080038	浙(2016)绍兴市上虞区不动产权第0019272号	共同共有	百官街道大通水尚名都9幢1单元2702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019272	19272	33100063805	2016/11/28 10:06:22	9	27	02	1	2018-10-25 13:40:50	2018-10-25 16:41:44
553	109183564	20161115-0034966	109183559	FDCQ	330604012051GB00708F00090078	浙(2016)绍兴市上虞区不动产权第0018154号	单独所有	百官街道大通水尚名都10幢2702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018154	18154	33100062161	2016/11/15 14:26:02	10	27	02		2018-10-25 13:40:50	2018-10-25 16:41:44
554	108977070	20161024-0030636	108977064	FDCQ	330604012051GB00708F00010041	浙(2016)绍兴市上虞区不动产权第0016166号	共同共有	百官街道大通水尚名都1幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016166	16166	33100060300	2016/10/24 15:01:26	1	21	02		2018-10-25 13:40:50	2018-10-25 16:41:44
555	109019560	20161028-0031567	109019554	FDCQ	330604012051GB00708F00030030	浙(2016)绍兴市上虞区不动产权第0016470号	共同共有	百官街道大通水尚名都3幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016470	16470	33100060419	2016/10/28 14:35:14	3	16	02		2018-10-25 13:40:50	2018-10-25 16:41:44
556	109019758	20161028-0031569	109019752	FDCQ	330604012051GB00708F00030107	浙(2016)绍兴市上虞区不动产权第0016649号	共同共有	百官街道大通水尚名都3幢503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016649	16649	33100060779	2016/10/28 14:42:15	3	5	03		2018-10-25 13:40:50	2018-10-25 16:41:44
557	109019730	20161028-0031570	109019724	FDCQ	330604012051GB00708F00020047	浙(2016)绍兴市上虞区不动产权第0016688号	共同共有	百官街道大通水尚名都2幢601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016688	16688	33100060786	2016/10/28 14:40:10	2	6	01		2018-10-25 13:40:50	2018-10-25 16:41:44
558	109053852	20161102-0032285	109053846	FDCQ	330604012051GB00708F00020037	浙(2016)绍兴市上虞区不动产权第0017092号	共同共有	百官街道大通水尚名都2幢2601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017092	17092	33100060969	2016/11/2 9:38:51	2	26	01		2018-10-25 13:40:50	2018-10-25 16:41:44
559	109137335	20161109-0033912	109137329	FDCQ	330604012051GB00708F00030108	浙(2016)绍兴市上虞区不动产权第0017476号	共同共有	百官街道大通水尚名都3幢504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017476	17476	33100061244	2016/11/9 15:09:03	3	5	04		2018-10-25 13:40:50	2018-10-25 16:41:44
560	109148877	20161110-0034157	109148870	FDCQ	330604012051GB00708F00100056	浙(2016)绍兴市上虞区不动产权第0017827号	共同共有	百官街道大通水尚名都11幢2单元12A08室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017827	17827	33100061393	2016/11/10 14:34:39	11	13	08	2	2018-10-25 13:40:50	2018-10-25 16:41:44
128	108626734	20160912-0025058	108626730	FDCQ	330604012051GB00708F00140002	浙(2016)绍兴市上虞区不动产权第0010868号	单独所有	大通水尚名都17幢101	国有建设用地使用权/房屋所有权	出让/其它	出让	其它	其它土地/其它	其它土地	其它	土地使用权面积13.81㎡/房屋建筑面积23.99㎡	13.81	23.99	国有建设用地使用权2053年01月09日止	\N	资料详见1幢物业(业主共有)	浙	绍兴市上虞区	2016	0010868	10868	2016/9/12 10:08:56	3	10	04		2018-10-25 13:40:49	2018-10-25 16:42:53
562	109149036	20161110-0034162	109149030	FDCQ	330604012051GB00708F00060063	浙(2016)绍兴市上虞区不动产权第0017819号	共同共有	百官街道大通水尚名都7幢1单元2303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017819	17819	33100061390	2016/11/10 14:39:59	7	23	03	1	2018-10-25 13:40:50	2018-10-25 16:41:44
563	109149140	20161110-0034171	109149134	FDCQ	330604012051GB00708F00050021	浙(2016)绍兴市上虞区不动产权第0017533号	共同共有	百官街道大通水尚名都6幢12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017533	17533	33100061267	2016/11/10 14:44:14	6	13	01		2018-10-25 13:40:50	2018-10-25 16:41:44
564	109149276	20161110-0034170	109149270	FDCQ	330604012051GB00708F00090041	浙(2016)绍兴市上虞区不动产权第0017906号	共同共有	百官街道大通水尚名都10幢1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017906	17906	33100061493	2016/11/10 14:47:14	10	19	01		2018-10-25 13:40:50	2018-10-25 16:41:44
565	109128537	20161109-0033719	109128530	FDCQ	330604012051GB00708F00120073	浙(2016)绍兴市上虞区不动产权第0017784号	共同共有	百官街道大通水尚名都12幢2单元305室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017784	17784	33100061450	2016/11/9 9:03:17	12	3	05	2	2018-10-25 13:40:50	2018-10-25 16:41:44
566	109165027	20161114-0034561	109165021	FDCQ	330604012051GB00708F00080007	浙(2016)绍兴市上虞区不动产权第0017874号	共同共有	百官街道大通水尚名都9幢1单元12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017874	17874	33100061482	2016/11/14 8:56:06	9	13	01	1	2018-10-25 13:40:50	2018-10-25 16:41:44
567	109167482	20161114-0034614	109167476	FDCQ	330604012051GB00708F00050004	浙(2016)绍兴市上虞区不动产权第0017890号	共同共有	百官街道大通水尚名都6幢1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017890	17890	33100061487	2016/11/14 10:20:58	6	10	04		2018-10-25 13:40:50	2018-10-25 16:41:44
568	109167550	20161114-0034617	109167544	FDCQ	330604012051GB00708F00090001	浙(2016)绍兴市上虞区不动产权第0017849号	共同共有	百官街道大通水尚名都10幢1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017849	17849	33100061472	2016/11/14 10:23:24	10	10	01		2018-10-25 13:40:50	2018-10-25 16:41:44
569	109168293	20161114-0034631	109168287	FDCQ	330604012051GB00708F00070102	浙(2016)绍兴市上虞区不动产权第0018227号	共同共有	百官街道大通水尚名都8幢2单元3004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018227	18227	33100062212	2016/11/14 10:44:57	8	30	04	2	2018-10-25 13:40:50	2018-10-25 16:41:44
570	109119224	20161101-0031987	109119218	FDCQ	330604012051GB00708F00040035	浙(2016)绍兴市上虞区不动产权第0016773号	共同共有	百官街道大通水尚名都5幢1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016773	16773	33100060904	2016/11/8 11:38:22	5	17	03		2018-10-25 13:40:50	2018-10-25 16:41:44
571	109063454	20161102-0032440	109063448	FDCQ	330604012051GB00708F00040063	浙(2016)绍兴市上虞区不动产权第0016908号	共同共有	百官街道大通水尚名都5幢2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016908	16908	33100060936	2016/11/2 14:37:35	5	23	03		2018-10-25 13:40:50	2018-10-25 16:41:44
572	109088489	20161104-0032879	109088483	FDCQ	330604012051GB00708F00060172	浙(2016)绍兴市上虞区不动产权第0017162号	共同共有	百官街道大通水尚名都7幢2单元2508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017162	17162	33100060978	2016/11/4 10:47:40	7	25	08	2	2018-10-25 13:40:50	2018-10-25 16:41:44
573	109090971	20161101-0031959	109090966	FDCQ	330604012051GB00708F00060037	浙(2016)绍兴市上虞区不动产权第0016604号	单独所有	百官街道大通水尚名都7幢1单元17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016604	16604	33100060801	2016/11/4 14:12:58	7	18	01	1	2018-10-25 13:40:50	2018-10-25 16:41:44
574	109138057	20161109-0033932	109138050	FDCQ	330604012051GB00708F00060116	浙(2016)绍兴市上虞区不动产权第0017757号	共同共有	百官街道大通水尚名都7幢2单元1208室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017757	17757	33100061379	2016/11/9 15:23:04	7	12	08	2	2018-10-25 13:40:50	2018-10-25 16:41:44
212	109153702	20161111-0034292	109153696	FDCQ	330604012051GB00708F00120039	浙(2016)绍兴市上虞区不动产权第0017687号	共同共有	百官街道大通水尚名都12幢1单元703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017687	17687	33100061419	2016/11/11 9:35:50	12	7	03	1	2018-10-25 13:40:49	2018-10-25 16:42:53
576	109138293	20161102-0032515	109138288	FDCQ	330604012051GB00708F00030011	浙(2016)绍兴市上虞区不动产权第0016933号	单独所有	百官街道大通水尚名都3幢1103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016933	16933	33100061001	2016/11/9 15:32:23	3	11	03		2018-10-25 13:40:50	2018-10-25 16:41:44
577	109138492	20161109-0033943	109138486	FDCQ	330604012051GB00708F00070059	浙(2016)绍兴市上虞区不动产权第0017457号	共同共有	百官街道大通水尚名都8幢2单元1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017457	17457	33100061237	2016/11/9 15:37:11	8	10	03	2	2018-10-25 13:40:50	2018-10-25 16:41:45
578	109141231	20161110-0033996	109141216	FDCQ	330604012051GB00708F00080090	浙(2016)绍兴市上虞区不动产权第0017941号	共同共有	百官街道大通水尚名都9幢2单元23A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017941	17941	33100062027	2016/11/10 9:01:39	9	24	04	2	2018-10-25 13:40:50	2018-10-25 16:41:45
579	109013089	20161028-0031419	109013083	FDCQ	330604012051GB00708F00040037	浙(2016)绍兴市上虞区不动产权第0016730号	共同共有	百官街道大通水尚名都5幢17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016730	16730	33100060791	2016/10/28 9:25:36	5	18	01		2018-10-25 13:40:50	2018-10-25 16:41:45
580	109159534	20161111-0034431	109159528	FDCQ	330604012051GB00708F00090028	浙(2016)绍兴市上虞区不动产权第0018033号	共同共有	百官街道大通水尚名都10幢1504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018033	18033	33100062124	2016/11/11 14:50:10	10	15	04		2018-10-25 13:40:50	2018-10-25 16:41:45
581	109159661	20161111-0034432	109159655	FDCQ	330604012051GB00708F00080073	浙(2016)绍兴市上虞区不动产权第0017716号	共同共有	百官街道大通水尚名都9幢2单元1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017716	17716	33100061430	2016/11/11 14:53:39	9	17	03	2	2018-10-25 13:40:50	2018-10-25 16:41:45
582	109160813	20161111-0034461	109160808	FDCQ	330604012051GB00708F00080008	浙(2016)绍兴市上虞区不动产权第0018026号	单独所有	百官街道大通水尚名都9幢1单元12A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018026	18026	33100062120	2016/11/11 15:28:02	9	13	02	1	2018-10-25 13:40:50	2018-10-25 16:41:45
583	109160961	20161111-0034464	109160955	FDCQ	330604012051GB00708F00090002	浙(2016)绍兴市上虞区不动产权第0017891号	共同共有	百官街道大通水尚名都10幢1002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017891	17891	33100062014	2016/11/11 15:34:52	10	10	02		2018-10-25 13:40:50	2018-10-25 16:41:45
584	109078961	20161103-0032706	109078956	FDCQ	330604012051GB00708F00060165	浙(2016)绍兴市上虞区不动产权第0017248号	单独所有	百官街道大通水尚名都7幢2单元23A05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017248	17248	33100061103	2016/11/3 14:58:12	7	24	05	2	2018-10-25 13:40:50	2018-10-25 16:41:45
585	109241954	20161122-0036261	109241949	FDCQ	330604012051GB00708F00060088	浙(2016)绍兴市上虞区不动产权第0018630号	单独所有	百官街道大通水尚名都7幢1单元604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018630	18630	33100062451	2016/11/22 11:06:27	7	6	04	1	2018-10-25 13:40:50	2018-10-25 16:41:45
586	109242344	20161122-0036269	109242338	FDCQ	330604012051GB00708F00090056	浙(2016)绍兴市上虞区不动产权第0018643号	共同共有	百官街道大通水尚名都10幢2104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018643	18643	33100062453	2016/11/22 11:14:37	10	21	04		2018-10-25 13:40:50	2018-10-25 16:41:45
587	109237262	20161122-0036156	109237256	FDCQ	330604012051GB00708F00120012	浙(2016)绍兴市上虞区不动产权第0018804号	共同共有	百官街道大通水尚名都12幢1单元12A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018804	18804	33100063012	2016/11/22 9:23:49	12	13	04	1	2018-10-25 13:40:50	2018-10-25 16:41:45
588	109242949	20161122-0036288	109242943	FDCQ	330604012051GB00708F00020041	浙(2016)绍兴市上虞区不动产权第0018893号	共同共有	百官街道大通水尚名都2幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018893	18893	33100063221	2016/11/22 11:30:11	2	3	01		2018-10-25 13:40:50	2018-10-25 16:41:45
320	109085648	20161104-0032822	109085642	FDCQ	330604012051GB00708F00060097	浙(2016)绍兴市上虞区不动产权第0017159号	共同共有	百官街道大通水尚名都7幢1单元901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017159	17159	33100060977	2016/11/4 9:20:38	7	9	01	1	2018-10-25 13:40:49	2018-10-25 16:42:53
590	108981993	20161025-0030740	108981988	FDCQ	330604012051GB00708F00010089	浙(2016)绍兴市上虞区不动产权第0016159号	单独所有	百官街道大通水尚名都1幢802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016159	16159	33100060297	2016/10/25 9:57:10	1	8	02		2018-10-25 13:40:50	2018-10-25 16:41:45
591	109021341	20161028-0031613	109021335	FDCQ	330604012051GB00708F00040061	浙(2016)绍兴市上虞区不动产权第0016345号	共同共有	百官街道大通水尚名都5幢2301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016345	16345	33100060388	2016/10/28 15:34:08	5	23	01		2018-10-25 13:40:50	2018-10-25 16:41:45
592	109136842	20161109-0033897	109136836	FDCQ	330604012051GB00708F00090052	浙(2016)绍兴市上虞区不动产权第0017954号	共同共有	百官街道大通水尚名都10幢204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017954	17954	33100062031	2016/11/9 14:57:42	10	2	04		2018-10-25 13:40:50	2018-10-25 16:41:45
593	109138628	20161109-0033946	109138621	FDCQ	330604012051GB00708F00060011	浙(2016)绍兴市上虞区不动产权第0017778号	共同共有	百官街道大通水尚名都7幢1单元1103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017778	17778	33100061446	2016/11/9 15:43:30	7	11	03	1	2018-10-25 13:40:50	2018-10-25 16:41:45
594	109280185	20161125-0037090	109280178	FDCQ	330604012051GB00708F00010051	浙(2016)绍兴市上虞区不动产权第0019119号	共同共有	百官街道大通水尚名都1幢23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019119	19119	33100063279	2016/11/25 15:51:40	1	24	03		2018-10-25 13:40:50	2018-10-25 16:41:45
595	109158901	20161111-0034415	109158895	FDCQ	330604012051GB00708F00090053	浙(2016)绍兴市上虞区不动产权第0017726号	共同共有	百官街道大通水尚名都10幢2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017726	17726	33100061434	2016/11/11 14:20:30	10	21	01		2018-10-25 13:40:50	2018-10-25 16:41:45
596	109160010	20161111-0034440	109160003	FDCQ	330604012051GB00708F00010082	浙(2016)绍兴市上虞区不动产权第0018044号	共同共有	百官街道大通水尚名都1幢601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018044	18044	33100062129	2016/11/11 15:03:23	1	6	01		2018-10-25 13:40:50	2018-10-25 16:41:45
597	109159767	20161111-0034436	109159761	FDCQ	330604012051GB00708F00080116	浙(2016)绍兴市上虞区不动产权第0018021号	共同共有	百官街道大通水尚名都9幢2单元904室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018021	18021	33100062119	2016/11/11 14:56:35	9	9	04	2	2018-10-25 13:40:50	2018-10-25 16:41:45
598	109160074	20161111-0034442	109160068	FDCQ	330604012051GB00708F00060194	浙(2016)绍兴市上虞区不动产权第0018040号	共同共有	百官街道大通水尚名都7幢2单元806室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018040	18040	33100062127	2016/11/11 15:05:28	7	8	06	2	2018-10-25 13:40:50	2018-10-25 16:41:45
599	109160143	20161111-0034443	109160137	FDCQ	330604012051GB00708F00030096	浙(2016)绍兴市上虞区不动产权第0017680号	共同共有	百官街道大通水尚名都3幢304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017680	17680	33100061416	2016/11/11 15:07:15	3	3	04		2018-10-25 13:40:50	2018-10-25 16:41:45
600	109160198	20161111-0034445	109160192	FDCQ	330604012051GB00708F00090034	浙(2016)绍兴市上虞区不动产权第0017723号	共同共有	百官街道大通水尚名都10幢1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017723	17723	33100061433	2016/11/11 15:09:25	10	17	02		2018-10-25 13:40:50	2018-10-25 16:41:45
601	109160273	20161111-0034446	109160267	FDCQ	330604012051GB00708F00100065	浙(2016)绍兴市上虞区不动产权第0018004号	共同共有	百官街道大通水尚名都11幢2单元1905室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018004	18004	33100062111	2016/11/11 15:10:39	11	19	05	2	2018-10-25 13:40:50	2018-10-25 16:41:45
602	109329122	20161201-0038142	109329116	FDCQ	330604012051GB00708F00070108	浙(2016)绍兴市上虞区不动产权第0019720号	共同共有	百官街道大通水尚名都8幢2单元504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019720	19720	33100064122	2016/12/1 16:38:17	8	5	04	2	2018-10-25 13:40:50	2018-10-25 16:41:45
323	109113390	20161108-0033359	109113384	FDCQ	330604012051GB00708F00070112	浙(2016)绍兴市上虞区不动产权第0017614号	共同共有	百官街道大通水尚名都8幢2单元704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017614	17614	33100061339	2016/11/8 9:14:25	8	7	04	2	2018-10-25 13:40:49	2018-10-25 16:42:53
604	109091299	20161104-0032919	109091293	FDCQ	330604012051GB00708F00050064	浙(2016)绍兴市上虞区不动产权第0017145号	共同共有	百官街道大通水尚名都6幢2304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017145	17145	33100060974	2016/11/4 14:18:40	6	23	04		2018-10-25 13:40:50	2018-10-25 16:41:45
605	109091468	20161104-0032925	109091462	FDCQ	330604012051GB00708F00050068	浙(2016)绍兴市上虞区不动产权第0017327号	共同共有	百官街道大通水尚名都6幢23A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017327	17327	33100061140	2016/11/4 14:22:41	6	24	04		2018-10-25 13:40:50	2018-10-25 16:41:45
606	109091719	20161104-0032931	109091712	FDCQ	330604012051GB00708F00060169	浙(2016)绍兴市上虞区不动产权第0017164号	共同共有	百官街道大通水尚名都7幢2单元2505室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017164	17164	33100060979	2016/11/4 14:28:52	7	25	05	2	2018-10-25 13:40:50	2018-10-25 16:41:45
607	109091897	20161104-0032934	109091892	FDCQ	330604012051GB00708F00030054	浙(2016)绍兴市上虞区不动产权第0017269号	单独所有	百官街道大通水尚名都3幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017269	17269	33100061118	2016/11/4 14:32:18	3	21	02		2018-10-25 13:40:50	2018-10-25 16:41:45
608	109121729	20161108-0033556	109121723	FDCQ	330604012051GB00708F00060142	浙(2016)绍兴市上虞区不动产权第0017615号	共同共有	百官街道大通水尚名都7幢2单元1906室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017615	17615	33100061340	2016/11/8 14:27:52	7	19	06	2	2018-10-25 13:40:50	2018-10-25 16:41:45
609	109121791	20161108-0033562	109121785	FDCQ	330604012051GB00708F00090074	浙(2016)绍兴市上虞区不动产权第0017556号	共同共有	百官街道大通水尚名都10幢2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017556	17556	33100061316	2016/11/8 14:30:00	10	26	02		2018-10-25 13:40:50	2018-10-25 16:41:45
610	109122049	20161108-0033568	109122043	FDCQ	330604012051GB00708F00120017	浙(2016)绍兴市上虞区不动产权第0017326号	共同共有	百官街道大通水尚名都12幢1单元1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017326	17326	33100061100	2016/11/8 14:34:36	12	17	01	1	2018-10-25 13:40:50	2018-10-25 16:41:45
611	109122015	20161108-0033563	109122009	FDCQ	330604012051GB00708F00100012	浙(2016)绍兴市上虞区不动产权第0017560号	共同共有	百官街道大通水尚名都11幢1单元12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017560	17560	33100061318	2016/11/8 14:33:46	11	13	04	1	2018-10-25 13:40:50	2018-10-25 16:41:45
612	109142278	20161110-0034015	109142272	FDCQ	330604012051GB00708F00090054	浙(2016)绍兴市上虞区不动产权第0017829号	共同共有	百官街道大通水尚名都10幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017829	17829	33100061394	2016/11/10 9:39:22	10	21	02		2018-10-25 13:40:50	2018-10-25 16:41:45
613	109145841	20161110-0034087	109145836	FDCQ	330604012051GB00708F00100071	浙(2016)绍兴市上虞区不动产权第0017555号	单独所有	百官街道大通水尚名都11幢2单元2107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017555	17555	33100061281	2016/11/10 11:09:52	11	21	07	2	2018-10-25 13:40:51	2018-10-25 16:41:45
614	109243322	20161122-0036300	109243316	FDCQ	330604012051GB00708F00030023	浙(2016)绍兴市上虞区不动产权第0018900号	共同共有	百官街道大通水尚名都3幢12B03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018900	18900	33100063047	2016/11/22 11:41:49	3	13	03		2018-10-25 13:40:51	2018-10-25 16:41:45
615	109245683	20161122-0036357	109245677	FDCQ	330604012051GB00708F00090036	浙(2016)绍兴市上虞区不动产权第0018807号	共同共有	百官街道大通水尚名都10幢1704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018807	18807	33100063013	2016/11/22 14:34:20	10	17	04		2018-10-25 13:40:51	2018-10-25 16:41:45
616	109245759	20161122-0036345	109245753	FDCQ	330604012051GB00708F00100051	浙(2016)绍兴市上虞区不动产权第0018645号	共同共有	百官街道大通水尚名都11幢2单元1107室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018645	18645	33100062454	2016/11/22 14:35:59	11	11	07	2	2018-10-25 13:40:51	2018-10-25 16:41:45
427	109284442	20161128-0037187	109284432	FDCQ	330604012051GB00708F00060054	浙(2016)绍兴市上虞区不动产权第0019230号	单独所有	百官街道大通水尚名都7幢1单元2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019230	19230	33100063096	2016/11/28 10:16:41	7	21	02	1	2018-10-25 13:40:50	2018-10-25 16:42:53
618	108982594	20161025-0030748	108982588	FDCQ	330604012051GB00708F00040088	浙(2016)绍兴市上虞区不动产权第0015926号	共同共有	百官街道大通水尚名都5幢604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015926	15926	33100059749	2016/10/25 10:08:14	5	6	04		2018-10-25 13:40:51	2018-10-25 16:41:45
619	108987094	20161025-0030854	108987088	FDCQ	330604012051GB00708F00010025	浙(2016)绍兴市上虞区不动产权第0016047号	共同共有	百官街道大通水尚名都1幢1701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016047	16047	33100060267	2016/10/25 14:24:00	1	17	01		2018-10-25 13:40:51	2018-10-25 16:41:45
620	108987137	20161025-0030855	108987131	FDCQ	330604012051GB00708F00010071	浙(2016)绍兴市上虞区不动产权第0016048号	共同共有	百官街道大通水尚名都1幢302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016048	16048	33100060268	2016/10/25 14:25:09	1	3	02		2018-10-25 13:40:51	2018-10-25 16:41:45
621	109023522	20161031-0031665	109023516	FDCQ	330604012051GB00708F00040020	浙(2016)绍兴市上虞区不动产权第0016440号	共同共有	百官街道大通水尚名都5幢12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016440	16440	33100060407	2016/10/31 9:02:30	5	13	04		2018-10-25 13:40:51	2018-10-25 16:41:45
622	109023543	20161031-0031666	109023537	FDCQ	330604012051GB00708F00030034	浙(2016)绍兴市上虞区不动产权第0016453号	共同共有	百官街道大通水尚名都3幢1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016453	16453	33100060728	2016/10/31 9:05:23	3	17	02		2018-10-25 13:40:51	2018-10-25 16:41:45
623	109023512	20161031-0031664	109023506	FDCQ	330604012051GB00708F00040054	浙(2016)绍兴市上虞区不动产权第0016417号	共同共有	百官街道大通水尚名都5幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016417	16417	33100060720	2016/10/31 9:00:48	5	21	02		2018-10-25 13:40:51	2018-10-25 16:41:45
624	109023610	20161031-0031674	109023604	FDCQ	330604012051GB00708F00030073	浙(2016)绍兴市上虞区不动产权第0016418号	共同共有	百官街道大通水尚名都3幢2601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016418	16418	33100060400	2016/10/31 9:12:52	3	26	01		2018-10-25 13:40:51	2018-10-25 16:41:45
625	109032141	20161031-0031869	109032135	FDCQ	330604012051GB00708F00010045	浙(2016)绍兴市上虞区不动产权第0016507号	共同共有	百官街道大通水尚名都1幢2203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016507	16507	33100060431	2016/10/31 15:06:24	1	22	03		2018-10-25 13:40:51	2018-10-25 16:41:45
626	109077657	20161103-0032688	109077652	FDCQ	330604012051GB00708F00060052	浙(2016)绍兴市上虞区不动产权第0017244号	单独所有	百官街道大通水尚名都7幢1单元204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积87.98㎡	5.04	87.98	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017244	17244	33100061101	2016/11/3 14:32:28	7	2	04	1	2018-10-25 13:40:51	2018-10-25 16:41:45
627	109077749	20161103-0032692	109077743	FDCQ	330604012051GB00708F00070025	浙(2016)绍兴市上虞区不动产权第0017243号	共同共有	百官街道大通水尚名都8幢1单元2101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017243	17243	33100061070	2016/11/3 14:34:18	8	21	01	1	2018-10-25 13:40:51	2018-10-25 16:41:45
628	109077786	20161103-0032690	109077780	FDCQ	330604012051GB00708F00060053	浙(2016)绍兴市上虞区不动产权第0017250号	共同共有	百官街道大通水尚名都7幢1单元2101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017250	17250	33100061104	2016/11/3 14:34:39	7	21	01	1	2018-10-25 13:40:51	2018-10-25 16:41:45
629	109078144	20161103-0032699	109078138	FDCQ	330604012051GB00708F00070008	浙(2016)绍兴市上虞区不动产权第0017235号	共同共有	百官街道大通水尚名都8幢1单元12A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017235	17235	33100061065	2016/11/3 14:44:07	8	13	02	1	2018-10-25 13:40:51	2018-10-25 16:41:45
630	109135797	20161109-0033873	109135791	FDCQ	330604012051GB00708F00100034	浙(2016)绍兴市上虞区不动产权第0017791号	共同共有	百官街道大通水尚名都11幢1单元502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017791	17791	33100061454	2016/11/9 14:21:37	11	5	02	1	2018-10-25 13:40:51	2018-10-25 16:41:45
478	108634344	20160901-0023306	108634334	FDCQ	330604012051GB00708F00150003	浙(2016)绍兴市上虞区不动产权第0010434号	单独所有	大通水尚名都18幢105	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	其它土地/物管用房	其它土地	物管用房	土地使用权面积31.29㎡/房屋建筑面积60.77㎡	31.29	60.77	国有建设用地使用权2053年01月09日止	\N	资料详见1幢物业(业主共有)	浙	绍兴市上虞区	2016	0010434	10434	2016/9/12 15:04:29	7	6	07	2	2018-10-25 13:40:50	2018-10-25 16:42:53
644	109145893	20161103-0032562	109145887	FDCQ	330604012051GB00708F00040003	浙(2016)绍兴市上虞区不动产权第0017233号	单独所有	百官街道大通水尚名都5幢1003室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017233	17233	33100061064	2016/11/10 11:12:57	5	10	03		2018-10-25 13:40:51	2018-10-25 16:42:53
632	109136091	20161109-0033878	109136085	FDCQ	330604012051GB00708F00100078	浙(2016)绍兴市上虞区不动产权第0017694号	共同共有	百官街道大通水尚名都11幢2单元506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017694	17694	33100061362	2016/11/9 14:31:35	11	5	06	2	2018-10-25 13:40:51	2018-10-25 16:41:45
633	109149687	20161110-0034188	109149681	FDCQ	330604012051GB00708F00070057	浙(2016)绍兴市上虞区不动产权第0017541号	共同共有	百官街道大通水尚名都8幢1单元901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017541	17541	33100061272	2016/11/10 14:59:40	8	9	01	1	2018-10-25 13:40:51	2018-10-25 16:41:45
634	109149710	20161110-0034187	109149703	FDCQ	330604012051GB00708F00080010	浙(2016)绍兴市上虞区不动产权第0017539号	共同共有	百官街道大通水尚名都9幢1单元12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017539	17539	33100061271	2016/11/10 15:00:04	9	13	02	1	2018-10-25 13:40:51	2018-10-25 16:41:45
635	109149784	20161110-0034190	109149772	FDCQ	330604012051GB00708F00030070	浙(2016)绍兴市上虞区不动产权第0017907号	共同共有	百官街道大通水尚名都3幢2502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017907	17907	33100061494	2016/11/10 15:03:06	3	25	02		2018-10-25 13:40:51	2018-10-25 16:41:45
636	109149912	20161110-0034192	109149906	FDCQ	330604012051GB00708F00120055	浙(2016)绍兴市上虞区不动产权第0017557号	共同共有	百官街道大通水尚名都12幢2单元12A07室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017557	17557	33100061282	2016/11/10 15:06:12	12	13	07	2	2018-10-25 13:40:51	2018-10-25 16:41:45
637	109150100	20161110-0034198	109150094	FDCQ	330604012051GB00708F00090107	浙(2016)绍兴市上虞区不动产权第0017538号	共同共有	百官街道大通水尚名都10幢603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017538	17538	33100061270	2016/11/10 15:10:59	10	6	03		2018-10-25 13:40:51	2018-10-25 16:41:45
638	109150033	20161110-0034194	109150027	FDCQ	330604012051GB00708F00090099	浙(2016)绍兴市上虞区不动产权第0017840号	共同共有	百官街道大通水尚名都10幢3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017840	17840	33100061398	2016/11/10 15:09:26	10	4	03		2018-10-25 13:40:51	2018-10-25 16:41:45
639	109150203	20161110-0034203	109150197	FDCQ	330604012051GB00708F00100014	浙(2016)绍兴市上虞区不动产权第0017905号	共同共有	百官街道大通水尚名都11幢1单元1502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017905	17905	33100062019	2016/11/10 15:16:03	11	15	02	1	2018-10-25 13:40:51	2018-10-25 16:41:45
640	109150542	20161110-0034211	109150536	FDCQ	330604012051GB00708F00070115	浙(2016)绍兴市上虞区不动产权第0017822号	共同共有	百官街道大通水尚名都8幢2单元903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017822	17822	33100061391	2016/11/10 15:30:22	8	9	03	2	2018-10-25 13:40:51	2018-10-25 16:41:45
641	109160825	20161111-0034459	109160819	FDCQ	330604012051GB00708F00070106	浙(2016)绍兴市上虞区不动产权第0017885号	共同共有	百官街道大通水尚名都8幢2单元3A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017885	17885	33100062011	2016/11/11 15:28:07	8	4	04	2	2018-10-25 13:40:51	2018-10-25 16:41:45
642	109269517	20161124-0036843	109269511	FDCQ	330604012051GB00708F00060200	浙(2016)绍兴市上虞区不动产权第0018867号	共同共有	百官街道大通水尚名都7幢2单元908室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018867	18867	33100063033	2016/11/24 16:07:55	7	9	08	2	2018-10-25 13:40:51	2018-10-25 16:41:45
477	108634343	20160901-0023306	108634331	FDCQ	330604012051GB00708F00150002	浙(2016)绍兴市上虞区不动产权第0010433号	单独所有	大通水尚名都18幢104	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	其它土地/物管用房	其它土地	物管用房	土地使用权面积50.80㎡/房屋建筑面积106.43㎡	50.80	106.43	国有建设用地使用权2053年01月09日止	\N	资料详见1幢物业(业主共有)	浙	绍兴市上虞区	2016	0010433	10433	2016/9/12 15:04:29	3	10	03		2018-10-25 13:40:50	2018-10-25 16:42:53
646	108975842	20161024-0030596	108975836	FDCQ	330604012051GB00708F00020039	浙(2016)绍兴市上虞区不动产权第0015830号	共同共有	百官街道大通水尚名都2幢2701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015830	15830	33100059727	2016/10/24 14:31:02	2	27	01		2018-10-25 13:40:51	2018-10-25 16:42:53
647	109277584	20161125-0037025	109277578	FDCQ	330604012051GB00708F00030076	浙(2016)绍兴市上虞区不动产权第0019121号	共同共有	百官街道大通水尚名都3幢2604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019121	19121	33100063280	2016/11/25 14:31:33	3	26	04		2018-10-25 13:40:51	2018-10-25 16:42:53
648	109277633	20161125-0037027	109277627	FDCQ	330604012051GB00708F00050015	浙(2016)绍兴市上虞区不动产权第0019017号	共同共有	百官街道大通水尚名都6幢1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019017	19017	33100063068	2016/11/25 14:33:10	6	12	03		2018-10-25 13:40:51	2018-10-25 16:42:53
649	108992193	20161026-0030965	108992187	FDCQ	330604012051GB00708F00020033	浙(2016)绍兴市上虞区不动产权第0016005号	共同共有	百官街道大通水尚名都2幢23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016005	16005	33100059979	2016/10/26 9:37:38	2	24	01		2018-10-25 13:40:51	2018-10-25 16:42:53
651	108993613	20161026-0030997	108993607	FDCQ	330604012051GB00708F00030092	浙(2016)绍兴市上虞区不动产权第0016113号	共同共有	百官街道大通水尚名都3幢3004室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016113	16113	33100060284	2016/10/26 10:20:39	3	30	04		2018-10-25 13:40:51	2018-10-25 16:41:49
652	108993419	20161026-0030992	108993413	FDCQ	330604012051GB00708F00010038	浙(2016)绍兴市上虞区不动产权第0016026号	共同共有	百官街道大通水尚名都1幢202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.15㎡/房屋建筑面积109.94㎡	5.15	109.94	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016026	16026	33100059969	2016/10/26 10:13:01	1	2	02		2018-10-25 13:40:51	2018-10-25 16:41:49
653	108994453	20161026-0031010	108994447	FDCQ	330604012051GB00708F00030021	浙(2016)绍兴市上虞区不动产权第0016063号	共同共有	百官街道大通水尚名都3幢12B01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016063	16063	33100060273	2016/10/26 10:50:04	3	13	01		2018-10-25 13:40:51	2018-10-25 16:41:49
654	109034338	20161031-0031908	109034333	FDCQ	330604012051GB00708F00040009	浙(2016)绍兴市上虞区不动产权第0016423号	单独所有	百官街道大通水尚名都5幢1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016423	16423	33100060722	2016/10/31 16:13:26	5	11	01		2018-10-25 13:40:51	2018-10-25 16:41:49
655	109052526	20161102-0032259	109052518	FDCQ	330604012051GB00708F00060058	浙(2016)绍兴市上虞区不动产权第0016732号	共同共有	百官街道大通水尚名都7幢1单元2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016732	16732	33100060833	2016/11/2 8:56:08	7	22	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
656	109052474	20161102-0032256	109052468	FDCQ	330604012051GB00708F00060061	浙(2016)绍兴市上虞区不动产权第0016892号	共同共有	百官街道大通水尚名都7幢1单元2301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016892	16892	33100060929	2016/11/2 8:52:52	7	23	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
657	109052629	20161026-0030941	109052623	FDCQ	330604012051GB00708F00120026	浙(2016)绍兴市上虞区不动产权第0016315号	共同共有	百官街道大通水尚名都12幢1单元2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016315	16315	33100060376	2016/11/2 9:02:50	12	21	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
658	109052711	20161102-0032264	109052705	FDCQ	330604012051GB00708F00040079	浙(2016)绍兴市上虞区不动产权第0016934号	共同共有	百官街道大通水尚名都5幢3A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016934	16934	33100060944	2016/11/2 9:06:27	5	4	03		2018-10-25 13:40:51	2018-10-25 16:41:49
643	109092863	20161102-0032438	109092857	FDCQ	330604012051GB00708F00030005	浙(2016)绍兴市上虞区不动产权第0016726号	共同共有	百官街道大通水尚名都3幢101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.91㎡/房屋建筑面积112.24㎡	4.91	112.24	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016726	16726	33100060831	2016/11/4 14:57:14	3	1	01		2018-10-25 13:40:51	2018-10-25 16:42:53
660	109052784	20161102-0032265	109052778	FDCQ	330604012051GB00708F00070073	浙(2016)绍兴市上虞区不动产权第0017086号	共同共有	百官街道大通水尚名都8幢2单元1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017086	17086	33100060965	2016/11/2 9:10:17	8	17	03	2	2018-10-25 13:40:51	2018-10-25 16:41:49
661	109053512	20161102-0032282	109053506	FDCQ	330604012051GB00708F00040058	浙(2016)绍兴市上虞区不动产权第0016745号	共同共有	百官街道大通水尚名都5幢2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016745	16745	33100060838	2016/11/2 9:32:26	5	22	02		2018-10-25 13:40:51	2018-10-25 16:41:49
662	109150906	20161110-0034217	109150900	FDCQ	330604012051GB00708F00090040	浙(2016)绍兴市上虞区不动产权第0017838号	共同共有	百官街道大通水尚名都10幢17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017838	17838	33100061397	2016/11/10 15:40:15	10	18	04		2018-10-25 13:40:51	2018-10-25 16:41:49
663	109151684	20161103-0032582	109151679	FDCQ	330604012051GB00708F00010057	浙(2016)绍兴市上虞区不动产权第0017276号	单独所有	百官街道大通水尚名都1幢2603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017276	17276	33100061076	2016/11/10 16:27:16	1	26	03		2018-10-25 13:40:51	2018-10-25 16:41:49
664	109152917	20161111-0034271	109152912	FDCQ	330604012051GB00708F00070028	浙(2016)绍兴市上虞区不动产权第0017731号	单独所有	百官街道大通水尚名都8幢1单元2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017731	17731	33100061436	2016/11/11 8:49:35	8	22	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
665	109152941	20161111-0034272	109152935	FDCQ	330604012051GB00708F00100050	浙(2016)绍兴市上虞区不动产权第0017654号	共同共有	百官街道大通水尚名都11幢2单元1106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017654	17654	33100062132	2016/11/11 8:51:58	11	11	06	2	2018-10-25 13:40:51	2018-10-25 16:41:49
666	109153018	20161111-0034273	109153010	FDCQ	330604012051GB00708F00100083	浙(2016)绍兴市上虞区不动产权第0018006号	共同共有	百官街道大通水尚名都11幢2单元707室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018006	18006	33100062112	2016/11/11 8:54:19	11	7	07	2	2018-10-25 13:40:51	2018-10-25 16:41:49
667	109153177	20161111-0034279	109153171	FDCQ	330604012051GB00708F00060031	浙(2016)绍兴市上虞区不动产权第0018038号	共同共有	百官街道大通水尚名都7幢1单元1603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018038	18038	33100062126	2016/11/11 9:02:56	7	16	03	1	2018-10-25 13:40:51	2018-10-25 16:41:49
668	109153189	20161111-0034281	109153183	FDCQ	330604012051GB00708F00100063	浙(2016)绍兴市上虞区不动产权第0018008号	共同共有	百官街道大通水尚名都11幢2单元1707室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018008	18008	33100062113	2016/11/11 9:03:03	11	17	07	2	2018-10-25 13:40:51	2018-10-25 16:41:49
669	109153528	20161111-0034289	109153523	FDCQ	330604012051GB00708F00090015	浙(2016)绍兴市上虞区不动产权第0017722号	单独所有	百官街道大通水尚名都10幢1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017722	17722	33100061432	2016/11/11 9:29:53	10	12	03		2018-10-25 13:40:51	2018-10-25 16:41:49
670	109023747	20161031-0031673	109023741	FDCQ	330604012051GB00708F00070055	浙(2016)绍兴市上虞区不动产权第0016614号	单独所有	百官街道大通水尚名都8幢1单元801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016614	16614	33100060763	2016/10/31 9:18:29	8	8	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
671	109023760	20161031-0031682	109023754	FDCQ	330604012051GB00708F00030083	浙(2016)绍兴市上虞区不动产权第0016441号	共同共有	百官街道大通水尚名都3幢2803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016441	16441	33100060726	2016/10/31 9:18:32	3	28	03		2018-10-25 13:40:51	2018-10-25 16:41:49
672	109023884	20161031-0031686	109023879	FDCQ	330604012051GB00708F00030014	浙(2016)绍兴市上虞区不动产权第0016415号	单独所有	百官街道大通水尚名都3幢1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016415	16415	33100060399	2016/10/31 9:21:36	3	12	02		2018-10-25 13:40:51	2018-10-25 16:41:49
645	109148410	20161110-0034146	109148404	FDCQ	330604012051GB00708F00100023	浙(2016)绍兴市上虞区不动产权第0017903号	共同共有	百官街道大通水尚名都11幢1单元1903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017903	17903	33100062018	2016/11/10 14:24:32	11	19	03	1	2018-10-25 13:40:51	2018-10-25 16:42:53
674	109024123	20161031-0031694	109024118	FDCQ	330604012051GB00708F00010036	浙(2016)绍兴市上虞区不动产权第0016365号	单独所有	百官街道大通水尚名都1幢2003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016365	16365	33100060723	2016/10/31 9:26:29	1	20	03		2018-10-25 13:40:51	2018-10-25 16:41:49
675	109027875	20161031-0031780	109027870	FDCQ	330604012051GB00708F00060086	浙(2016)绍兴市上虞区不动产权第0016651号	单独所有	百官街道大通水尚名都7幢1单元602室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016651	16651	33100060822	2016/10/31 11:19:08	7	6	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
676	109062886	20161102-0032428	109062881	FDCQ	330604012051GB00708F00050024	浙(2016)绍兴市上虞区不动产权第0017091号	单独所有	百官街道大通水尚名都6幢12B04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017091	17091	33100060968	2016/11/2 14:24:50	6	13	04		2018-10-25 13:40:51	2018-10-25 16:41:49
677	109128432	20161109-0033717	109128426	FDCQ	330604012051GB00708F00120070	浙(2016)绍兴市上虞区不动产权第0017782号	共同共有	百官街道大通水尚名都12幢2单元2106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017782	17782	33100061449	2016/11/9 9:00:50	12	21	06	2	2018-10-25 13:40:51	2018-10-25 16:41:49
678	109128476	20161107-0033137	109128470	FDCQ	330604012051GB00708F00100042	浙(2016)绍兴市上虞区不动产权第0017144号	共同共有	百官街道大通水尚名都11幢1单元902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017144	17144	33100061027	2016/11/9 9:02:03	11	9	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
679	109128655	20161109-0033721	109128650	FDCQ	330604012051GB00708F00100088	浙(2016)绍兴市上虞区不动产权第0017692号	单独所有	百官街道大通水尚名都11幢2单元908室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017692	17692	33100061361	2016/11/9 9:05:37	11	9	08	2	2018-10-25 13:40:51	2018-10-25 16:41:49
680	109242614	20161122-0036279	109242609	FDCQ	330604012051GB00708F00080037	浙(2016)绍兴市上虞区不动产权第0018810号	单独所有	百官街道大通水尚名都9幢1单元2701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018810	18810	33100063014	2016/11/22 11:22:35	9	27	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
681	109286337	20161128-0037236	109286331	FDCQ	330604012051GB00708F00070003	浙(2016)绍兴市上虞区不动产权第0019315号	共同共有	百官街道大通水尚名都8幢1单元1101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019315	19315	33100063814	2016/11/28 11:16:11	8	11	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
682	109148543	20161110-0034147	109148537	FDCQ	330604012051GB00708F00100064	浙(2016)绍兴市上虞区不动产权第0017869号	共同共有	百官街道大通水尚名都11幢2单元1708室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017869	17869	33100062006	2016/11/10 14:28:30	11	17	08	2	2018-10-25 13:40:51	2018-10-25 16:41:49
683	108976387	20161024-0030613	108976381	FDCQ	330604012051GB00708F00030082	浙(2016)绍兴市上虞区不动产权第0015843号	共同共有	百官街道大通水尚名都3幢2802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015843	15843	33100059728	2016/10/24 14:43:32	3	28	02		2018-10-25 13:40:51	2018-10-25 16:41:49
684	108976738	20161024-0030628	108976732	FDCQ	330604012051GB00708F00030050	浙(2016)绍兴市上虞区不动产权第0016053号	共同共有	百官街道大通水尚名都3幢202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016053	16053	33100059982	2016/10/24 14:52:20	3	2	02		2018-10-25 13:40:51	2018-10-25 16:41:49
685	109250353	20161121-0036125	109250348	FDCQ	330604012051GB00708F00120050	浙(2016)绍兴市上虞区不动产权第0018752号	单独所有	百官街道大通水尚名都12幢2单元1106室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018752	18752	33100062492	2016/11/23 8:43:49	12	11	06	2	2018-10-25 13:40:51	2018-10-25 16:41:49
686	109250398	20161123-0036454	109250392	FDCQ	330604012051GB00708F00060155	浙(2016)绍兴市上虞区不动产权第0018940号	共同共有	百官街道大通水尚名都7幢2单元2107室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018940	18940	33100063058	2016/11/23 8:53:22	7	21	07	2	2018-10-25 13:40:51	2018-10-25 16:41:49
1202	108631189	20160831-0023014	108631053	FDCQ	330604012051GB00708F00010072	浙(2016)绍兴市上虞区不动产权第0010445号	单独所有	百官街道大通水尚名都1幢303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止		浙	绍兴市上虞区	2016	0010445	10445			1	3	03		2018-10-27 13:40:50	2018-10-27 13:40:50
688	109251035	20161123-0036467	109251030	FDCQ	330604012051GB00708F00050008	浙(2016)绍兴市上虞区不动产权第0018960号	单独所有	百官街道大通水尚名都6幢104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.98㎡/房屋建筑面积87.38㎡	4.98	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018960	18960	33100063062	2016/11/23 9:25:24	6	1	04		2018-10-25 13:40:51	2018-10-25 16:41:49
689	109251168	20161123-0036473	109251162	FDCQ	330604012051GB00708F00060025	浙(2016)绍兴市上虞区不动产权第0018942号	共同共有	百官街道大通水尚名都7幢1单元1501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018942	18942	33100063059	2016/11/23 9:32:06	7	15	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
690	109023668	20161031-0031681	109023663	FDCQ	330604012051GB00708F00030035	浙(2016)绍兴市上虞区不动产权第0016451号	单独所有	百官街道大通水尚名都3幢1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016451	16451	33100060409	2016/10/31 9:15:54	3	17	03		2018-10-25 13:40:51	2018-10-25 16:41:49
691	109029943	20161031-0031818	109029937	FDCQ	330604012051GB00708F00070004	浙(2016)绍兴市上虞区不动产权第0016405号	共同共有	百官街道大通水尚名都8幢1单元1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016405	16405	33100060715	2016/10/31 14:24:01	8	11	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
692	109046208	20161101-0032127	109046202	FDCQ	330604012051GB00708F00060057	浙(2016)绍兴市上虞区不动产权第0016808号	共同共有	百官街道大通水尚名都7幢1单元2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016808	16808	33100060916	2016/11/1 14:21:31	7	22	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
693	109091145	20161104-0032916	109091138	FDCQ	330604012051GB00708F00040074	浙(2016)绍兴市上虞区不动产权第0017001号	共同共有	百官街道大通水尚名都5幢302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017001	17001	33100061009	2016/11/4 14:16:15	5	3	02		2018-10-25 13:40:51	2018-10-25 16:41:49
694	109046432	20161101-0032128	109046426	FDCQ	330604012051GB00708F00030009	浙(2016)绍兴市上虞区不动产权第0016582号	共同共有	百官街道大通水尚名都3幢1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016582	16582	33100060442	2016/11/1 14:25:56	3	11	01		2018-10-25 13:40:51	2018-10-25 16:41:49
695	109046638	20161101-0032133	109046632	FDCQ	330604012051GB00708F00050009	浙(2016)绍兴市上虞区不动产权第0016589号	共同共有	百官街道大通水尚名都6幢1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016589	16589	33100060757	2016/11/1 14:31:11	6	11	01		2018-10-25 13:40:51	2018-10-25 16:41:49
696	109091312	20161104-0032920	109091306	FDCQ	330604012051GB00708F00030079	浙(2016)绍兴市上虞区不动产权第0017338号	共同共有	百官街道大通水尚名都3幢2703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017338	17338	33100061146	2016/11/4 14:19:07	3	27	03		2018-10-25 13:40:51	2018-10-25 16:41:49
697	109047033	20161101-0032142	109047027	FDCQ	330604012051GB00708F00050011	浙(2016)绍兴市上虞区不动产权第0016786号	共同共有	百官街道大通水尚名都6幢1103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016786	16786	33100060908	2016/11/1 14:38:49	6	11	03		2018-10-25 13:40:51	2018-10-25 16:41:49
698	109047462	20161101-0032155	109047456	FDCQ	330604012051GB00708F00030103	浙(2016)绍兴市上虞区不动产权第0016753号	共同共有	百官街道大通水尚名都3幢3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016753	16753	33100060799	2016/11/1 14:48:25	3	4	03		2018-10-25 13:40:51	2018-10-25 16:41:49
699	109047146	20161101-0032149	109047140	FDCQ	330604012051GB00708F00060018	浙(2016)绍兴市上虞区不动产权第0016619号	共同共有	百官街道大通水尚名都7幢1单元12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016619	16619	33100060810	2016/11/1 14:40:13	7	13	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
700	109033390	20161031-0031892	109033384	FDCQ	330604012051GB00708F00060050	浙(2016)绍兴市上虞区不动产权第0016647号	共同共有	百官街道大通水尚名都7幢1单元202室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016647	16647	33100060820	2016/10/31 15:39:03	7	2	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
702	109171186	20161114-0034678	109171180	FDCQ	330604012051GB00708F00040089	浙(2016)绍兴市上虞区不动产权第0017868号	共同共有	百官街道大通水尚名都5幢701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017868	17868	33100061479	2016/11/14 14:27:23	5	7	01		2018-10-25 13:40:51	2018-10-25 16:41:49
703	109171231	20161114-0034676	109171225	FDCQ	330604012051GB00708F00040011	浙(2016)绍兴市上虞区不动产权第0018168号	共同共有	百官街道大通水尚名都5幢1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018168	18168	33100062092	2016/11/14 14:29:07	5	11	03		2018-10-25 13:40:51	2018-10-25 16:41:49
704	109245329	20161122-0036348	109245323	FDCQ	330604012051GB00708F00060077	浙(2016)绍兴市上虞区不动产权第0018859号	共同共有	百官街道大通水尚名都7幢1单元3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018859	18859	33100063206	2016/11/22 14:27:06	7	4	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
705	109148149	20161110-0034142	109148143	FDCQ	330604012051GB00708F00100015	浙(2016)绍兴市上虞区不动产权第0017553号	共同共有	百官街道大通水尚名都11幢1单元1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017553	17553	33100061280	2016/11/10 14:20:16	11	15	03	1	2018-10-25 13:40:51	2018-10-25 16:41:49
706	109148832	20161110-0034156	109148825	FDCQ	330604012051GB00708F00050096	浙(2016)绍兴市上虞区不动产权第0017535号	单独所有	百官街道大通水尚名都6幢804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017535	17535	33100061268	2016/11/10 14:32:49	6	8	04		2018-10-25 13:40:51	2018-10-25 16:41:49
707	109148976	20161110-0034163	109148970	FDCQ	330604012051GB00708F00070022	浙(2016)绍兴市上虞区不动产权第0017939号	共同共有	百官街道大通水尚名都8幢1单元2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017939	17939	33100062026	2016/11/10 14:37:38	8	20	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
708	109149120	20161110-0034166	109149114	FDCQ	330604012051GB00708F00090097	浙(2016)绍兴市上虞区不动产权第0017825号	共同共有	百官街道大通水尚名都10幢3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017825	17825	33100061392	2016/11/10 14:42:56	10	4	01		2018-10-25 13:40:51	2018-10-25 16:41:49
709	109149368	20161110-0034176	109149362	FDCQ	330604012051GB00708F00060099	浙(2016)绍兴市上虞区不动产权第0017914号	共同共有	百官街道大通水尚名都7幢1单元903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017914	17914	33100061496	2016/11/10 14:48:23	7	9	03	1	2018-10-25 13:40:51	2018-10-25 16:41:49
710	109149411	20161110-0034175	109149405	FDCQ	330604012051GB00708F00030017	浙(2016)绍兴市上虞区不动产权第0017842号	共同共有	百官街道大通水尚名都3幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017842	17842	33100061399	2016/11/10 14:49:28	3	13	01		2018-10-25 13:40:51	2018-10-25 16:41:49
711	109149527	20161110-0034178	109149521	FDCQ	330604012051GB00708F00040051	浙(2016)绍兴市上虞区不动产权第0017856号	共同共有	百官街道大通水尚名都5幢203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积89.23㎡	5.03	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017856	17856	33100062001	2016/11/10 14:54:15	5	2	03		2018-10-25 13:40:51	2018-10-25 16:41:49
712	109013681	20161028-0031430	109013671	FDCQ	330604012051GB00708F00090008	浙(2016)绍兴市上虞区不动产权第0016581号	共同共有	百官街道大通水尚名都10幢104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016581	16581	33100060754	2016/10/28 9:42:02	10	1	04		2018-10-25 13:40:51	2018-10-25 16:41:49
713	109068718	20161103-0032530	109068712	FDCQ	330604012051GB00708F00040045	浙(2016)绍兴市上虞区不动产权第0017257号	共同共有	百官街道大通水尚名都5幢2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017257	17257	33100061109	2016/11/3 8:54:47	5	20	01		2018-10-25 13:40:51	2018-10-25 16:41:49
714	109069209	20161103-0032549	109069203	FDCQ	330604012051GB00708F00060157	浙(2016)绍兴市上虞区不动产权第0017241号	共同共有	百官街道大通水尚名都7幢2单元2205室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017241	17241	33100061068	2016/11/3 9:12:58	7	22	05	2	2018-10-25 13:40:51	2018-10-25 16:41:49
716	109069805	20161103-0032560	109069799	FDCQ	330604012051GB00708F00080091	浙(2016)绍兴市上虞区不动产权第0016874号	共同共有	百官街道大通水尚名都9幢2单元2503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016874	16874	33100060877	2016/11/3 9:32:43	9	25	03	2	2018-10-25 13:40:51	2018-10-25 16:41:49
717	109628345	20161228-0044517	109628339	FDCQ	330604012051GB00708F00060076	浙(2017)绍兴市上虞区不动产权第0001222号	共同共有	百官街道大通水尚名都7幢1单元304室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001222	1222	33001392893	2016/12/28 9:35:16	7	3	04	1	2018-10-25 13:40:51	2018-10-25 16:41:49
718	109628433	20161228-0044523	109628425	FDCQ	330604012051GB00708F00080095	浙(2017)绍兴市上虞区不动产权第0000588号	共同共有	百官街道大通水尚名都9幢2单元2703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000588	588	33001392190	2016/12/28 9:38:37	9	27	03	2	2018-10-25 13:40:51	2018-10-25 16:41:49
719	109141304	20161110-0033993	109141295	FDCQ	330604012051GB00708F00080075	浙(2016)绍兴市上虞区不动产权第0017661号	共同共有	百官街道大通水尚名都9幢2单元17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017661	17661	33100061350	2016/11/10 9:02:14	9	18	03	2	2018-10-25 13:40:51	2018-10-25 16:41:49
720	109141258	20161110-0033997	109141252	FDCQ	330604012051GB00708F00040040	浙(2016)绍兴市上虞区不动产权第0017853号	共同共有	百官街道大通水尚名都5幢17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017853	17853	33100061400	2016/11/10 9:01:56	5	18	04		2018-10-25 13:40:51	2018-10-25 16:41:49
721	109141455	20161110-0034001	109141449	FDCQ	330604012051GB00708F00090088	浙(2016)绍兴市上虞区不动产权第0017947号	共同共有	百官街道大通水尚名都10幢2904室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017947	17947	33100062029	2016/11/10 9:06:42	10	29	04		2018-10-25 13:40:51	2018-10-25 16:41:49
722	109141423	20161110-0033998	109141417	FDCQ	330604012051GB00708F00090086	浙(2016)绍兴市上虞区不动产权第0017835号	共同共有	百官街道大通水尚名都10幢2902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017835	17835	33100061396	2016/11/10 9:05:39	10	29	02		2018-10-25 13:40:51	2018-10-25 16:41:49
723	109030472	20161031-0031830	109030466	FDCQ	330604012051GB00708F00040049	浙(2016)绍兴市上虞区不动产权第0016628号	共同共有	百官街道大通水尚名都5幢201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.93㎡/房屋建筑面积87.38㎡	4.93	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016628	16628	33100060769	2016/10/31 14:34:48	5	2	01		2018-10-25 13:40:51	2018-10-25 16:41:49
724	109030582	20161031-0031829	109030576	FDCQ	330604012051GB00708F00030078	浙(2016)绍兴市上虞区不动产权第0016445号	共同共有	百官街道大通水尚名都3幢2702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016445	16445	33100060727	2016/10/31 14:37:12	3	27	02		2018-10-25 13:40:51	2018-10-25 16:41:49
725	108997134	20161026-0031058	108997128	FDCQ	330604012051GB00708F00010046	浙(2016)绍兴市上虞区不动产权第0016072号	共同共有	百官街道大通水尚名都1幢2301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016072	16072	33100060276	2016/10/26 14:23:28	1	23	01		2018-10-25 13:40:51	2018-10-25 16:41:49
726	108997089	20161026-0031060	108997083	FDCQ	330604012051GB00708F00010067	浙(2016)绍兴市上虞区不动产权第0016214号	共同共有	百官街道大通水尚名都1幢3001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016214	16214	33100060040	2016/10/26 14:23:01	1	30	01		2018-10-25 13:40:51	2018-10-25 16:41:49
727	108997229	20161026-0031067	108997223	FDCQ	330604012051GB00708F00010054	浙(2016)绍兴市上虞区不动产权第0016044号	共同共有	百官街道大通水尚名都1幢2503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016044	16044	33100059977	2016/10/26 14:25:04	1	25	03		2018-10-25 13:40:51	2018-10-25 16:41:49
728	109002061	20161027-0031174	109002055	FDCQ	330604012051GB00708F00010002	浙(2016)绍兴市上虞区不动产权第0016260号	共同共有	百官街道大通水尚名都1幢1002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016260	16260	33100060331	2016/10/27 9:18:33	1	10	02		2018-10-25 13:40:51	2018-10-25 16:41:49
730	109049196	20161101-0032195	109049190	FDCQ	330604012051GB00708F00040024	浙(2016)绍兴市上虞区不动产权第0016791号	共同共有	百官街道大通水尚名都5幢12B04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016791	16791	33100060910	2016/11/1 15:32:38	5	13	04		2018-10-25 13:40:51	2018-10-25 16:41:49
731	109050506	20161101-0032228	109050500	FDCQ	330604012051GB00708F00040021	浙(2016)绍兴市上虞区不动产权第0016764号	共同共有	百官街道大通水尚名都5幢12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016764	16764	33100060902	2016/11/1 15:58:32	5	13	01		2018-10-25 13:40:51	2018-10-25 16:41:49
732	109051043	20161101-0032221	109051037	FDCQ	330604012051GB00708F00040099	浙(2016)绍兴市上虞区不动产权第0016605号	共同共有	百官街道大通水尚名都5幢903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016605	16605	33100060802	2016/11/1 16:20:26	5	9	03		2018-10-25 13:40:51	2018-10-25 16:41:49
733	109155087	20161111-0034330	109155081	FDCQ	330604012051GB00708F00120007	浙(2016)绍兴市上虞区不动产权第0018146号	共同共有	百官街道大通水尚名都12幢1单元1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018146	18146	33100062084	2016/11/11 10:33:30	12	11	03	1	2018-10-25 13:40:51	2018-10-25 16:41:49
734	109155134	20161111-0034332	109155128	FDCQ	330604012051GB00708F00060087	浙(2016)绍兴市上虞区不动产权第0017740号	共同共有	百官街道大通水尚名都7幢1单元603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017740	17740	33100061439	2016/11/11 10:35:15	7	6	03	1	2018-10-25 13:40:51	2018-10-25 16:41:49
735	109157664	20161111-0034385	109157658	FDCQ	330604012051GB00708F00100081	浙(2016)绍兴市上虞区不动产权第0018002号	单独所有	百官街道大通水尚名都11幢2单元705室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018002	18002	33100062110	2016/11/11 11:40:14	11	7	05	2	2018-10-25 13:40:51	2018-10-25 16:41:49
736	109171844	20161114-0034689	109171838	FDCQ	330604012051GB00708F00120041	浙(2016)绍兴市上虞区不动产权第0017866号	共同共有	百官街道大通水尚名都12幢1单元901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017866	17866	33100061478	2016/11/14 14:42:58	12	9	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
737	109172077	20161114-0034695	109172071	FDCQ	330604012051GB00708F00030029	浙(2016)绍兴市上虞区不动产权第0018028号	共同共有	百官街道大通水尚名都3幢1601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018028	18028	33100062048	2016/11/14 14:49:36	3	16	01		2018-10-25 13:40:51	2018-10-25 16:41:49
738	109173143	20161114-0034718	109173137	FDCQ	330604012051GB00708F00120074	浙(2016)绍兴市上虞区不动产权第0018034号	共同共有	百官街道大通水尚名都12幢2单元306室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018034	18034	33100062051	2016/11/14 15:21:14	12	3	06	2	2018-10-25 13:40:51	2018-10-25 16:41:49
739	109249283	20161122-0036430	109249277	FDCQ	330604012051GB00708F00090003	浙(2016)绍兴市上虞区不动产权第0018899号	共同共有	百官街道大通水尚名都10幢1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018899	18899	33100063223	2016/11/22 16:11:34	10	10	03		2018-10-25 13:40:51	2018-10-25 16:41:49
740	109153824	20161111-0034295	109153819	FDCQ	330604012051GB00708F00080071	浙(2016)绍兴市上虞区不动产权第0018029号	单独所有	百官街道大通水尚名都9幢2单元1603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018029	18029	33100062122	2016/11/11 9:44:15	9	16	03	2	2018-10-25 13:40:51	2018-10-25 16:41:49
741	109150409	20161110-0034207	109150403	FDCQ	330604012051GB00708F00060030	浙(2016)绍兴市上虞区不动产权第0017543号	共同共有	百官街道大通水尚名都7幢1单元1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017543	17543	33100061273	2016/11/10 15:23:52	7	16	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
742	109154105	20161111-0034301	109154099	FDCQ	330604012051GB00708F00030111	浙(2016)绍兴市上虞区不动产权第0017678号	共同共有	百官街道大通水尚名都3幢603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017678	17678	33100061415	2016/11/11 9:57:23	3	6	03		2018-10-25 13:40:51	2018-10-25 16:41:49
750	109143335	20161110-0034049	109143329	FDCQ	330604012051GB00708F00060039	浙(2016)绍兴市上虞区不动产权第0017569号	共同共有	百官街道大通水尚名都7幢1单元17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017569	17569	33100061288	2016/11/10 10:08:22	7	18	03	1	2018-10-25 13:40:51	2018-10-25 16:42:54
751	108999264	20161026-0031116	108999258	FDCQ	330604012051GB00708F00070069	浙(2016)绍兴市上虞区不动产权第0016213号	共同共有	百官街道大通水尚名都8幢2单元1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016213	16213	33100060039	2016/10/26 15:25:22	8	15	03	2	2018-10-25 13:40:51	2018-10-25 16:42:54
752	109002540	20161027-0031185	109002535	FDCQ	330604012051GB00708F00040062	浙(2016)绍兴市上虞区不动产权第0016189号	单独所有	百官街道大通水尚名都5幢2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016189	16189	33100060309	2016/10/27 9:33:32	5	23	02		2018-10-25 13:40:51	2018-10-25 16:42:54
753	109002338	20161027-0031179	109002332	FDCQ	330604012051GB00708F00010021	浙(2016)绍兴市上虞区不动产权第0016184号	共同共有	百官街道大通水尚名都1幢1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016184	16184	33100060307	2016/10/27 9:27:25	1	15	03		2018-10-25 13:40:51	2018-10-25 16:42:54
754	109277382	20161125-0037021	109277376	FDCQ	330604012051GB00708F00060091	浙(2016)绍兴市上虞区不动产权第0019309号	共同共有	百官街道大通水尚名都7幢1单元703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019309	19309	33100063719	2016/11/25 14:25:21	7	7	03	1	2018-10-25 13:40:51	2018-10-25 16:42:54
755	109003270	20161027-0031200	109003264	FDCQ	330604012051GB00708F00010018	浙(2016)绍兴市上虞区不动产权第0016170号	共同共有	百官街道大通水尚名都1幢12B03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016170	16170	33100060019	2016/10/27 9:55:01	1	13	03		2018-10-25 13:40:51	2018-10-25 16:42:54
744	109154739	20161111-0034320	109154733	FDCQ	330604012051GB00708F00060034	浙(2016)绍兴市上虞区不动产权第0017742号	共同共有	百官街道大通水尚名都7幢1单元1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017742	17742	33100061440	2016/11/11 10:20:38	7	17	02	1	2018-10-25 13:40:51	2018-10-25 16:41:49
745	109268916	20161124-0036835	109268910	FDCQ	330604012051GB00708F00120020	浙(2016)绍兴市上虞区不动产权第0018870号	共同共有	百官街道大通水尚名都12幢1单元1704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018870	18870	33100063035	2016/11/24 15:59:15	12	17	04	1	2018-10-25 13:40:51	2018-10-25 16:41:49
746	109310311	20161130-0037734	109310306	FDCQ	330604012051GB00708F00090071	浙(2016)绍兴市上虞区不动产权第0019661号	单独所有	百官街道大通水尚名都10幢2503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019661	19661	33100063894	2016/11/30 10:48:25	10	25	03		2018-10-25 13:40:51	2018-10-25 16:41:49
747	109014250	20161028-0031446	109014244	FDCQ	330604012051GB00708F00050039	浙(2016)绍兴市上虞区不动产权第0016471号	共同共有	百官街道大通水尚名都6幢17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016471	16471	33100060420	2016/10/28 10:00:16	6	18	03		2018-10-25 13:40:51	2018-10-25 16:41:49
748	109079666	20161103-0032719	109079658	FDCQ	330604012051GB00708F00060089	浙(2016)绍兴市上虞区不动产权第0017252号	共同共有	百官街道大通水尚名都7幢1单元701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017252	17252	33100061105	2016/11/3 15:07:31	7	7	01	1	2018-10-25 13:40:51	2018-10-25 16:41:49
749	109052542	20161102-0032260	109052536	FDCQ	330604012051GB00708F00060185	浙(2016)绍兴市上虞区不动产权第0017074号	共同共有	百官街道大通水尚名都7幢2单元605室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017074	17074	33100060957	2016/11/2 8:56:34	7	6	05	2	2018-10-25 13:40:51	2018-10-25 16:41:49
756	109064158	20161102-0032453	109064152	FDCQ	330604012051GB00708F00050037	浙(2016)绍兴市上虞区不动产权第0016796号	共同共有	百官街道大通水尚名都6幢17A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016796	16796	33100060862	2016/11/2 14:52:32	6	18	01		2018-10-25 13:40:51	2018-10-25 16:41:53
758	109065435	20161102-0032487	109065429	FDCQ	330604012051GB00708F00030109	浙(2016)绍兴市上虞区不动产权第0017012号	共同共有	百官街道大通水尚名都3幢601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017012	17012	33100060955	2016/11/2 15:27:04	3	6	01		2018-10-25 13:40:51	2018-10-25 16:41:53
759	109068875	20161103-0032533	109068869	FDCQ	330604012051GB00708F00060092	浙(2016)绍兴市上虞区不动产权第0017306号	共同共有	百官街道大通水尚名都7幢1单元704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017306	17306	33100061131	2016/11/3 9:00:28	7	7	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
760	109068858	20161103-0032534	109068852	FDCQ	330604012051GB00708F00120064	浙(2016)绍兴市上虞区不动产权第0017249号	共同共有	百官街道大通水尚名都12幢2单元1708室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017249	17249	33100061072	2016/11/3 8:59:29	12	17	08	2	2018-10-25 13:40:51	2018-10-25 16:41:53
761	109069024	20161024-0030518	109069019	FDCQ	330604012051GB00708F00100038	浙(2016)绍兴市上虞区不动产权第0016307号	单独所有	百官街道大通水尚名都11幢1单元702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016307	16307	33100060348	2016/11/3 9:09:04	11	7	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
762	109069000	20161103-0032542	109068994	FDCQ	330604012051GB00708F00050051	浙(2016)绍兴市上虞区不动产权第0017253号	共同共有	百官街道大通水尚名都6幢203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.09㎡/房屋建筑面积89.23㎡	5.09	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017253	17253	33100061106	2016/11/3 9:08:30	6	2	03		2018-10-25 13:40:51	2018-10-25 16:41:53
763	109025825	20161031-0031720	109025816	FDCQ	330604012051GB00708F00040012	浙(2016)绍兴市上虞区不动产权第0016625号	共同共有	百官街道大通水尚名都5幢1104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016625	16625	33100060768	2016/10/31 10:07:21	5	11	04		2018-10-25 13:40:51	2018-10-25 16:41:53
764	109128313	20161109-0033711	109128307	FDCQ	330604012051GB00708F00050035	浙(2016)绍兴市上虞区不动产权第0017434号	共同共有	百官街道大通水尚名都6幢1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017434	17434	33100061227	2016/11/9 8:52:56	6	17	03		2018-10-25 13:40:51	2018-10-25 16:41:53
765	109085940	20161104-0032826	109085935	FDCQ	330604012051GB00708F00050074	浙(2016)绍兴市上虞区不动产权第0017330号	单独所有	百官街道大通水尚名都6幢302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017330	17330	33100061141	2016/11/4 9:30:32	6	3	02		2018-10-25 13:40:51	2018-10-25 16:41:53
766	109038145	20161101-0031948	109038139	FDCQ	330604012051GB00708F00060068	浙(2016)绍兴市上虞区不动产权第0016585号	共同共有	百官街道大通水尚名都7幢1单元23A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	资料详见1幢。	浙	绍兴市上虞区	2016	0016585	16585	33100060755	2016/11/1 9:18:13	7	24	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
767	109085954	20161104-0032831	109085948	FDCQ	330604012051GB00708F00050075	浙(2016)绍兴市上虞区不动产权第0017272号	共同共有	百官街道大通水尚名都6幢303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017272	17272	33100061120	2016/11/4 9:30:43	6	3	03		2018-10-25 13:40:51	2018-10-25 16:41:53
768	109091639	20161104-0032927	109091633	FDCQ	330604012051GB00708F00040066	浙(2016)绍兴市上虞区不动产权第0017270号	共同共有	百官街道大通水尚名都5幢23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017270	17270	33100061119	2016/11/4 14:27:32	5	24	02		2018-10-25 13:40:51	2018-10-25 16:41:53
769	109039323	20161101-0031981	109039317	FDCQ	330604012051GB00708F00040006	浙(2016)绍兴市上虞区不动产权第0016785号	共同共有	百官街道大通水尚名都5幢102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积89.23㎡	5.03	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016785	16785	33100060907	2016/11/1 9:31:30	5	1	02		2018-10-25 13:40:51	2018-10-25 16:41:53
770	109192740	20161116-0035078	109192734	FDCQ	330604012051GB00708F00070052	浙(2016)绍兴市上虞区不动产权第0018340号	共同共有	百官街道大通水尚名都8幢1单元602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018340	18340	33100062338	2016/11/16 10:59:07	8	6	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
772	109096624	20161103-0032691	109096618	FDCQ	330604012051GB00708F00080046	浙(2016)绍兴市上虞区不动产权第0016895号	共同共有	百官街道大通水尚名都9幢1单元302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016895	16895	33100060889	2016/11/7 8:58:21	9	3	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
773	109096952	20161107-0033041	109096946	FDCQ	330604012051GB00708F00060186	浙(2016)绍兴市上虞区不动产权第0017156号	共同共有	百官街道大通水尚名都7幢2单元606室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017156	17156	33100061030	2016/11/7 9:10:10	7	6	06	2	2018-10-25 13:40:51	2018-10-25 16:41:53
774	109096770	20161107-0033038	109096762	FDCQ	330604012051GB00708F00060117	浙(2016)绍兴市上虞区不动产权第0017455号	共同共有	百官街道大通水尚名都7幢2单元12A05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017455	17455	33100061185	2016/11/7 9:03:02	7	13	05	2	2018-10-25 13:40:51	2018-10-25 16:41:53
775	109096974	20161107-0033040	109096969	FDCQ	330604012051GB00708F00070066	浙(2016)绍兴市上虞区不动产权第0017494号	单独所有	百官街道大通水尚名都8幢2单元12A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017494	17494	33100061255	2016/11/7 9:10:44	8	13	04	2	2018-10-25 13:40:51	2018-10-25 16:41:53
776	109097279	20161107-0033060	109097273	FDCQ	330604012051GB00708F00040076	浙(2016)绍兴市上虞区不动产权第0017173号	共同共有	百官街道大通水尚名都5幢304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017173	17173	33100061037	2016/11/7 9:19:50	5	3	04		2018-10-25 13:40:51	2018-10-25 16:41:53
777	109097152	20161107-0033046	109097146	FDCQ	330604012051GB00708F00040044	浙(2016)绍兴市上虞区不动产权第0017168号	共同共有	百官街道大通水尚名都5幢1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017168	17168	33100061035	2016/11/7 9:16:59	5	19	04		2018-10-25 13:40:51	2018-10-25 16:41:53
778	109097220	20161107-0033059	109097214	FDCQ	330604012051GB00708F00050079	浙(2016)绍兴市上虞区不动产权第0017449号	共同共有	百官街道大通水尚名都6幢3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017449	17449	33100061183	2016/11/7 9:18:09	6	4	03		2018-10-25 13:40:51	2018-10-25 16:41:53
779	109097473	20161107-0033063	109097467	FDCQ	330604012051GB00708F00060040	浙(2016)绍兴市上虞区不动产权第0017463号	共同共有	百官街道大通水尚名都7幢1单元17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017463	17463	33100061189	2016/11/7 9:25:15	7	18	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
780	109097527	20161107-0033067	109097522	FDCQ	330604012051GB00708F00060016	浙(2016)绍兴市上虞区不动产权第0017529号	单独所有	百官街道大通水尚名都7幢1单元1204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017529	17529	33100061305	2016/11/7 9:26:47	7	12	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
781	109141058	20161110-0033992	109141052	FDCQ	330604012051GB00708F00120079	浙(2016)绍兴市上虞区不动产权第0017955号	共同共有	百官街道大通水尚名都12幢2单元507室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017955	17955	33100062102	2016/11/10 8:56:19	12	5	07	2	2018-10-25 13:40:51	2018-10-25 16:41:53
782	109190917	20161116-0035118	109190912	FDCQ	330604012051GB00708F00090120	浙(2016)绍兴市上虞区不动产权第0018316号	单独所有	百官街道大通水尚名都10幢904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018316	18316	33100062327	2016/11/16 9:56:08	10	9	04		2018-10-25 13:40:51	2018-10-25 16:41:53
783	109309581	20161130-0037715	109309575	FDCQ	330604012051GB00708F00060162	浙(2016)绍兴市上虞区不动产权第0019625号	共同共有	百官街道大通水尚名都7幢2单元2306室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019625	19625	33100063875	2016/11/30 10:29:28	7	23	06	2	2018-10-25 13:40:51	2018-10-25 16:41:53
784	109066458	20161102-0032495	109066452	FDCQ	330604012051GB00708F00030032	浙(2016)绍兴市上虞区不动产权第0017076号	共同共有	百官街道大通水尚名都3幢1604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017076	17076	33100060958	2016/11/2 15:50:18	3	16	04		2018-10-25 13:40:51	2018-10-25 16:41:53
786	109019152	20161028-0031559	109019147	FDCQ	330604012051GB00708F00040081	浙(2016)绍兴市上虞区不动产权第0016687号	单独所有	百官街道大通水尚名都5幢501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016687	16687	33100060827	2016/10/28 14:20:18	5	5	01		2018-10-25 13:40:51	2018-10-25 16:41:53
787	109019481	20161028-0031563	109019467	FDCQ	330604012051GB00708F00020005	浙(2016)绍兴市上虞区不动产权第0016540号	共同共有	百官街道大通水尚名都2幢1101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016540	16540	33100060743	2016/10/28 14:31:00	2	11	01		2018-10-25 13:40:51	2018-10-25 16:41:53
788	109019697	20161028-0031571	109019692	FDCQ	330604012051GB00708F00090114	浙(2016)绍兴市上虞区不动产权第0016472号	单独所有	百官街道大通水尚名都10幢802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016472	16472	33100060421	2016/10/28 14:39:34	10	8	02		2018-10-25 13:40:51	2018-10-25 16:41:53
789	109021474	20161028-0031618	109021469	FDCQ	330604012051GB00708F00010052	浙(2016)绍兴市上虞区不动产权第0016684号	单独所有	百官街道大通水尚名都1幢2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016684	16684	33100060784	2016/10/28 15:37:54	1	25	01		2018-10-25 13:40:51	2018-10-25 16:41:53
790	108977989	20161024-0030655	108977983	FDCQ	330604012051GB00708F00010059	浙(2016)绍兴市上虞区不动产权第0016042号	共同共有	百官街道大通水尚名都1幢2702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016042	16042	33100059975	2016/10/24 15:34:30	1	27	02		2018-10-25 13:40:51	2018-10-25 16:41:53
791	108978264	20161024-0030664	108978258	FDCQ	330604012051GB00708F00010049	浙(2016)绍兴市上虞区不动产权第0016267号	共同共有	百官街道大通水尚名都1幢23A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016267	16267	33100060333	2016/10/24 15:44:43	1	24	01		2018-10-25 13:40:51	2018-10-25 16:41:53
792	108978868	20161024-0030673	108978862	FDCQ	330604012051GB00708F00030049	浙(2016)绍兴市上虞区不动产权第0016054号	共同共有	百官街道大通水尚名都3幢201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016054	16054	33100059983	2016/10/24 16:13:18	3	2	01		2018-10-25 13:40:51	2018-10-25 16:41:53
793	109081774	20161103-0032767	109081768	FDCQ	330604012051GB00708F00080081	浙(2016)绍兴市上虞区不动产权第0017193号	共同共有	百官街道大通水尚名都9幢2单元203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017193	17193	33100060989	2016/11/3 15:55:27	9	2	03	2	2018-10-25 13:40:51	2018-10-25 16:41:53
794	109207486	20161117-0035492	109207480	FDCQ	330604012051GB00708F00050078	浙(2016)绍兴市上虞区不动产权第0018550号	共同共有	百官街道大通水尚名都6幢3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018550	18550	33100062806	2016/11/17 14:22:31	6	4	02		2018-10-25 13:40:51	2018-10-25 16:41:53
795	109207780	20161117-0035500	109207774	FDCQ	330604012051GB00708F00070100	浙(2016)绍兴市上虞区不动产权第0018393号	共同共有	百官街道大通水尚名都8幢2单元2904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018393	18393	33100062360	2016/11/17 14:30:22	8	29	04	2	2018-10-25 13:40:51	2018-10-25 16:41:53
796	109208275	20161117-0035508	109208269	FDCQ	330604012051GB00708F00070113	浙(2016)绍兴市上虞区不动产权第0018540号	共同共有	百官街道大通水尚名都8幢2单元803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018540	18540	33100062803	2016/11/17 14:42:35	8	8	03	2	2018-10-25 13:40:51	2018-10-25 16:41:53
797	109003560	20161027-0031207	109003554	FDCQ	330604012051GB00708F00040042	浙(2016)绍兴市上虞区不动产权第0016193号	共同共有	百官街道大通水尚名都5幢1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016193	16193	33100060029	2016/10/27 10:02:44	5	19	02		2018-10-25 13:40:51	2018-10-25 16:41:53
798	109069282	20161103-0032551	109069276	FDCQ	330604012051GB00708F00050050	浙(2016)绍兴市上虞区不动产权第0017254号	共同共有	百官街道大通水尚名都6幢202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.09㎡/房屋建筑面积89.23㎡	5.09	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017254	17254	33100061107	2016/11/3 9:14:22	6	2	02		2018-10-25 13:40:51	2018-10-25 16:41:53
800	109025966	20161031-0031736	109025960	FDCQ	330604012051GB00708F00060020	浙(2016)绍兴市上虞区不动产权第0016340号	共同共有	百官街道大通水尚名都7幢1单元12A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016340	16340	33100060823	2016/10/31 10:10:01	7	13	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
801	109026006	20161031-0031737	109026000	FDCQ	330604012051GB00708F00010080	浙(2016)绍兴市上虞区不动产权第0016419号	共同共有	百官街道大通水尚名都1幢502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016419	16419	33100060401	2016/10/31 10:11:12	1	5	02		2018-10-25 13:40:51	2018-10-25 16:41:53
802	109026543	20161031-0031749	109026538	FDCQ	330604012051GB00708F00030115	浙(2016)绍兴市上虞区不动产权第0016413号	单独所有	百官街道大通水尚名都3幢703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016413	16413	33100060398	2016/10/31 10:32:24	3	7	03		2018-10-25 13:40:51	2018-10-25 16:41:53
803	109377147	20161207-0039210	109377141	FDCQ	330604012051GB00708F00090005	浙(2016)绍兴市上虞区不动产权第0020500号	共同共有	百官街道大通水尚名都10幢101室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020500	20500	33100064918	2016/12/7 9:43:45	10	1	01		2018-10-25 13:40:51	2018-10-25 16:41:53
804	109039427	20161101-0031978	109039421	FDCQ	330604012051GB00708F00030007	浙(2016)绍兴市上虞区不动产权第0016793号	共同共有	百官街道大通水尚名都3幢103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.48㎡/房屋建筑面积102.31㎡	4.48	102.31	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016793	16793	33100060911	2016/11/1 9:34:45	3	1	03		2018-10-25 13:40:51	2018-10-25 16:41:53
805	109086715	20161104-0032845	109086709	FDCQ	330604012051GB00708F00070030	浙(2016)绍兴市上虞区不动产权第0017289号	共同共有	百官街道大通水尚名都8幢1单元2302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017289	17289	33100061126	2016/11/4 9:52:03	8	23	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
806	109096530	20161103-0032613	109096521	FDCQ	330604012051GB00708F00030016	浙(2016)绍兴市上虞区不动产权第0016891号	单独所有	百官街道大通水尚名都3幢1204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016891	16891	33100060887	2016/11/7 8:55:10	3	12	04		2018-10-25 13:40:51	2018-10-25 16:41:53
807	109096768	20161107-0033039	109096756	FDCQ	330604012051GB00708F00040004	浙(2016)绍兴市上虞区不动产权第0017175号	共同共有	百官街道大通水尚名都5幢1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017175	17175	33100061038	2016/11/7 9:03:01	5	10	04		2018-10-25 13:40:51	2018-10-25 16:41:53
808	109098481	20161107-0033090	109098473	FDCQ	330604012051GB00708F00060118	浙(2016)绍兴市上虞区不动产权第0017458号	共同共有	百官街道大通水尚名都7幢2单元12A06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017458	17458	33100061186	2016/11/7 9:50:42	7	13	06	2	2018-10-25 13:40:51	2018-10-25 16:41:53
809	109097837	20161107-0033074	109097831	FDCQ	330604012051GB00708F00080040	浙(2016)绍兴市上虞区不动产权第0017415号	共同共有	百官街道大通水尚名都9幢1单元2802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017415	17415	33100061166	2016/11/7 9:34:49	9	28	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
810	109097897	20161107-0033075	109097891	FDCQ	330604012051GB00708F00070065	浙(2016)绍兴市上虞区不动产权第0017491号	共同共有	百官街道大通水尚名都8幢2单元12A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017491	17491	33100061254	2016/11/7 9:36:40	8	13	03	2	2018-10-25 13:40:51	2018-10-25 16:41:53
811	109098110	20161107-0033084	109098104	FDCQ	330604012051GB00708F00040017	浙(2016)绍兴市上虞区不动产权第0017479号	共同共有	百官街道大通水尚名都5幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017479	17479	33100061196	2016/11/7 9:41:27	5	13	01		2018-10-25 13:40:51	2018-10-25 16:41:53
812	109098124	20161107-0033081	109098119	FDCQ	330604012051GB00708F00060096	浙(2016)绍兴市上虞区不动产权第0017158号	单独所有	百官街道大通水尚名都7幢1单元804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017158	17158	33100061031	2016/11/7 9:42:04	7	8	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
814	109103242	20161107-0033115	109103236	FDCQ	330604012051GB00708F00070109	浙(2016)绍兴市上虞区不动产权第0017214号	共同共有	百官街道大通水尚名都8幢2单元603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017214	17214	33100061057	2016/11/7 10:19:35	8	6	03	2	2018-10-25 13:40:51	2018-10-25 16:41:53
815	109105825	20161107-0033164	109105819	FDCQ	330604012051GB00708F00100035	浙(2016)绍兴市上虞区不动产权第0017437号	共同共有	百官街道大通水尚名都11幢1单元503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017437	17437	33100061177	2016/11/7 11:16:48	11	5	03	1	2018-10-25 13:40:51	2018-10-25 16:41:53
816	109224023	20161118-0035874	109224017	FDCQ	330604012051GB00708F00060013	浙(2016)绍兴市上虞区不动产权第0018538号	共同共有	百官街道大通水尚名都7幢1单元1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018538	18538	33100062412	2016/11/18 16:31:08	7	12	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
817	109224103	20161118-0035877	109224097	FDCQ	330604012051GB00708F00080026	浙(2016)绍兴市上虞区不动产权第0018566号	共同共有	百官街道大通水尚名都9幢1单元2102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018566	18566	33100062423	2016/11/18 16:34:51	9	21	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
818	109224291	20161118-0035881	109224285	FDCQ	330604012051GB00708F00080065	浙(2016)绍兴市上虞区不动产权第0018563号	共同共有	百官街道大通水尚名都9幢2单元12A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018563	18563	33100062421	2016/11/18 16:42:26	9	13	03	2	2018-10-25 13:40:51	2018-10-25 16:41:53
819	109067463	20161102-0032511	109067456	FDCQ	330604012051GB00708F00070010	浙(2016)绍兴市上虞区不动产权第0017082号	共同共有	百官街道大通水尚名都8幢1单元12B02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017082	17082	33100060962	2016/11/2 16:23:26	8	13	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
820	109122276	20161108-0033576	109122270	FDCQ	330604012051GB00708F00120063	浙(2016)绍兴市上虞区不动产权第0017564号	共同共有	百官街道大通水尚名都12幢2单元1707室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017564	17564	33100061320	2016/11/8 14:39:19	12	17	07	2	2018-10-25 13:40:51	2018-10-25 16:41:53
821	109122288	20161108-0033570	109122283	FDCQ	330604012051GB00708F00090095	浙(2016)绍兴市上虞区不动产权第0017642号	单独所有	百官街道大通水尚名都10幢303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017642	17642	33100061342	2016/11/8 14:39:30	10	3	03		2018-10-25 13:40:51	2018-10-25 16:41:53
822	109208358	20161117-0035510	109208353	FDCQ	330604012051GB00708F00060143	浙(2016)绍兴市上虞区不动产权第0018548号	单独所有	百官街道大通水尚名都7幢2单元1907室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018548	18548	33100062805	2016/11/17 14:44:10	7	19	07	2	2018-10-25 13:40:51	2018-10-25 16:41:53
823	109058096	20161102-0032351	109058090	FDCQ	330604012051GB00708F00120072	浙(2016)绍兴市上虞区不动产权第0016929号	共同共有	百官街道大通水尚名都12幢2单元2108室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016929	16929	33100060899	2016/11/2 10:56:44	12	21	08	2	2018-10-25 13:40:51	2018-10-25 16:41:53
824	109277968	20161125-0037031	109277962	FDCQ	330604012051GB00708F00080012	浙(2016)绍兴市上虞区不动产权第0019015号	共同共有	百官街道大通水尚名都9幢1单元1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019015	19015	33100063258	2016/11/25 14:47:00	9	15	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
825	109278221	20161125-0037047	109278215	FDCQ	330604012051GB00708F00010007	浙(2016)绍兴市上虞区不动产权第0019234号	共同共有	百官街道大通水尚名都1幢1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019234	19234	33100063293	2016/11/25 14:53:27	1	11	01		2018-10-25 13:40:51	2018-10-25 16:41:53
826	109008135	20161027-0031304	109008130	FDCQ	330604012051GB00708F00010050	浙(2016)绍兴市上虞区不动产权第0016124号	单独所有	百官街道大通水尚名都1幢23A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016124	16124	33100059997	2016/10/27 14:58:20	1	24	02		2018-10-25 13:40:51	2018-10-25 16:41:53
828	109079778	20161103-0032725	109079772	FDCQ	330604012051GB00708F00040032	浙(2016)绍兴市上虞区不动产权第0017251号	共同共有	百官街道大通水尚名都5幢1604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017251	17251	33100061073	2016/11/3 15:10:57	5	16	04		2018-10-25 13:40:51	2018-10-25 16:41:53
829	109080200	20161103-0032731	109080193	FDCQ	330604012051GB00708F00060100	浙(2016)绍兴市上虞区不动产权第0017246号	共同共有	百官街道大通水尚名都7幢1单元904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017246	17246	33100061102	2016/11/3 15:19:13	7	9	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
830	109073339	20161103-0032623	109073333	FDCQ	330604012051GB00708F00060153	浙(2016)绍兴市上虞区不动产权第0017240号	共同共有	百官街道大通水尚名都7幢2单元2105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017240	17240	33100061000	2016/11/3 11:03:20	7	21	05	2	2018-10-25 13:40:51	2018-10-25 16:41:53
831	109027776	20161031-0031776	109027770	FDCQ	330604012051GB00708F00060051	浙(2016)绍兴市上虞区不动产权第0016654号	共同共有	百官街道大通水尚名都7幢1单元203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016654	16654	33100060824	2016/10/31 11:16:49	7	2	03	1	2018-10-25 13:40:51	2018-10-25 16:41:53
832	109030027	20161031-0031824	109030022	FDCQ	330604012051GB00708F00030080	浙(2016)绍兴市上虞区不动产权第0016411号	单独所有	百官街道大通水尚名都3幢2704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016411	16411	33100060397	2016/10/31 14:25:16	3	27	04		2018-10-25 13:40:51	2018-10-25 16:41:53
833	109030945	20161031-0031839	109030939	FDCQ	330604012051GB00708F00060084	浙(2016)绍兴市上虞区不动产权第0016648号	共同共有	百官街道大通水尚名都7幢1单元504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016648	16648	33100060821	2016/10/31 14:45:06	7	5	04	1	2018-10-25 13:40:51	2018-10-25 16:41:53
834	109099592	20161107-0033098	109099580	FDCQ	330604012051GB00708F00040047	浙(2016)绍兴市上虞区不动产权第0017481号	单独所有	百官街道大通水尚名都5幢2003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017481	17481	33100061197	2016/11/7 10:01:05	5	20	03		2018-10-25 13:40:51	2018-10-25 16:41:53
835	109103960	20161107-0033135	109103954	FDCQ	330604012051GB00708F00010075	浙(2016)绍兴市上虞区不动产权第0017199号	共同共有	百官街道大通水尚名都1幢3103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017199	17199	33100061048	2016/11/7 10:33:50	1	31	03		2018-10-25 13:40:51	2018-10-25 16:41:53
836	109103972	20161107-0033129	109103966	FDCQ	330604012051GB00708F00080088	浙(2016)绍兴市上虞区不动产权第0017414号	共同共有	百官街道大通水尚名都9幢2单元2304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017414	17414	33100061165	2016/11/7 10:34:10	9	23	04	2	2018-10-25 13:40:51	2018-10-25 16:41:53
837	109041233	20161101-0032033	109041227	FDCQ	330604012051GB00708F00090067	浙(2016)绍兴市上虞区不动产权第0016621号	共同共有	百官街道大通水尚名都10幢23A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016621	16621	33100060811	2016/11/1 10:11:21	10	24	03		2018-10-25 13:40:51	2018-10-25 16:41:53
838	109113416	20161108-0033356	109113410	FDCQ	330604012051GB00708F00060078	浙(2016)绍兴市上虞区不动产权第0017616号	共同共有	百官街道大通水尚名都7幢1单元3A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017616	17616	33100061341	2016/11/8 9:14:48	7	4	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
839	109177423	20161115-0034837	109177418	FDCQ	330604012051GB00708F00040091	浙(2016)绍兴市上虞区不动产权第0018202号	单独所有	百官街道大通水尚名都5幢703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018202	18202	33100062184	2016/11/15 9:30:38	5	7	03		2018-10-25 13:40:51	2018-10-25 16:41:53
840	109106143	20161107-0033168	109106137	FDCQ	330604012051GB00708F00050025	浙(2016)绍兴市上虞区不动产权第0017519号	共同共有	百官街道大通水尚名都6幢1501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017519	17519	33100061200	2016/11/7 11:25:05	6	15	01		2018-10-25 13:40:51	2018-10-25 16:41:53
850	109031603	20161031-0031857	109031597	FDCQ	330604012051GB00708F00120003	浙(2016)绍兴市上虞区不动产权第0016498号	共同共有	百官街道大通水尚名都12幢1单元103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016498	16498	33100060425	2016/10/31 14:54:13	12	1	03	1	2018-10-25 13:40:51	2018-10-25 16:42:54
851	109031667	20161031-0031849	109031661	FDCQ	330604012051GB00708F00050066	浙(2016)绍兴市上虞区不动产权第0016443号	共同共有	百官街道大通水尚名都6幢23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016443	16443	33100060408	2016/10/31 14:54:48	6	24	02		2018-10-25 13:40:51	2018-10-25 16:42:54
852	109032561	20161031-0031874	109032555	FDCQ	330604012051GB00708F00050088	浙(2016)绍兴市上虞区不动产权第0016487号	共同共有	百官街道大通水尚名都6幢604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016487	16487	33100060424	2016/10/31 15:18:18	6	6	04		2018-10-25 13:40:51	2018-10-25 16:42:54
853	109032821	20161031-0031878	109032815	FDCQ	330604012051GB00708F00030095	浙(2016)绍兴市上虞区不动产权第0016506号	共同共有	百官街道大通水尚名都3幢303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016506	16506	33100060430	2016/10/31 15:24:06	3	3	03		2018-10-25 13:40:51	2018-10-25 16:42:54
854	109000052	20161026-0031127	109000046	FDCQ	330604012051GB00708F00020031	浙(2016)绍兴市上虞区不动产权第0016065号	共同共有	百官街道大通水尚名都2幢2301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016065	16065	33100060274	2016/10/26 15:49:39	2	23	01		2018-10-25 13:40:51	2018-10-25 16:42:54
842	109108263	20161107-0033224	109108257	FDCQ	330604012051GB00708F00060134	浙(2016)绍兴市上虞区不动产权第0017530号	共同共有	百官街道大通水尚名都7幢2单元1706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017530	17530	33100061306	2016/11/7 14:22:29	7	17	06	2	2018-10-25 13:40:51	2018-10-25 16:41:53
843	109108086	20161107-0033217	109108080	FDCQ	330604012051GB00708F00070054	浙(2016)绍兴市上虞区不动产权第0017426号	共同共有	百官街道大通水尚名都8幢1单元702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017426	17426	33100061172	2016/11/7 14:19:56	8	7	02	1	2018-10-25 13:40:51	2018-10-25 16:41:53
844	109128962	20161109-0033728	109128956	FDCQ	330604012051GB00708F00100037	浙(2016)绍兴市上虞区不动产权第0017781号	共同共有	百官街道大通水尚名都11幢1单元701室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017781	17781	33100061383	2016/11/9 9:12:34	11	7	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
845	109225514	20161121-0035906	109225508	FDCQ	330604012051GB00708F00090110	浙(2016)绍兴市上虞区不动产权第0018736号	共同共有	百官街道大通水尚名都10幢702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018736	18736	33100062483	2016/11/21 9:21:25	10	7	02		2018-10-25 13:40:51	2018-10-25 16:41:53
846	109225461	20161121-0035905	109225450	FDCQ	330604012051GB00708F00080033	浙(2016)绍兴市上虞区不动产权第0018741号	共同共有	百官街道大通水尚名都9幢1单元2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018741	18741	33100062485	2016/11/21 9:20:26	9	25	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
847	109192760	20161116-0035099	109192754	FDCQ	330604012051GB00708F00100013	浙(2016)绍兴市上虞区不动产权第0018319号	共同共有	百官街道大通水尚名都11幢1单元1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018319	18319	33100062329	2016/11/16 10:59:23	11	15	01	1	2018-10-25 13:40:51	2018-10-25 16:41:53
848	109072690	20161103-0032620	109072684	FDCQ	330604012051GB00708F00040033	浙(2016)绍兴市上虞区不动产权第0016880号	共同共有	百官街道大通水尚名都5幢1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016880	16880	33100060881	2016/11/3 10:55:05	5	17	01		2018-10-25 13:40:51	2018-10-25 16:41:53
849	109031130	20161031-0031844	109031122	FDCQ	330604012051GB00708F00030006	浙(2016)绍兴市上虞区不动产权第0016439号	共同共有	百官街道大通水尚名都3幢102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.48㎡/房屋建筑面积102.31㎡	4.48	102.31	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016439	16439	33100060725	2016/10/31 14:49:22	3	1	02		2018-10-25 13:40:51	2018-10-25 16:41:53
856	109134062	20161109-0033835	109134056	FDCQ	330604012051GB00708F00040068	浙(2016)绍兴市上虞区不动产权第0017436号	共同共有	百官街道大通水尚名都5幢23A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017436	17436	33100061228	2016/11/9 11:41:03	5	24	04		2018-10-25 13:40:51	2018-10-25 16:41:58
857	109132258	20161109-0033797	109132252	FDCQ	330604012051GB00708F00100058	浙(2016)绍兴市上虞区不动产权第0017471号	共同共有	百官街道大通水尚名都11幢2单元1506室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017471	17471	33100061242	2016/11/9 10:46:42	11	15	06	2	2018-10-25 13:40:51	2018-10-25 16:41:58
858	109034638	20161031-0031914	109034632	FDCQ	330604012051GB00708F00060033	浙(2016)绍兴市上虞区不动产权第0016426号	共同共有	百官街道大通水尚名都7幢1单元1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016426	16426	33100060404	2016/10/31 16:28:29	7	17	01	1	2018-10-25 13:40:51	2018-10-25 16:41:58
859	109091843	20161104-0032936	109091837	FDCQ	330604012051GB00708F00010081	浙(2016)绍兴市上虞区不动产权第0017309号	共同共有	百官街道大通水尚名都1幢503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017309	17309	33100061132	2016/11/4 14:31:35	1	5	03		2018-10-25 13:40:51	2018-10-25 16:41:58
860	109091913	20161104-0032937	109091908	FDCQ	330604012051GB00708F00040078	浙(2016)绍兴市上虞区不动产权第0017332号	单独所有	百官街道大通水尚名都5幢3A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017332	17332	33100061142	2016/11/4 14:33:16	5	4	02		2018-10-25 13:40:51	2018-10-25 16:41:58
861	109095936	20161102-0032279	109095931	FDCQ	330604012051GB00708F00120060	浙(2016)绍兴市上虞区不动产权第0016772号	单独所有	百官街道大通水尚名都12幢2单元1508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016772	16772	33100060851	2016/11/4 16:48:05	12	15	08	2	2018-10-25 13:40:51	2018-10-25 16:41:58
862	109095948	20161102-0032470	109095942	FDCQ	330604012051GB00708F00070074	浙(2016)绍兴市上虞区不动产权第0016770号	共同共有	百官街道大通水尚名都8幢2单元1704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016770	16770	33100060850	2016/11/4 16:48:28	8	17	04	2	2018-10-25 13:40:51	2018-10-25 16:41:58
863	109179085	20161115-0034871	109179080	FDCQ	330604012051GB00708F00030026	浙(2016)绍兴市上虞区不动产权第0018072号	单独所有	百官街道大通水尚名都3幢1502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018072	18072	33100062062	2016/11/15 10:06:54	3	15	02		2018-10-25 13:40:51	2018-10-25 16:41:58
864	109180207	20161115-0034906	109180201	FDCQ	330604012051GB00708F00120061	浙(2016)绍兴市上虞区不动产权第0018159号	共同共有	百官街道大通水尚名都12幢2单元1705室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018159	18159	33100062165	2016/11/15 10:32:13	12	17	05	2	2018-10-25 13:40:51	2018-10-25 16:41:58
865	109180460	20161115-0034912	109180452	FDCQ	330604012051GB00708F00060055	浙(2016)绍兴市上虞区不动产权第0018093号	共同共有	百官街道大通水尚名都7幢1单元2103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018093	18093	33100062139	2016/11/15 10:38:11	7	21	03	1	2018-10-25 13:40:51	2018-10-25 16:41:58
866	109183764	20161115-0034970	109183758	FDCQ	330604012051GB00708F00060075	浙(2016)绍兴市上虞区不动产权第0018205号	共同共有	百官街道大通水尚名都7幢1单元303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018205	18205	33100062186	2016/11/15 14:33:50	7	3	03	1	2018-10-25 13:40:51	2018-10-25 16:41:58
867	108970625	20161024-0030500	108970619	FDCQ	330604012051GB00708F00060123	浙(2016)绍兴市上虞区不动产权第0015850号	共同共有	百官街道大通水尚名都7幢2单元12B07室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015850	15850	33100059731	2016/10/24 10:02:18	7	13	07	2	2018-10-25 13:40:51	2018-10-25 16:41:58
868	108970751	20161024-0030504	108970745	FDCQ	330604012051GB00708F00020040	浙(2016)绍兴市上虞区不动产权第0015950号	共同共有	百官街道大通水尚名都2幢2702室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015950	15950	33100059958	2016/10/24 10:04:10	2	27	02		2018-10-25 13:40:52	2018-10-25 16:41:58
870	109129254	20161109-0033734	109129248	FDCQ	330604012051GB00708F00090115	浙(2016)绍兴市上虞区不动产权第0017783号	共同共有	百官街道大通水尚名都10幢803室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017783	17783	33100061384	2016/11/9 9:19:58	10	8	03		2018-10-25 13:40:52	2018-10-25 16:41:58
871	109229697	20161121-0035989	109229691	FDCQ	330604012051GB00708F00100027	浙(2016)绍兴市上虞区不动产权第0018677号	共同共有	百官街道大通水尚名都11幢1单元2103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018677	18677	33100062468	2016/11/21 11:31:02	11	21	03	1	2018-10-25 13:40:52	2018-10-25 16:41:58
872	109122357	20161108-0033577	109122349	FDCQ	330604012051GB00708F00120024	浙(2016)绍兴市上虞区不动产权第0017329号	单独所有	百官街道大通水尚名都12幢1单元1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017329	17329	33100061202	2016/11/8 14:40:28	12	19	04	1	2018-10-25 13:40:52	2018-10-25 16:41:58
873	109084631	20161104-0032807	109084625	FDCQ	330604012051GB00708F00100003	浙(2016)绍兴市上虞区不动产权第0017011号	共同共有	百官街道大通水尚名都11幢1单元103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017011	17011	33100061013	2016/11/4 8:57:11	11	1	03	1	2018-10-25 13:40:52	2018-10-25 16:41:58
874	109084640	20161104-0032806	109084635	FDCQ	330604012051GB00708F00060156	浙(2016)绍兴市上虞区不动产权第0017155号	单独所有	百官街道大通水尚名都7幢2单元2108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017155	17155	33100060975	2016/11/4 8:57:43	7	21	08	2	2018-10-25 13:40:52	2018-10-25 16:41:58
875	109085264	20161104-0032813	109085258	FDCQ	330604012051GB00708F00040093	浙(2016)绍兴市上虞区不动产权第0017333号	共同共有	百官街道大通水尚名都5幢801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017333	17333	33100061143	2016/11/4 9:07:40	5	8	01		2018-10-25 13:40:52	2018-10-25 16:41:58
876	109085145	20161104-0032811	109085140	FDCQ	330604012051GB00708F00070042	浙(2016)绍兴市上虞区不动产权第0017015号	单独所有	百官街道大通水尚名都8幢1单元2902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017015	17015	33100061016	2016/11/4 9:03:44	8	29	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
877	109021131	20161028-0031610	109021125	FDCQ	330604012051GB00708F00010061	浙(2016)绍兴市上虞区不动产权第0016530号	共同共有	百官街道大通水尚名都1幢2801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016530	16530	33100060737	2016/10/28 15:28:02	1	28	01		2018-10-25 13:40:52	2018-10-25 16:41:58
878	109021145	20161028-0031608	109021139	FDCQ	330604012051GB00708F00010043	浙(2016)绍兴市上虞区不动产权第0016531号	共同共有	百官街道大通水尚名都1幢2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016531	16531	33100060738	2016/10/28 15:28:16	1	22	01		2018-10-25 13:40:52	2018-10-25 16:41:58
879	109187217	20161115-0035040	109187211	FDCQ	330604012051GB00708F00070072	浙(2016)绍兴市上虞区不动产权第0018095号	共同共有	百官街道大通水尚名都8幢2单元1604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018095	18095	33100062140	2016/11/15 16:16:03	8	16	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
880	109231978	20161121-0036044	109231972	FDCQ	330604012051GB00708F00060098	浙(2016)绍兴市上虞区不动产权第0018729号	共同共有	百官街道大通水尚名都7幢1单元902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018729	18729	33100062478	2016/11/21 14:27:31	7	9	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
881	108989760	20161025-0030913	108989753	FDCQ	330604012051GB00708F00060120	浙(2016)绍兴市上虞区不动产权第0016283号	共同共有	百官街道大通水尚名都7幢2单元12A08室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016283	16283	33100060336	2016/10/25 16:10:51	7	13	08	2	2018-10-25 13:40:52	2018-10-25 16:41:58
882	109042931	20161101-0032061	109042925	FDCQ	330604012051GB00708F00040070	浙(2016)绍兴市上虞区不动产权第0016552号	共同共有	百官街道大通水尚名都5幢2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016552	16552	33100060744	2016/11/1 10:59:03	5	25	02		2018-10-25 13:40:52	2018-10-25 16:41:58
884	109007137	20161027-0031287	109007132	FDCQ	330604012051GB00708F00040057	浙(2016)绍兴市上虞区不动产权第0016244号	单独所有	百官街道大通水尚名都5幢2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016244	16244	33100060328	2016/10/27 14:32:49	5	22	01		2018-10-25 13:40:52	2018-10-25 16:41:58
885	109007169	20161027-0031289	109007163	FDCQ	330604012051GB00708F00010069	浙(2016)绍兴市上虞区不动产权第0016174号	共同共有	百官街道大通水尚名都1幢3003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016174	16174	33100060021	2016/10/27 14:33:25	1	30	03		2018-10-25 13:40:52	2018-10-25 16:41:58
886	109007265	20161027-0031291	109007259	FDCQ	330604012051GB00708F00010015	浙(2016)绍兴市上虞区不动产权第0016186号	共同共有	百官街道大通水尚名都1幢12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016186	16186	33100060308	2016/10/27 14:36:56	1	13	03		2018-10-25 13:40:52	2018-10-25 16:41:58
887	109007814	20161027-0031298	109007808	FDCQ	330604012051GB00708F00030098	浙(2016)绍兴市上虞区不动产权第0016272号	共同共有	百官街道大通水尚名都3幢3102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016272	16272	33100060346	2016/10/27 14:51:40	3	31	02		2018-10-25 13:40:52	2018-10-25 16:41:58
888	109007951	20161027-0031303	109007944	FDCQ	330604012051GB00708F00020019	浙(2016)绍兴市上虞区不动产权第0016177号	共同共有	百官街道大通水尚名都2幢17A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016177	16177	33100060023	2016/10/27 14:53:40	2	18	01		2018-10-25 13:40:52	2018-10-25 16:41:58
889	109092098	20161104-0032943	109092092	FDCQ	330604012051GB00708F00070012	浙(2016)绍兴市上虞区不动产权第0017264号	共同共有	百官街道大通水尚名都8幢1单元1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017264	17264	33100061115	2016/11/4 14:37:07	8	15	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
890	109092349	20161104-0032947	109092343	FDCQ	330604012051GB00708F00120083	浙(2016)绍兴市上虞区不动产权第0017167号	共同共有	百官街道大通水尚名都12幢2单元707室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017167	17167	33100060981	2016/11/4 14:42:56	12	7	07	2	2018-10-25 13:40:52	2018-10-25 16:41:58
891	109092585	20161104-0032956	109092580	FDCQ	330604012051GB00708F00060178	浙(2016)绍兴市上虞区不动产权第0017165号	单独所有	百官街道大通水尚名都7幢2单元3A06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017165	17165	33100060980	2016/11/4 14:48:31	7	4	06	2	2018-10-25 13:40:52	2018-10-25 16:41:58
892	109092720	20161104-0032954	109092714	FDCQ	330604012051GB00708F00050040	浙(2016)绍兴市上虞区不动产权第0017368号	共同共有	百官街道大通水尚名都6幢17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017368	17368	33100061158	2016/11/4 14:52:41	6	18	04		2018-10-25 13:40:52	2018-10-25 16:41:58
893	109108228	20161107-0033220	109108222	FDCQ	330604012051GB00708F00060199	浙(2016)绍兴市上虞区不动产权第0017152号	共同共有	百官街道大通水尚名都7幢2单元907室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017152	17152	33100061029	2016/11/7 14:21:42	7	9	07	2	2018-10-25 13:40:52	2018-10-25 16:41:58
894	109108347	20161107-0033227	109108341	FDCQ	330604012051GB00708F00070041	浙(2016)绍兴市上虞区不动产权第0017423号	共同共有	百官街道大通水尚名都8幢1单元2901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017423	17423	33100061171	2016/11/7 14:23:53	8	29	01	1	2018-10-25 13:40:52	2018-10-25 16:41:58
895	109108578	20161107-0033233	109108571	FDCQ	330604012051GB00708F00050028	浙(2016)绍兴市上虞区不动产权第0017163号	共同共有	百官街道大通水尚名都6幢1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017163	17163	33100061033	2016/11/7 14:28:52	6	15	04		2018-10-25 13:40:52	2018-10-25 16:41:58
896	109109204	20161107-0033245	109109198	FDCQ	330604012051GB00708F00100039	浙(2016)绍兴市上虞区不动产权第0017495号	共同共有	百官街道大通水尚名都11幢1单元703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017495	17495	33100061256	2016/11/7 14:45:00	11	7	03	1	2018-10-25 13:40:52	2018-10-25 16:41:58
898	109181367	20161115-0034929	109181361	FDCQ	330604012051GB00708F00080011	浙(2016)绍兴市上虞区不动产权第0018198号	共同共有	百官街道大通水尚名都9幢1单元1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018198	18198	33100062202	2016/11/15 10:57:01	9	15	01	1	2018-10-25 13:40:52	2018-10-25 16:41:58
899	109197122	20161116-0035249	109197116	FDCQ	330604012051GB00708F00040041	浙(2016)绍兴市上虞区不动产权第0018352号	共同共有	百官街道大通水尚名都5幢1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018352	18352	33100062258	2016/11/16 14:52:22	5	19	01		2018-10-25 13:40:52	2018-10-25 16:41:58
900	109130363	20161109-0033752	109130357	FDCQ	330604012051GB00708F00090026	浙(2016)绍兴市上虞区不动产权第0017792号	共同共有	百官街道大通水尚名都10幢1502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017792	17792	33100061387	2016/11/9 9:50:53	10	15	02		2018-10-25 13:40:52	2018-10-25 16:41:58
901	109065332	20161102-0032484	109065326	FDCQ	330604012051GB00708F00070026	浙(2016)绍兴市上虞区不动产权第0017085号	共同共有	百官街道大通水尚名都8幢1单元2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017085	17085	33100060964	2016/11/2 15:23:30	8	21	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
902	109085180	20161104-0032809	109085174	FDCQ	330604012051GB00708F00060148	浙(2016)绍兴市上虞区不动产权第0017157号	共同共有	百官街道大通水尚名都7幢2单元2008室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017157	17157	33100060976	2016/11/4 9:04:37	7	20	08	2	2018-10-25 13:40:52	2018-10-25 16:41:58
903	109122404	20161108-0033574	109122398	FDCQ	330604012051GB00708F00030087	浙(2016)绍兴市上虞区不动产权第0017578号	共同共有	百官街道大通水尚名都3幢2903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017578	17578	33100061326	2016/11/8 14:41:45	3	29	03		2018-10-25 13:40:52	2018-10-25 16:41:58
904	109153030	20161111-0034274	109153024	FDCQ	330604012051GB00708F00080062	浙(2016)绍兴市上虞区不动产权第0017897号	共同共有	百官街道大通水尚名都9幢2单元1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017897	17897	33100062016	2016/11/11 8:55:15	9	11	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
905	109153103	20161111-0034276	109153097	FDCQ	330604012051GB00708F00060159	浙(2016)绍兴市上虞区不动产权第0017882号	共同共有	百官街道大通水尚名都7幢2单元2207室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017882	17882	33100062010	2016/11/11 9:00:47	7	22	07	2	2018-10-25 13:40:52	2018-10-25 16:41:58
906	109153648	20161111-0034290	109153642	FDCQ	330604012051GB00708F00080067	浙(2016)绍兴市上虞区不动产权第0018027号	共同共有	百官街道大通水尚名都9幢2单元12B03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018027	18027	33100062121	2016/11/11 9:33:24	9	13	03	2	2018-10-25 13:40:52	2018-10-25 16:41:58
907	109154623	20161111-0034315	109154618	FDCQ	330604012051GB00708F00050013	浙(2016)绍兴市上虞区不动产权第0017879号	单独所有	百官街道大通水尚名都6幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017879	17879	33100062009	2016/11/11 10:18:14	6	12	01		2018-10-25 13:40:52	2018-10-25 16:41:58
908	109154894	20161111-0034321	109154888	FDCQ	330604012051GB00708F00080036	浙(2016)绍兴市上虞区不动产权第0017894号	共同共有	百官街道大通水尚名都9幢1单元2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017894	17894	33100062015	2016/11/11 10:24:37	9	26	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
909	109040506	20161101-0032017	109040500	FDCQ	330604012051GB00708F00030104	浙(2016)绍兴市上虞区不动产权第0016755号	共同共有	百官街道大通水尚名都3幢3A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016755	16755	33100060800	2016/11/1 9:53:08	3	4	04		2018-10-25 13:40:52	2018-10-25 16:41:58
910	109041047	20161101-0032027	109041041	FDCQ	330604012051GB00708F00030106	浙(2016)绍兴市上虞区不动产权第0016758号	共同共有	百官街道大通水尚名都3幢502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016758	16758	33100060901	2016/11/1 10:05:59	3	5	02		2018-10-25 13:40:52	2018-10-25 16:41:58
912	109211903	20161118-0035579	109211898	FDCQ	330604012051GB00708F00090037	浙(2016)绍兴市上虞区不动产权第0018589号	单独所有	百官街道大通水尚名都10幢17A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018589	18589	33100062825	2016/11/18 9:05:02	10	18	01		2018-10-25 13:40:52	2018-10-25 16:41:58
913	108990883	20161026-0030932	108990877	FDCQ	330604012051GB00708F00010058	浙(2016)绍兴市上虞区不动产权第0016046号	共同共有	百官街道大通水尚名都1幢2701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016046	16046	33100059978	2016/10/26 8:56:13	1	27	01		2018-10-25 13:40:52	2018-10-25 16:41:58
914	108991622	20161026-0030951	108991617	FDCQ	330604012051GB00708F00010008	浙(2016)绍兴市上虞区不动产权第0016078号	单独所有	百官街道大通水尚名都1幢1102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016078	16078	33100060279	2016/10/26 9:17:59	1	11	02		2018-10-25 13:40:52	2018-10-25 16:41:58
915	109015496	20161028-0031469	109015491	FDCQ	330604012051GB00708F00090007	浙(2016)绍兴市上虞区不动产权第0016683号	单独所有	百官街道大通水尚名都10幢103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.51㎡/房屋建筑面积95.12㎡	4.51	95.12	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016683	16683	33100060825	2016/10/28 10:34:41	10	1	03		2018-10-25 13:40:52	2018-10-25 16:41:58
916	109015705	20161028-0031475	109015699	FDCQ	330604012051GB00708F00030002	浙(2016)绍兴市上虞区不动产权第0016533号	共同共有	百官街道大通水尚名都3幢1002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016533	16533	33100060739	2016/10/28 10:41:16	3	10	02		2018-10-25 13:40:52	2018-10-25 16:41:58
917	109019935	20161028-0031575	109019929	FDCQ	330604012051GB00708F00020050	浙(2016)绍兴市上虞区不动产权第0016690号	共同共有	百官街道大通水尚名都2幢702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016690	16690	33100060787	2016/10/28 14:51:04	2	7	02		2018-10-25 13:40:52	2018-10-25 16:41:58
918	109020202	20161028-0031582	109020196	FDCQ	330604012051GB00708F00010091	浙(2016)绍兴市上虞区不动产权第0016680号	共同共有	百官街道大通水尚名都1幢901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016680	16680	33100060783	2016/10/28 14:59:54	1	9	01		2018-10-25 13:40:52	2018-10-25 16:41:58
919	109093955	20161104-0032989	109093950	FDCQ	330604012051GB00708F00070034	浙(2016)绍兴市上虞区不动产权第0017263号	单独所有	百官街道大通水尚名都8幢1单元2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017263	17263	33100061114	2016/11/4 15:21:42	8	25	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
920	109136912	20161109-0033902	109136907	FDCQ	330604012051GB00708F00090066	浙(2016)绍兴市上虞区不动产权第0017789号	单独所有	百官街道大通水尚名都10幢23A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017789	17789	33100061453	2016/11/9 14:59:41	10	24	02		2018-10-25 13:40:52	2018-10-25 16:41:58
921	109094507	20161104-0032973	109094502	FDCQ	330604012051GB00708F00030044	浙(2016)绍兴市上虞区不动产权第0017268号	单独所有	百官街道大通水尚名都3幢1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017268	17268	33100061117	2016/11/4 15:35:42	3	19	04		2018-10-25 13:40:52	2018-10-25 16:41:58
922	109094771	20161104-0033000	109094765	FDCQ	330604012051GB00708F00060161	浙(2016)绍兴市上虞区不动产权第0017016号	共同共有	百官街道大通水尚名都7幢2单元2305室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017016	17016	33100061017	2016/11/4 15:40:52	7	23	05	2	2018-10-25 13:40:52	2018-10-25 16:41:58
923	109109259	20161107-0033247	109109253	FDCQ	330604012051GB00708F00040039	浙(2016)绍兴市上虞区不动产权第0017477号	共同共有	百官街道大通水尚名都5幢17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017477	17477	33100061195	2016/11/7 14:46:06	5	18	03		2018-10-25 13:40:52	2018-10-25 16:41:58
924	109109342	20161107-0033244	109109336	FDCQ	330604012051GB00708F00030041	浙(2016)绍兴市上虞区不动产权第0017521号	共同共有	百官街道大通水尚名都3幢1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017521	17521	33100061266	2016/11/7 14:48:37	3	19	01		2018-10-25 13:40:52	2018-10-25 16:41:58
926	109111488	20161107-0033306	109111482	FDCQ	330604012051GB00708F00080114	浙(2016)绍兴市上虞区不动产权第0017179号	共同共有	百官街道大通水尚名都9幢2单元804室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017179	17179	33100061040	2016/11/7 15:53:17	9	8	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
927	109200251	20161117-0035329	109200246	FDCQ	330604012051GB00708F00050071	浙(2016)绍兴市上虞区不动产权第0018388号	单独所有	百官街道大通水尚名都6幢2503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018388	18388	33100062272	2016/11/17 9:17:48	6	25	03		2018-10-25 13:40:52	2018-10-25 16:41:58
928	109200818	20161117-0035344	109200812	FDCQ	330604012051GB00708F00080016	浙(2016)绍兴市上虞区不动产权第0018396号	共同共有	百官街道大通水尚名都9幢1单元1702室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018396	18396	33100062275	2016/11/17 9:40:25	9	17	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
929	109208167	20161117-0035509	109208161	FDCQ	330604012051GB00708F00050029	浙(2016)绍兴市上虞区不动产权第0018391号	共同共有	百官街道大通水尚名都6幢1601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018391	18391	33100062273	2016/11/17 14:38:57	6	16	01		2018-10-25 13:40:52	2018-10-25 16:41:58
930	109208686	20161117-0035515	109208680	FDCQ	330604012051GB00708F00120054	浙(2016)绍兴市上虞区不动产权第0018382号	共同共有	百官街道大通水尚名都12幢2单元12A06室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018382	18382	33100062269	2016/11/17 14:50:56	12	13	06	2	2018-10-25 13:40:52	2018-10-25 16:41:58
931	109208766	20161117-0035516	109208760	FDCQ	330604012051GB00708F00030086	浙(2016)绍兴市上虞区不动产权第0018392号	共同共有	百官街道大通水尚名都3幢2902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018392	18392	33100062359	2016/11/17 14:54:59	3	29	02		2018-10-25 13:40:52	2018-10-25 16:41:58
932	109209053	20161117-0035523	109209047	FDCQ	330604012051GB00708F00080070	浙(2016)绍兴市上虞区不动产权第0018397号	共同共有	百官街道大通水尚名都9幢2单元1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018397	18397	33100062362	2016/11/17 15:01:26	9	15	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
933	109110226	20161107-0033271	109110221	FDCQ	330604012051GB00708F00070014	浙(2016)绍兴市上虞区不动产权第0017429号	单独所有	百官街道大通水尚名都8幢1单元1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017429	17429	33100061173	2016/11/7 15:11:13	8	16	02	1	2018-10-25 13:40:52	2018-10-25 16:41:58
934	109108857	20161107-0033241	109108851	FDCQ	330604012051GB00708F00050007	浙(2016)绍兴市上虞区不动产权第0017166号	共同共有	百官街道大通水尚名都6幢103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.09㎡/房屋建筑面积89.23㎡	5.09	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017166	17166	33100061034	2016/11/7 14:34:51	6	1	03		2018-10-25 13:40:52	2018-10-25 16:41:58
935	109108913	20161107-0033238	109108907	FDCQ	330604012051GB00708F00070063	浙(2016)绍兴市上虞区不动产权第0017490号	单独所有	百官街道大通水尚名都8幢2单元1203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017490	17490	33100061253	2016/11/7 14:35:59	8	12	03	2	2018-10-25 13:40:52	2018-10-25 16:41:58
936	109110544	20161107-0033282	109110537	FDCQ	330604012051GB00708F00060112	浙(2016)绍兴市上虞区不动产权第0017451号	单独所有	百官街道大通水尚名都7幢2单元1108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017451	17451	33100061184	2016/11/7 15:18:51	7	11	08	2	2018-10-25 13:40:52	2018-10-25 16:41:58
937	109110760	20161107-0033287	109110754	FDCQ	330604012051GB00708F00080096	浙(2016)绍兴市上虞区不动产权第0017192号	共同共有	百官街道大通水尚名都9幢2单元2704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017192	17192	33100061045	2016/11/7 15:27:17	9	27	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
938	109123493	20161108-0033609	109123487	FDCQ	330604012051GB00708F00090038	浙(2016)绍兴市上虞区不动产权第0017650号	共同共有	百官街道大通水尚名都10幢17A02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017650	17650	33100061346	2016/11/8 15:09:12	10	18	02		2018-10-25 13:40:52	2018-10-25 16:41:58
950	108979371	20161024-0030688	108979365	FDCQ	330604012051GB00708F00120052	浙(2016)绍兴市上虞区不动产权第0016058号	共同共有	百官街道大通水尚名都12幢2单元1108室	国有建设用地使用权/房屋（构筑物）所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016058	16058	33100059984	2016/10/24 16:35:57	12	11	08	2	2018-10-25 13:40:52	2018-10-25 16:42:54
951	108979937	20161024-0030696	108979931	FDCQ	330604012051GB00708F00080051	浙(2016)绍兴市上虞区不动产权第0016146号	共同共有	百官街道大通水尚名都9幢1单元601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016146	16146	33100060292	2016/10/24 17:02:14	9	6	01	1	2018-10-25 13:40:52	2018-10-25 16:42:54
952	109012321	20161028-0031403	109012315	FDCQ	330604012051GB00708F00040083	浙(2016)绍兴市上虞区不动产权第0016733号	共同共有	百官街道大通水尚名都5幢503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016733	16733	33100060792	2016/10/28 9:03:19	5	5	03		2018-10-25 13:40:52	2018-10-25 16:42:54
940	109123840	20161108-0033621	109123832	FDCQ	330604012051GB00708F00120011	浙(2016)绍兴市上虞区不动产权第0017328号	共同共有	百官街道大通水尚名都12幢1单元12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017328	17328	33100061201	2016/11/8 15:15:47	12	13	03	1	2018-10-25 13:40:52	2018-10-25 16:41:58
941	109157820	20161108-0033445	109157814	FDCQ	330604012051GB00708F00070090	浙(2016)绍兴市上虞区不动产权第0017308号	共同共有	百官街道大通水尚名都8幢2单元23A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017308	17308	33100061090	2016/11/11 11:47:26	8	24	04	2	2018-10-25 13:40:52	2018-10-25 16:41:58
942	109043109	20161101-0032065	109043103	FDCQ	330604012051GB00708F00020042	浙(2016)绍兴市上虞区不动产权第0016575号	共同共有	百官街道大通水尚名都2幢302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016575	16575	33100060439	2016/11/1 11:04:53	2	3	02		2018-10-25 13:40:52	2018-10-25 16:41:58
943	109159002	20161111-0034418	109158996	FDCQ	330604012051GB00708F00040025	浙(2016)绍兴市上虞区不动产权第0017875号	共同共有	百官街道大通水尚名都5幢1501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017875	17875	33100062008	2016/11/11 14:24:06	5	15	01		2018-10-25 13:40:52	2018-10-25 16:41:58
944	109196971	20161116-0035245	109196965	FDCQ	330604012051GB00708F00030124	浙(2016)绍兴市上虞区不动产权第0018329号	共同共有	百官街道大通水尚名都3幢904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018329	18329	33100062249	2016/11/16 14:47:49	3	9	04		2018-10-25 13:40:52	2018-10-25 16:41:58
945	109200202	20161117-0035324	109200196	FDCQ	330604012051GB00708F00060167	浙(2016)绍兴市上虞区不动产权第0018384号	共同共有	百官街道大通水尚名都7幢2单元23A07室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018384	18384	33100062270	2016/11/17 9:16:18	7	24	07	2	2018-10-25 13:40:52	2018-10-25 16:41:58
946	109200214	20161117-0035323	109200208	FDCQ	330604012051GB00708F00040048	浙(2016)绍兴市上虞区不动产权第0018551号	共同共有	百官街道大通水尚名都5幢2004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018551	18551	33100062807	2016/11/17 9:16:23	5	20	04		2018-10-25 13:40:52	2018-10-25 16:41:58
947	109207472	20161115-0034831	109207466	FDCQ	330604012051GB00708F00120019	浙(2016)绍兴市上虞区不动产权第0018175号	共同共有	百官街道大通水尚名都12幢1单元1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018175	18175	33100062172	2016/11/17 14:21:50	12	17	03	1	2018-10-25 13:40:52	2018-10-25 16:41:58
948	108978078	20161024-0030660	108978072	FDCQ	330604012051GB00708F00010001	浙(2016)绍兴市上虞区不动产权第0016161号	共同共有	百官街道大通水尚名都1幢1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016161	16161	33100060298	2016/10/24 15:38:35	1	10	01		2018-10-25 13:40:52	2018-10-25 16:41:58
949	108979386	20161024-0030690	108979380	FDCQ	330604012051GB00708F00100028	浙(2016)绍兴市上虞区不动产权第0016206号	共同共有	百官街道大通水尚名都11幢1单元2104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016206	16206	33100060035	2016/10/24 16:36:59	11	21	04	1	2018-10-25 13:40:52	2018-10-25 16:41:58
954	109013188	20161028-0031423	109013182	FDCQ	330604012051GB00708F00010065	浙(2016)绍兴市上虞区不动产权第0016906号	共同共有	百官街道大通水尚名都1幢2902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016906	16906	33100060893	2016/10/28 9:27:24	1	29	02		2018-10-25 13:40:52	2018-10-25 16:42:02
955	109013132	20161028-0031422	109013126	FDCQ	330604012051GB00708F00050056	浙(2016)绍兴市上虞区不动产权第0016686号	共同共有	百官街道大通水尚名都6幢2104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016686	16686	33100060826	2016/10/28 9:25:57	6	21	04		2018-10-25 13:40:52	2018-10-25 16:42:02
956	109013555	20161028-0031433	109013548	FDCQ	330604012051GB00708F00030008	浙(2016)绍兴市上虞区不动产权第0016469号	共同共有	百官街道大通水尚名都3幢104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.91㎡/房屋建筑面积112.24㎡	4.91	112.24	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016469	16469	33100060418	2016/10/28 9:39:16	3	1	04		2018-10-25 13:40:52	2018-10-25 16:42:02
957	109094938	20161104-0033004	109094932	FDCQ	330604012051GB00708F00030056	浙(2016)绍兴市上虞区不动产权第0017336号	共同共有	百官街道大通水尚名都3幢2104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017336	17336	33100061145	2016/11/4 15:47:46	3	21	04		2018-10-25 13:40:52	2018-10-25 16:42:02
958	109112200	20161107-0033322	109112194	FDCQ	330604012051GB00708F00070078	浙(2016)绍兴市上虞区不动产权第0017215号	共同共有	百官街道大通水尚名都8幢2单元1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017215	17215	33100061058	2016/11/7 16:12:09	8	19	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
959	109112424	20161107-0033332	109112419	FDCQ	330604012051GB00708F00080030	浙(2016)绍兴市上虞区不动产权第0017194号	单独所有	百官街道大通水尚名都9幢1单元2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017194	17194	33100061046	2016/11/7 16:26:31	9	23	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
960	109113113	20161108-0033350	109113107	FDCQ	330604012051GB00708F00070050	浙(2016)绍兴市上虞区不动产权第0017307号	共同共有	百官街道大通水尚名都8幢1单元502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017307	17307	33100061089	2016/11/8 9:03:18	8	5	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
961	109112758	20161104-0032932	109112752	FDCQ	330604012051GB00708F00020003	浙(2016)绍兴市上虞区不动产权第0016996号	共同共有	百官街道大通水尚名都2幢101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.19㎡/房屋建筑面积178.11㎡	8.19	178.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016996	16996	33100061007	2016/11/8 8:46:02	2	1	01		2018-10-25 13:40:52	2018-10-25 16:42:02
962	109212561	20161118-0035596	109212555	FDCQ	330604012051GB00708F00030001	浙(2016)绍兴市上虞区不动产权第0018782号	共同共有	百官街道大通水尚名都3幢1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018782	18782	33100062877	2016/11/18 9:26:57	3	10	01		2018-10-25 13:40:52	2018-10-25 16:42:02
963	109212236	20161118-0035586	109212230	FDCQ	330604012051GB00708F00050045	浙(2016)绍兴市上虞区不动产权第0018780号	共同共有	百官街道大通水尚名都6幢2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018780	18780	33100062876	2016/11/18 9:16:19	6	20	01		2018-10-25 13:40:52	2018-10-25 16:42:02
964	109112890	20161108-0033344	109112884	FDCQ	330604012051GB00708F00070080	浙(2016)绍兴市上虞区不动产权第0017613号	共同共有	百官街道大通水尚名都8幢2单元2004室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017613	17613	33100061406	2016/11/8 8:54:30	8	20	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
965	109112686	20161107-0033342	109112680	FDCQ	330604012051GB00708F00070093	浙(2016)绍兴市上虞区不动产权第0017417号	共同共有	百官街道大通水尚名都8幢2单元2603室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017417	17417	33100061167	2016/11/7 16:59:36	8	26	03	2	2018-10-25 13:40:52	2018-10-25 16:42:02
966	109113054	20161108-0033349	109113049	FDCQ	330604012051GB00708F00030119	浙(2016)绍兴市上虞区不动产权第0017292号	单独所有	百官街道大通水尚名都3幢803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017292	17292	33100061083	2016/11/8 9:01:30	3	8	03		2018-10-25 13:40:52	2018-10-25 16:42:02
968	108967559	20161021-0030435	108967553	FDCQ	330604012051GB00708F00090057	浙(2016)绍兴市上虞区不动产权第0015945号	共同共有	百官街道大通水尚名都10幢2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015945	15945	33100060265	2016/10/21 15:55:13	10	22	01		2018-10-25 13:40:52	2018-10-25 16:42:02
969	109126957	20161101-0032129	109126952	FDCQ	330604012051GB00708F00050081	浙(2016)绍兴市上虞区不动产权第0016811号	单独所有	百官街道大通水尚名都6幢501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016811	16811	33100060869	2016/11/8 16:44:27	6	5	01		2018-10-25 13:40:52	2018-10-25 16:42:02
970	109127178	20161102-0032520	109127173	FDCQ	330604012051GB00708F00030063	浙(2016)绍兴市上虞区不动产权第0016886号	单独所有	百官街道大通水尚名都3幢2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016886	16886	33100060927	2016/11/8 16:47:57	3	23	03		2018-10-25 13:40:52	2018-10-25 16:42:02
971	109128181	20161107-0033294	109128175	FDCQ	330604012051GB00708F00100080	浙(2016)绍兴市上虞区不动产权第0017209号	共同共有	百官街道大通水尚名都11幢2单元508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017209	17209	33100061054	2016/11/9 8:43:02	11	5	08	2	2018-10-25 13:40:52	2018-10-25 16:42:02
972	109130310	20161109-0033755	109130304	FDCQ	330604012051GB00708F00030085	浙(2016)绍兴市上虞区不动产权第0017755号	共同共有	百官街道大通水尚名都3幢2901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017755	17755	33100061443	2016/11/9 9:48:20	3	29	01		2018-10-25 13:40:52	2018-10-25 16:42:02
973	109131567	20161109-0033781	109131561	FDCQ	330604012051GB00708F00020017	浙(2016)绍兴市上虞区不动产权第0017478号	共同共有	百官街道大通水尚名都2幢1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017478	17478	33100061245	2016/11/9 10:21:28	2	17	01		2018-10-25 13:40:52	2018-10-25 16:42:02
974	109001665	20161027-0031166	109001659	FDCQ	330604012051GB00708F00060121	浙(2016)绍兴市上虞区不动产权第0016290号	共同共有	百官街道大通水尚名都7幢2单元12B05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016290	16290	33100060339	2016/10/27 9:06:02	7	13	05	2	2018-10-25 13:40:52	2018-10-25 16:42:02
975	109001762	20161027-0031167	109001756	FDCQ	330604012051GB00708F00060130	浙(2016)绍兴市上虞区不动产权第0016241号	共同共有	百官街道大通水尚名都7幢2单元1606室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016241	16241	33100060327	2016/10/27 9:11:22	7	16	06	2	2018-10-25 13:40:52	2018-10-25 16:42:02
976	109001779	20161027-0031168	109001773	FDCQ	330604012051GB00708F00120001	浙(2016)绍兴市上虞区不动产权第0016200号	共同共有	百官街道大通水尚名都12幢1单元101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016200	16200	33100060032	2016/10/27 9:11:41	12	1	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
977	109002409	20161027-0031181	109002403	FDCQ	330604012051GB00708F00030040	浙(2016)绍兴市上虞区不动产权第0016187号	共同共有	百官街道大通水尚名都3幢17A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016187	16187	33100060027	2016/10/27 9:29:32	3	18	04		2018-10-25 13:40:52	2018-10-25 16:42:02
978	109046151	20161101-0032124	109046145	FDCQ	330604012051GB00708F00050089	浙(2016)绍兴市上虞区不动产权第0016615号	共同共有	百官街道大通水尚名都6幢701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016615	16615	33100060809	2016/11/1 14:18:58	6	7	01		2018-10-25 13:40:52	2018-10-25 16:42:02
979	109046594	20161101-0032135	109046588	FDCQ	330604012051GB00708F00040015	浙(2016)绍兴市上虞区不动产权第0016606号	共同共有	百官街道大通水尚名都5幢1203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016606	16606	33100060803	2016/11/1 14:30:25	5	12	03		2018-10-25 13:40:52	2018-10-25 16:42:02
980	109046669	20161101-0032138	109046663	FDCQ	330604012051GB00708F00030012	浙(2016)绍兴市上虞区不动产权第0016583号	共同共有	百官街道大通水尚名都3幢1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016583	16583	33100060443	2016/11/1 14:32:12	3	11	04		2018-10-25 13:40:52	2018-10-25 16:42:02
982	109235766	20161121-0036135	109235760	FDCQ	330604012051GB00708F00070036	浙(2016)绍兴市上虞区不动产权第0018758号	共同共有	百官街道大通水尚名都8幢1单元2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018758	18758	33100062868	2016/11/21 16:30:58	8	26	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
983	109501034	20161219-0041971	109501029	FDCQ	330604012051GB00708F00070095	浙(2016)绍兴市上虞区不动产权第0022058号	单独所有	百官街道大通水尚名都8幢2单元2703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022058	22058	33001390242	2016/12/19 10:25:41	8	27	03	2	2018-10-25 13:40:52	2018-10-25 16:42:02
984	109352244	20161205-0038686	109352239	FDCQ	330604012051GB00708F00060093	浙(2016)绍兴市上虞区不动产权第0020098号	单独所有	百官街道大通水尚名都7幢1单元801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020098	20098	33100064189	2016/12/5 11:23:47	7	8	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
985	109295871	20161129-0037422	109295865	FDCQ	330604012051GB00708F00050017	浙(2016)绍兴市上虞区不动产权第0019455号	共同共有	百官街道大通水尚名都6幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019455	19455	33100063831	2016/11/29 10:07:56	6	13	01		2018-10-25 13:40:52	2018-10-25 16:42:02
986	109489649	20161216-0041695	109489643	FDCQ	330604012051GB00708F00090080	浙(2016)绍兴市上虞区不动产权第0021869号	共同共有	百官街道大通水尚名都10幢2704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021869	21869	33001390231	2016/12/16 15:55:03	10	27	04		2018-10-25 13:40:52	2018-10-25 16:42:02
987	109596376	20161226-0044066	109596371	FDCQ	330604012051GB00708F00090022	浙(2017)绍兴市上虞区不动产权第0000480号	单独所有	百官街道大通水尚名都10幢12B02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000480	480	33001392851	2016/12/26 14:53:04	10	13	02		2018-10-25 13:40:52	2018-10-25 16:42:02
988	109581900	20161223-0043760	109581894	FDCQ	330604012051GB00708F00070027	浙(2016)绍兴市上虞区不动产权第0023105号	共同共有	百官街道大通水尚名都8幢1单元2201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023105	23105	33001391801	2016/12/23 16:34:37	8	22	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
989	109487057	20161216-0041617	109487049	FDCQ	330604012051GB00708F00020001	浙(2016)绍兴市上虞区不动产权第0021849号	共同共有	百官街道大通水尚名都2幢1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021849	21849	33001390227	2016/12/16 14:45:51	2	10	01		2018-10-25 13:40:52	2018-10-25 16:42:02
990	109487356	20161216-0041627	109487351	FDCQ	330604012051GB00708F00080086	浙(2016)绍兴市上虞区不动产权第0021962号	单独所有	百官街道大通水尚名都9幢2单元2204室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021962	21962	33000310239	2016/12/16 14:53:36	9	22	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
991	109369704	20161206-0039040	109369699	FDCQ	330604012051GB00708F00100024	浙(2016)绍兴市上虞区不动产权第0020247号	单独所有	百官街道大通水尚名都11幢1单元1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020247	20247	33100064873	2016/12/6 14:25:00	11	19	04	1	2018-10-25 13:40:52	2018-10-25 16:42:02
992	109602096	20161227-0044160	109602090	FDCQ	330604012051GB00708F00060122	浙(2017)绍兴市上虞区不动产权第0000660号	共同共有	百官街道大通水尚名都7幢2单元12B06室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000660	660	33001392849	2016/12/27 8:46:55	7	13	06	2	2018-10-25 13:40:52	2018-10-25 16:42:02
993	109536927	20161221-0042759	109536922	FDCQ	330604012051GB00708F00100011	浙(2016)绍兴市上虞区不动产权第0022587号	单独所有	百官街道大通水尚名都11幢1单元12A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022587	22587	33001390083	2016/12/21 9:51:22	11	13	03	1	2018-10-25 13:40:52	2018-10-25 16:42:02
994	109303422	20161129-0037602	109303416	FDCQ	330604012051GB00708F00030093	浙(2016)绍兴市上虞区不动产权第0019461号	共同共有	百官街道大通水尚名都3幢301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019461	19461	33100063738	2016/11/29 15:44:28	3	3	01		2018-10-25 13:40:52	2018-10-25 16:42:02
996	109507657	20161219-0042123	109507652	FDCQ	330604012051GB00708F00100074	浙(2016)绍兴市上虞区不动产权第0022054号	单独所有	百官街道大通水尚名都11幢2单元306室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022054	22054	33001390241	2016/12/19 14:22:33	11	3	06	2	2018-10-25 13:40:52	2018-10-25 16:42:02
997	109404838	20161209-0039804	109404832	FDCQ	330604012051GB00708F00060094	浙(2016)绍兴市上虞区不动产权第0021373号	共同共有	百官街道大通水尚名都7幢1单元802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021373	21373	33100065316	2016/12/9 9:15:35	7	8	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
998	109407154	20161209-0039833	109407145	FDCQ	330604012051GB00708F00090094	浙(2016)绍兴市上虞区不动产权第0020777号	共同共有	百官街道大通水尚名都10幢302室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020777	20777	33100065253	2016/12/9 9:52:34	10	3	02		2018-10-25 13:40:52	2018-10-25 16:42:02
999	109652321	20161229-0045007	109652315	FDCQ	330604012051GB00708F00060101	浙(2017)绍兴市上虞区不动产权第0000818号	共同共有	百官街道大通水尚名都7幢2单元1005室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000818	818	33001393067	2016/12/29 11:30:58	7	10	05	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1000	109301731	20161129-0037562	109301725	FDCQ	330604012051GB00708F00040034	浙(2016)绍兴市上虞区不动产权第0019463号	共同共有	百官街道大通水尚名都5幢1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019463	19463	33100063739	2016/11/29 14:56:04	5	17	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1001	109432263	20161212-0040365	109432257	FDCQ	330604012051GB00708F00090043	浙(2016)绍兴市上虞区不动产权第0021191号	共同共有	百官街道大通水尚名都10幢1903室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021191	21191	33100065302	2016/12/12 15:45:42	10	19	03		2018-10-25 13:40:52	2018-10-25 16:42:02
1002	109540173	20161221-0042831	109540166	FDCQ	330604012051GB00708F00070011	浙(2016)绍兴市上虞区不动产权第0022585号	共同共有	百官街道大通水尚名都8幢1单元1501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022585	22585	33001390081	2016/12/21 11:05:07	8	15	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1003	109578498	20161223-0043682	109578492	FDCQ	330604012051GB00708F00050027	浙(2016)绍兴市上虞区不动产权第0023608号	共同共有	百官街道大通水尚名都6幢1503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023608	23608	33001391921	2016/12/23 15:03:21	6	15	03		2018-10-25 13:40:52	2018-10-25 16:42:02
1004	109628862	20161228-0044531	109628857	FDCQ	330604012051GB00708F00080041	浙(2017)绍兴市上虞区不动产权第0000590号	单独所有	百官街道大通水尚名都9幢1单元2901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000590	590	33001392191	2016/12/28 9:46:43	9	29	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1005	109303380	20161129-0037604	109303374	FDCQ	330604012051GB00708F00060010	浙(2016)绍兴市上虞区不动产权第0019517号	单独所有	百官街道大通水尚名都7幢1单元1102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019517	19517	33100063762	2016/11/29 15:43:53	7	11	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1006	109594609	20161226-0044036	109594603	FDCQ	330604012051GB00708F00030121	浙(2017)绍兴市上虞区不动产权第0000489号	共同共有	百官街道大通水尚名都3幢901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000489	489	33001392853	2016/12/26 14:34:04	3	9	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1007	109465361	20161214-0041109	109465355	FDCQ	330604012051GB00708F00090112	浙(2016)绍兴市上虞区不动产权第0021383号	共同共有	百官街道大通水尚名都10幢704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021383	21383	33100065179	2016/12/14 15:46:39	10	7	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1008	109465589	20161214-0041113	109465583	FDCQ	330604012051GB00708F00050086	浙(2016)绍兴市上虞区不动产权第0021381号	共同共有	百官街道大通水尚名都6幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021381	21381	33100065178	2016/12/14 15:54:19	6	6	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1010	109465788	20161214-0041118	109465782	FDCQ	330604012051GB00708F00020011	浙(2016)绍兴市上虞区不动产权第0021393号	共同共有	百官街道大通水尚名都2幢12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021393	21393	33100065182	2016/12/14 16:02:36	2	13	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1011	109508834	20161219-0042145	109508828	FDCQ	330604012051GB00708F00060108	浙(2016)绍兴市上虞区不动产权第0022060号	共同共有	百官街道大通水尚名都7幢2单元108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.01㎡/房屋建筑面积87.35㎡	5.01	87.35	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022060	22060	33001390243	2016/12/19 14:44:13	7	1	08	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1012	109318601	20161201-0037918	109318595	FDCQ	330604012051GB00708F00060151	浙(2016)绍兴市上虞区不动产权第0019755号	共同共有	百官街道大通水尚名都7幢2单元207室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019755	19755	33100064129	2016/12/1 8:57:50	7	2	07	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1013	109292858	20161125-0037052	109292852	FDCQ	330604012051GB00708F00100082	浙(2016)绍兴市上虞区不动产权第0019043号	共同共有	百官街道大通水尚名都11幢2单元706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019043	19043	33100063078	2016/11/29 8:54:55	11	7	06	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1014	109527289	20161220-0042547	109527283	FDCQ	330604012051GB00708F00090016	浙(2016)绍兴市上虞区不动产权第0022282号	共同共有	百官街道大通水尚名都10幢1204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022282	22282	33001390295	2016/12/20 14:44:39	10	12	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1015	109466101	20161214-0041124	109466095	FDCQ	330604012051GB00708F00100001	浙(2016)绍兴市上虞区不动产权第0021400号	共同共有	百官街道大通水尚名都11幢1单元101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021400	21400	33100065184	2016/12/14 16:12:39	11	1	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1016	109563359	20161222-0043348	109563354	FDCQ	330604012051GB00708F00040092	浙(2016)绍兴市上虞区不动产权第0022864号	单独所有	百官街道大通水尚名都5幢704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022864	22864	33001391360	2016/12/22 15:14:54	5	7	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1017	109374534	20161206-0039157	109374528	FDCQ	330604012051GB00708F00060188	浙(2016)绍兴市上虞区不动产权第0020250号	共同共有	百官街道大通水尚名都7幢2单元608室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020250	20250	33100064874	2016/12/6 16:43:26	7	6	08	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1018	109364791	20161206-0038949	109364786	FDCQ	330604012051GB00708F00030069	浙(2016)绍兴市上虞区不动产权第0020422号	单独所有	百官街道大通水尚名都3幢2501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020422	20422	33100065039	2016/12/6 10:39:32	3	25	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1019	109477191	20161215-0041394	109477185	FDCQ	330604012051GB00708F00060127	浙(2016)绍兴市上虞区不动产权第0021596号	共同共有	百官街道大通水尚名都7幢2单元1507室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021596	21596	33100065197	2016/12/15 16:18:49	7	15	07	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1020	109476929	20161215-0041390	109476923	FDCQ	330604012051GB00708F00100062	浙(2016)绍兴市上虞区不动产权第0021987号	共同共有	百官街道大通水尚名都11幢2单元1706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021987	21987	33001390142	2016/12/15 16:09:40	11	17	06	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1021	109656688	20161229-0045105	109656682	FDCQ	330604012051GB00708F00030102	浙(2017)绍兴市上虞区不动产权第0000812号	共同共有	百官街道大通水尚名都3幢3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000812	812	33001393066	2016/12/29 14:40:14	3	4	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1022	109422008	20161212-0040137	109422002	FDCQ	330604012051GB00708F00060125	浙(2016)绍兴市上虞区不动产权第0021278号	共同共有	百官街道大通水尚名都7幢2单元1505室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021278	21278	33100065314	2016/12/12 9:41:24	7	15	05	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1024	109475405	20161215-0041347	109475399	FDCQ	330604012051GB00708F00020043	浙(2016)绍兴市上虞区不动产权第0021521号	共同共有	百官街道大通水尚名都2幢3A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021521	21521	33000310200	2016/12/15 15:18:15	2	4	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1025	109316880	20161130-0037882	109316869	FDCQ	330604012051GB00708F00050082	浙(2016)绍兴市上虞区不动产权第0019620号	单独所有	百官街道大通水尚名都6幢502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	人才购房货币化补助政策享受对象，五年内限制转让。	浙	绍兴市上虞区	2016	0019620	19620	33100063871	2016/11/30 15:43:35	6	5	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1026	109316797	20161130-0037880	109316791	FDCQ	330604012051GB00708F00060183	浙(2016)绍兴市上虞区不动产权第0019618号	共同共有	百官街道大通水尚名都7幢2单元507室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019618	19618	33100063870	2016/11/30 15:41:46	7	5	07	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1027	109317257	20161130-0037892	109317251	FDCQ	330604012051GB00708F00050042	浙(2016)绍兴市上虞区不动产权第0019590号	共同共有	百官街道大通水尚名都6幢1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019590	19590	33100063776	2016/11/30 15:56:19	6	19	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1028	109474858	20161215-0041330	109474852	FDCQ	330604012051GB00708F00090049	浙(2016)绍兴市上虞区不动产权第0021543号	共同共有	百官街道大通水尚名都10幢201室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021543	21543	33000310208	2016/12/15 15:05:30	10	2	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1029	109515513	20161220-0042281	109515507	FDCQ	330604012051GB00708F00020014	浙(2016)绍兴市上虞区不动产权第0022278号	共同共有	百官街道大通水尚名都2幢1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022278	22278	33001390293	2016/12/20 8:54:22	2	15	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1030	109387859	20161208-0039470	109387854	FDCQ	330604012051GB00708F00090109	浙(2016)绍兴市上虞区不动产权第0020616号	单独所有	百官街道大通水尚名都10幢701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020616	20616	33100064936	2016/12/8 9:07:55	10	7	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1031	109379571	20161207-0039259	109379565	FDCQ	330604012051GB00708F00090045	浙(2016)绍兴市上虞区不动产权第0020467号	共同共有	百官街道大通水尚名都10幢2001室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020467	20467	33100065047	2016/12/7 10:34:32	10	20	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1032	109474017	20161215-0041311	109474012	FDCQ	330604012051GB00708F00080089	浙(2016)绍兴市上虞区不动产权第0021518号	单独所有	百官街道大通水尚名都9幢2单元23A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021518	21518	33000310199	2016/12/15 14:40:47	9	24	03	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1033	109462379	20161214-0041057	109462372	FDCQ	330604012051GB00708F00080084	浙(2016)绍兴市上虞区不动产权第0021398号	共同共有	百官街道大通水尚名都9幢2单元2104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021398	21398	33100065183	2016/12/14 14:48:45	9	21	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1034	109337060	20161202-0038311	109337054	FDCQ	330604012051GB00708F00010039	浙(2016)绍兴市上虞区不动产权第0019923号	共同共有	百官街道大通水尚名都1幢203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.56㎡/房屋建筑面积140.11㎡	6.56	140.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019923	19923	33100064159	2016/12/2 14:35:44	1	2	03		2018-10-25 13:40:52	2018-10-25 16:42:02
1035	109519913	20161220-0042390	109519908	FDCQ	330604012051GB00708F00040008	浙(2016)绍兴市上虞区不动产权第0022255号	单独所有	百官街道大通水尚名都5幢104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.93㎡/房屋建筑面积87.38㎡	4.93	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022255	22255	33001390278	2016/12/20 10:36:01	5	1	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1036	109520166	20161220-0042393	109520159	FDCQ	330604012051GB00708F00090064	浙(2016)绍兴市上虞区不动产权第0022453号	共同共有	百官街道大通水尚名都10幢2304室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022453	22453	33001391677	2016/12/20 10:41:21	10	23	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1050	109564937	20161222-0043383	109564931	FDCQ	330604012051GB00708F00100066	浙(2016)绍兴市上虞区不动产权第0022860号	共同共有	百官街道大通水尚名都11幢2单元1906室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022860	22860	33001391358	2016/12/22 15:54:34	11	19	06	2	2018-10-25 13:40:52	2018-10-25 16:42:54
1038	109422691	20161212-0040150	109422685	FDCQ	330604012051GB00708F00060026	浙(2016)绍兴市上虞区不动产权第0021282号	共同共有	百官街道大通水尚名都7幢1单元1502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021282	21282	33100065315	2016/12/12 9:57:30	7	15	02	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1039	109338173	20161202-0038337	109338167	FDCQ	330604012051GB00708F00100085	浙(2016)绍兴市上虞区不动产权第0019983号	共同共有	百官街道大通水尚名都11幢2单元905室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019983	19983	33100064183	2016/12/2 15:05:25	11	9	05	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1040	109621474	20161227-0044407	109621469	FDCQ	330604012051GB00708F00010031	浙(2017)绍兴市上虞区不动产权第0000313号	单独所有	百官街道大通水尚名都1幢1901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000313	313	33001392167	2016/12/27 15:08:57	1	19	01		2018-10-25 13:40:52	2018-10-25 16:42:02
1041	109337159	20161202-0038318	109337154	FDCQ	330604012051GB00708F00100052	浙(2016)绍兴市上虞区不动产权第0019918号	单独所有	百官街道大通水尚名都11幢2单元1108室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019918	19918	33100064782	2016/12/2 14:38:01	11	11	08	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1042	109337884	20161202-0038328	109337878	FDCQ	330604012051GB00708F00090046	浙(2016)绍兴市上虞区不动产权第0019934号	共同共有	百官街道大通水尚名都10幢2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019934	19934	33100064788	2016/12/2 14:54:02	10	20	02		2018-10-25 13:40:52	2018-10-25 16:42:02
1043	109563458	20161222-0043351	109563452	FDCQ	330604012051GB00708F00080066	浙(2016)绍兴市上虞区不动产权第0022862号	共同共有	百官街道大通水尚名都9幢2单元12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022862	22862	33001391359	2016/12/22 15:16:50	9	13	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1044	109563942	20161222-0043357	109563937	FDCQ	330604012051GB00708F00080061	浙(2016)绍兴市上虞区不动产权第0022865号	单独所有	百官街道大通水尚名都9幢2单元1103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022865	22865	33001391361	2016/12/22 15:27:10	9	11	03	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1045	109303674	20161129-0037609	109303668	FDCQ	330604012051GB00708F00030100	浙(2016)绍兴市上虞区不动产权第0019520号	共同共有	百官街道大通水尚名都3幢3104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019520	19520	33100063763	2016/11/29 15:51:44	3	31	04		2018-10-25 13:40:52	2018-10-25 16:42:02
1046	109423640	20161212-0040175	109423635	FDCQ	330604012051GB00708F00100031	浙(2016)绍兴市上虞区不动产权第0021017号	单独所有	百官街道大通水尚名都11幢1单元303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021017	21017	33100065244	2016/12/12 10:19:31	11	3	03	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1047	109422902	20161212-0040155	109422896	FDCQ	330604012051GB00708F00060177	浙(2016)绍兴市上虞区不动产权第0021008号	共同共有	百官街道大通水尚名都7幢2单元3A05室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021008	21008	33100065241	2016/12/12 10:03:07	7	4	05	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1048	109548836	20161221-0043014	109548831	FDCQ	330604012051GB00708F00070098	浙(2016)绍兴市上虞区不动产权第0022586号	单独所有	百官街道大通水尚名都8幢2单元2804室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022586	22586	33001390082	2016/12/21 16:09:16	8	28	04	2	2018-10-25 13:40:52	2018-10-25 16:42:02
1049	109340990	20161202-0038406	109340984	FDCQ	330604012051GB00708F00060045	浙(2016)绍兴市上虞区不动产权第0019939号	共同共有	百官街道大通水尚名都7幢1单元2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019939	19939	33100064165	2016/12/2 16:16:53	7	20	01	1	2018-10-25 13:40:52	2018-10-25 16:42:02
1052	109390663	20161208-0039520	109390657	FDCQ	330604012051GB00708F00070110	浙(2016)绍兴市上虞区不动产权第0020653号	共同共有	百官街道大通水尚名都8幢2单元604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020653	20653	33100064949	2016/12/8 10:27:51	8	6	04	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1053	109455055	20161214-0040906	109455049	FDCQ	330604012051GB00708F00120082	浙(2016)绍兴市上虞区不动产权第0021378号	共同共有	百官街道大通水尚名都12幢2单元706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021378	21378	33100065177	2016/12/14 10:14:00	12	7	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1054	109397992	20161208-0039679	109397985	FDCQ	330604012051GB00708F00030048	浙(2016)绍兴市上虞区不动产权第0020635号	共同共有	百官街道大通水尚名都3幢2004室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020635	20635	33100064975	2016/12/8 14:51:59	3	20	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1055	109341924	20161202-0038427	109341919	FDCQ	330604012051GB00708F00060150	浙(2016)绍兴市上虞区不动产权第0019931号	单独所有	百官街道大通水尚名都7幢2单元206室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019931	19931	33100064787	2016/12/2 16:47:27	7	2	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1056	109430757	20161212-0040326	109430751	FDCQ	330604012051GB00708F00010004	浙(2016)绍兴市上虞区不动产权第0021319号	共同共有	百官街道大通水尚名都1幢101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.94㎡/房屋建筑面积148.30㎡	6.94	148.30	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021319	21319	33100065174	2016/12/12 15:10:17	1	1	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1057	109508345	20161219-0042140	109508333	FDCQ	330604012051GB00708F00090085	浙(2016)绍兴市上虞区不动产权第0022157号	单独所有	百官街道大通水尚名都10幢2901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022157	22157	33001390170	2016/12/19 14:36:04	10	29	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1058	109519171	20161220-0042372	109519165	FDCQ	330604012051GB00708F00080103	浙(2016)绍兴市上虞区不动产权第0022395号	共同共有	百官街道大通水尚名都9幢2单元303室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022395	22395	33001391654	2016/12/20 10:22:04	9	3	03	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1059	109461987	20161214-0041050	109461981	FDCQ	330604012051GB00708F00020051	浙(2016)绍兴市上虞区不动产权第0021469号	共同共有	百官街道大通水尚名都2幢801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021469	21469	33000310187	2016/12/14 14:37:13	2	8	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1060	109545751	20161221-0042945	109545745	FDCQ	330604012051GB00708F00100026	浙(2016)绍兴市上虞区不动产权第0022494号	共同共有	百官街道大通水尚名都11幢1单元2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022494	22494	33001391401	2016/12/21 14:52:32	11	21	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1061	109445861	20161213-0040696	109445856	FDCQ	330604012051GB00708F00080028	浙(2016)绍兴市上虞区不动产权第0021460号	单独所有	百官街道大通水尚名都9幢1单元2202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021460	21460	33100065342	2016/12/13 14:33:55	9	22	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1062	109488219	20161216-0041651	109488213	FDCQ	330604012051GB00708F00080093	浙(2016)绍兴市上虞区不动产权第0021966号	共同共有	百官街道大通水尚名都9幢2单元2603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021966	21966	33000310240	2016/12/16 15:15:05	9	26	03	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1063	109307117	20161130-0037666	109307111	FDCQ	330604012051GB00708F00010010	浙(2016)绍兴市上虞区不动产权第0019593号	共同共有	百官街道大通水尚名都1幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019593	19593	33100063777	2016/11/30 9:35:32	1	12	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1064	109558131	20161222-0043230	109558125	FDCQ	330604012051GB00708F00090050	浙(2016)绍兴市上虞区不动产权第0023022号	共同共有	百官街道大通水尚名都10幢202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0023022	23022	33001391886	2016/12/22 11:31:31	10	2	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1066	109448654	20161209-0039814	109448648	FDCQ	330604012051GB00708F00120002	浙(2016)绍兴市上虞区不动产权第0020786号	共同共有	百官街道大通水尚名都12幢1单元102室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020786	20786	33100065255	2016/12/13 15:30:57	12	1	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1067	109292454	20161128-0037363	109292448	FDCQ	330604012051GB00708F00040082	浙(2016)绍兴市上虞区不动产权第0019318号	共同共有	百官街道大通水尚名都5幢502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019318	19318	33100063815	2016/11/28 17:02:20	5	5	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1068	109449651	20161209-0040011	109449645	FDCQ	330604012051GB00708F00050087	浙(2016)绍兴市上虞区不动产权第0020800号	共同共有	百官街道大通水尚名都6幢603室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020800	20800	33100065232	2016/12/13 15:52:52	6	6	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1069	109417339	20161209-0040051	109417333	FDCQ	330604012051GB00708F00030019	浙(2016)绍兴市上虞区不动产权第0020735号	共同共有	百官街道大通水尚名都3幢12A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0020735	20735	33100065213	2016/12/9 15:42:33	3	13	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1070	109591424	20161226-0043975	109591412	FDCQ	330604012051GB00708F00060102	浙(2017)绍兴市上虞区不动产权第0000487号	共同共有	百官街道大通水尚名都7幢2单元1006室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0000487	487	33001392852	2016/12/26 11:41:34	7	10	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1071	109450639	20161213-0040814	109450633	FDCQ	330604012051GB00708F00030077	浙(2016)绍兴市上虞区不动产权第0021667号	共同共有	百官街道大通水尚名都3幢2701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021667	21667	33001390109	2016/12/13 16:18:03	3	27	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1072	109487880	20161216-0041641	109487873	FDCQ	330604012051GB00708F00060129	浙(2016)绍兴市上虞区不动产权第0021864号	共同共有	百官街道大通水尚名都7幢2单元1605室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021864	21864	33001390230	2016/12/16 15:04:30	7	16	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1073	109503591	20161219-0042028	109503585	FDCQ	330604012051GB00708F00080034	浙(2016)绍兴市上虞区不动产权第0022052号	共同共有	百官街道大通水尚名都9幢1单元2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022052	22052	33001390240	2016/12/19 11:13:50	9	25	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1074	109305442	20161130-0037657	109305436	FDCQ	330604012051GB00708F00060079	浙(2016)绍兴市上虞区不动产权第0019614号	共同共有	百官街道大通水尚名都7幢1单元3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019614	19614	33100063784	2016/11/30 9:11:00	7	4	03	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1075	109308364	20161130-0037682	109308358	FDCQ	330604012051GB00708F00040022	浙(2016)绍兴市上虞区不动产权第0019643号	共同共有	百官街道大通水尚名都5幢12B02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019643	19643	33100063886	2016/11/30 9:49:06	5	13	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1076	109889339	20170110-0047916	109889334	FDCQ	330604012051GB00708F00060059	浙(2017)绍兴市上虞区不动产权第0002914号	单独所有	百官街道大通水尚名都7幢1单元2203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002914	2914	33001394076	2017/1/10 9:12:37	7	22	03	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1077	109801031	20170103-0046045	109801025	FDCQ	330604012051GB00708F00060003	浙(2017)绍兴市上虞区不动产权第0001418号	共同共有	百官街道大通水尚名都7幢1单元1003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001418	1418	33001393621	2017/1/3 16:21:45	7	10	03	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1078	109901065	20170110-0048107	109901056	FDCQ	330604012051GB00708F00060103	浙(2017)绍兴市上虞区不动产权第0002918号	共同共有	百官街道大通水尚名都7幢2单元1007室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002918	2918	33001394077	2017/1/10 14:34:31	7	10	07	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1080	109808911	20170104-0046209	109808905	FDCQ	330604012051GB00708F00060146	浙(2017)绍兴市上虞区不动产权第0001636号	共同共有	百官街道大通水尚名都7幢2单元2006室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001636	1636	33001392934	2017/1/4 11:29:04	7	20	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1081	109891597	20170110-0047931	109891592	FDCQ	330604012051GB00708F00060032	浙(2017)绍兴市上虞区不动产权第0002971号	单独所有	百官街道大通水尚名都7幢1单元1604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002971	2971	33001394987	2017/1/10 9:33:13	7	16	04	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1082	109881151	20170109-0047718	109881145	FDCQ	330604012051GB00708F00050005	浙(2017)绍兴市上虞区不动产权第0003139号	共同共有	百官街道大通水尚名都6幢101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.98㎡/房屋建筑面积87.38㎡	4.98	87.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003139	3139	33001395607	2017/1/9 14:36:50	6	1	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1083	110465652	20170309-0057347	110465646	FDCQ	330604012051GB00708F00030028	浙(2017)绍兴市上虞区不动产权第0007811号	共同共有	百官街道大通水尚名都3幢1504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0007811	7811	33001398643	2017/3/9 9:49:10	3	15	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1084	110118409	20170203-0052018	110118404	FDCQ	330604012051GB00708F00070020	浙(2017)绍兴市上虞区不动产权第0004753号	单独所有	百官街道大通水尚名都8幢1单元1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004753	4753	33001396377	2017/2/3 14:45:16	8	19	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1085	111935944	20170628-0079797	111935937	FDCQ	330604012051GB00708F00090082	浙(2017)绍兴市上虞区不动产权第0018811号	共同共有	百官街道大通水尚名都10幢2802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0018811	18811	33001406918	2017/6/28 15:54:48	10	28	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1086	111009714	20170412-0063335	111009707	FDCQ	330604012051GB00708F00060006	浙(2017)绍兴市上虞区不动产权第0010429号	共同共有	百官街道大通水尚名都7幢1单元102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010429	10429	33001400610	2017/4/12 10:19:26	7	1	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1087	110109660	20170125-0051804	110109654	FDCQ	330604012051GB00708F00100004	浙(2017)绍兴市上虞区不动产权第0004542号	共同共有	百官街道大通水尚名都11幢1单元104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004542	4542	33001396066	2017/1/25 16:02:46	11	1	04	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1088	112429171	20170731-0085776	112429164	FDCQ	330604012051GB00708F00060114	浙(2017)绍兴市上虞区不动产权第0021121号	共同共有	百官街道大通水尚名都7幢2单元1206室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0021121	21121	33001409477	2017/7/31 16:08:39	7	12	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1089	109881324	20170109-0047730	109881313	FDCQ	330604012051GB00708F00060044	浙(2017)绍兴市上虞区不动产权第0002700号	共同共有	百官街道大通水尚名都7幢1单元1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002700	2700	33001394946	2017/1/9 14:38:56	7	19	04	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1090	109747420	20161230-0045374	109747413	FDCQ	330604012051GB00708F00070019	浙(2017)绍兴市上虞区不动产权第0001234号	共同共有	百官街道大通水尚名都8幢1单元1901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001234	1234	33001393604	2016/12/30 11:26:06	8	19	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1091	109902553	20170110-0048156	109902546	FDCQ	330604012051GB00708F00010063	浙(2017)绍兴市上虞区不动产权第0002974号	单独所有	百官街道大通水尚名都1幢2803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002974	2974	33001394988	2017/1/10 15:03:54	1	28	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1092	110323229	20170224-0055490	110323223	FDCQ	330604012051GB00708F00030024	浙(2017)绍兴市上虞区不动产权第0006295号	共同共有	百官街道大通水尚名都3幢12B04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0006295	6295	33001398213	2017/2/24 15:58:39	3	13	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1094	109882449	20170109-0047756	109882442	FDCQ	330604012051GB00708F00120088	浙(2017)绍兴市上虞区不动产权第0002698号	共同共有	百官街道大通水尚名都12幢2单元908室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002698	2698	33001394945	2017/1/9 14:54:48	12	9	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1095	109892246	20170110-0047937	109892240	FDCQ	330604012051GB00708F00050001	浙(2017)绍兴市上虞区不动产权第0002856号	共同共有	百官街道大通水尚名都6幢1001室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002856	2856	33001395204	2017/1/10 9:40:09	6	10	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1096	110144314	20170207-0052605	110144308	FDCQ	330604012051GB00708F00060184	浙(2017)绍兴市上虞区不动产权第0004982号	共同共有	百官街道大通水尚名都7幢2单元508室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004982	4982	33001396334	2017/2/7 15:10:56	7	5	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1097	110114798	20170126-0051935	110114793	FDCQ	330604012051GB00708F00020034	浙(2017)绍兴市上虞区不动产权第0004586号	单独所有	百官街道大通水尚名都2幢23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004586	4586	33001396371	2017/1/26 15:10:56	2	24	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1098	110679747	20170329-0060998	110679741	FDCQ	330604012051GB00708F00010047	浙(2017)绍兴市上虞区不动产权第0009971号	共同共有	百官街道大通水尚名都1幢2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009971	9971	33001400107	2017/3/29 15:17:20	1	23	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1099	109815864	20170104-0046367	109815858	FDCQ	330604012051GB00708F00060085	浙(2017)绍兴市上虞区不动产权第0001637号	共同共有	百官街道大通水尚名都7幢1单元601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001637	1637	33001392935	2017/1/4 15:42:43	7	6	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1100	110102645	20170125-0051640	110102639	FDCQ	330604012051GB00708F00060197	浙(2017)绍兴市上虞区不动产权第0004582号	共同共有	百官街道大通水尚名都7幢2单元905室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004582	4582	33001396369	2017/1/25 10:07:44	7	9	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1101	109766963	20161230-0045520	109766957	FDCQ	330604012051GB00708F00060021	浙(2017)绍兴市上虞区不动产权第0001232号	共同共有	百官街道大通水尚名都7幢1单元12B01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001232	1232	33001393603	2016/12/30 15:46:06	7	13	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1102	110110059	20170125-0051818	110110054	FDCQ	330604012051GB00708F00090108	浙(2017)绍兴市上虞区不动产权第0004541号	单独所有	百官街道大通水尚名都10幢604室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004541	4541	33001396230	2017/1/25 16:20:29	10	6	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1103	109834302	20170105-0046788	109834296	FDCQ	330604012051GB00708F00060144	浙(2017)绍兴市上虞区不动产权第0002163号	共同共有	百官街道大通水尚名都7幢2单元1908室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0002163	2163	33001394018	2017/1/5 15:41:41	7	19	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1104	110220812	20170214-0053803	110220807	FDCQ	330604012051GB00708F00010006	浙(2017)绍兴市上虞区不动产权第0005503号	单独所有	百官街道大通水尚名都1幢103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.94㎡/房屋建筑面积148.30㎡	6.94	148.30	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005503	5503	33001397294	2017/2/14 14:37:08	1	1	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1105	109762893	20161230-0045460	109762887	FDCQ	330604012051GB00708F00090103	浙(2017)绍兴市上虞区不动产权第0001238号	共同共有	百官街道大通水尚名都10幢503室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0001238	1238	33001393605	2016/12/30 14:47:07	10	5	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1106	110131537	20170206-0052302	110131531	FDCQ	330604012051GB00708F00100049	浙(2017)绍兴市上虞区不动产权第0004874号	共同共有	百官街道大通水尚名都11幢2单元1105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004874	4874	33001396626	2017/2/6 11:27:51	11	11	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1108	110103373	20170125-0051657	110103367	FDCQ	330604012051GB00708F00060132	浙(2017)绍兴市上虞区不动产权第0004530号	共同共有	百官街道大通水尚名都7幢2单元1608室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004530	4530	33001396365	2017/1/25 10:29:56	7	16	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1109	109984661	20170116-0049550	109984656	FDCQ	330604012051GB00708F00070023	浙(2017)绍兴市上虞区不动产权第0003998号	单独所有	百官街道大通水尚名都8幢1单元201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003998	3998	33001395685	2017/1/16 10:56:48	8	2	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1110	110230920	20170215-0054026	110230914	FDCQ	330604012051GB00708F00090032	浙(2017)绍兴市上虞区不动产权第0005593号	共同共有	百官街道大通水尚名都10幢1604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005593	5593	33001397461	2017/2/15 14:47:10	10	16	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1111	110145964	20170207-0052631	110145958	FDCQ	330604012051GB00708F00080018	浙(2017)绍兴市上虞区不动产权第0004980号	共同共有	百官街道大通水尚名都9幢1单元17A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004980	4980	33001396333	2017/2/7 15:53:12	9	18	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1112	109953860	20170112-0049007	109953854	FDCQ	330604012051GB00708F00120049	浙(2017)绍兴市上虞区不动产权第0003208号	共同共有	百官街道大通水尚名都12幢2单元1105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003208	3208	33001395533	2017/1/12 16:24:36	12	11	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1113	110076423	20170123-0051062	110076417	FDCQ	330604012051GB00708F00040055	浙(2017)绍兴市上虞区不动产权第0004297号	共同共有	百官街道大通水尚名都5幢2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004297	4297	33001395988	2017/1/23 10:05:08	5	21	03		2018-10-25 13:40:52	2018-10-25 16:42:07
1114	110077930	20170123-0051116	110077924	FDCQ	330604012051GB00708F00020018	浙(2017)绍兴市上虞区不动产权第0004331号	共同共有	百官街道大通水尚名都2幢1702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004331	4331	33001396154	2017/1/23 10:45:18	2	17	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1115	110078631	20170123-0051133	110078625	FDCQ	330604012051GB00708F00080087	浙(2017)绍兴市上虞区不动产权第0004291号	共同共有	百官街道大通水尚名都9幢2单元2303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004291	4291	33001395783	2017/1/23 10:59:12	9	23	03	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1116	110078755	20170123-0051135	110078750	FDCQ	330604012051GB00708F00100048	浙(2017)绍兴市上虞区不动产权第0004315号	单独所有	百官街道大通水尚名都11幢2单元108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004315	4315	33001396004	2017/1/23 11:04:03	11	1	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1117	110078691	20170123-0051134	110078685	FDCQ	330604012051GB00708F00080113	浙(2017)绍兴市上虞区不动产权第0004292号	共同共有	百官街道大通水尚名都9幢2单元803室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004292	4292	33001395784	2017/1/23 11:00:31	9	8	03	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1118	110681147	20170329-0061020	110681141	FDCQ	330604012051GB00708F00120023	浙(2017)绍兴市上虞区不动产权第0009970号	共同共有	百官街道大通水尚名都12幢1单元1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009970	9970	33001400106	2017/3/29 16:01:54	12	19	03	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1119	109968380	20170113-0049330	109968374	FDCQ	330604012051GB00708F00060035	浙(2017)绍兴市上虞区不动产权第0003173号	共同共有	百官街道大通水尚名都7幢1单元1703室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003173	3173	33001395617	2017/1/13 15:25:27	7	17	03	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1120	110053205	20170119-0050559	110053199	FDCQ	330604012051GB00708F00090018	浙(2017)绍兴市上虞区不动产权第0004176号	共同共有	百官街道大通水尚名都10幢12A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004176	4176	33001396130	2017/1/19 16:18:18	10	13	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1122	213487335	20170927-0000891	213487329	FDCQ	330604012051GB00708F00120076	浙(2017)绍兴市上虞区不动产权第0026920号	共同共有	百官街道大通水尚名都12幢2单元308室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026920	26920	33001413264	2017/9/27 14:44:12	12	3	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1123	110282295	20170221-0054886	110282290	FDCQ	330604012051GB00708F00050077	浙(2017)绍兴市上虞区不动产权第0005876号	单独所有	百官街道大通水尚名都6幢3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005876	5876	33001397601	2017/2/21 15:33:44	6	4	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1124	110062138	20170120-0050744	110062132	FDCQ	330604012051GB00708F00030013	浙(2017)绍兴市上虞区不动产权第0004260号	共同共有	百官街道大通水尚名都3幢1201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004260	4260	33001396146	2017/1/20 11:39:35	3	12	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1125	110168145	20170208-0052914	110168139	FDCQ	330604012051GB00708F00080019	浙(2017)绍兴市上虞区不动产权第0005059号	共同共有	百官街道大通水尚名都9幢1单元1901室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005059	5059	33001396677	2017/2/8 15:37:19	9	19	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1126	110170871	20170208-0052953	110170865	FDCQ	330604012051GB00708F00080092	浙(2017)绍兴市上虞区不动产权第0005032号	共同共有	百官街道大通水尚名都9幢2单元2504室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005032	5032	33001396940	2017/2/8 16:26:29	9	25	04	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1127	110084513	20170123-0051206	110084507	FDCQ	330604012051GB00708F00060158	浙(2017)绍兴市上虞区不动产权第0004298号	共同共有	百官街道大通水尚名都7幢2单元2206室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004298	4298	33001395989	2017/1/23 14:36:33	7	22	06	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1128	110084489	20170123-0051205	110084483	FDCQ	330604012051GB00708F00060131	浙(2017)绍兴市上虞区不动产权第0004287号	共同共有	百官街道大通水尚名都7幢2单元1607室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004287	4287	33001395782	2017/1/23 14:35:17	7	16	07	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1129	110191640	20170209-0053228	110191634	FDCQ	330604012051GB00708F00090044	浙(2017)绍兴市上虞区不动产权第0005179号	共同共有	百官街道大通水尚名都10幢1904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005179	5179	33001397026	2017/2/9 16:45:30	10	19	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1130	110197445	20170210-0053344	110197439	FDCQ	330604012051GB00708F00060133	浙(2017)绍兴市上虞区不动产权第0005402号	共同共有	百官街道大通水尚名都7幢2单元1705室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005402	5402	33001397262	2017/2/10 11:31:50	7	17	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1131	110201267	20170210-0053426	110201261	FDCQ	330604012051GB00708F00020008	浙(2017)绍兴市上虞区不动产权第0005384号	共同共有	百官街道大通水尚名都2幢1202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005384	5384	33001397047	2017/2/10 15:51:42	2	12	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1132	110209289	20170213-0053555	110209283	FDCQ	330604012051GB00708F00080029	浙(2017)绍兴市上虞区不动产权第0005540号	共同共有	百官街道大通水尚名都9幢1单元2301室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005540	5540	33001397089	2017/2/13 13:42:15	9	23	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1133	110261884	20170220-0054657	110261878	FDCQ	330604012051GB00708F00010053	浙(2017)绍兴市上虞区不动产权第0005745号	共同共有	百官街道大通水尚名都1幢2502室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.16㎡/房屋建筑面积110.28㎡	5.16	110.28	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0005745	5745	33001397566	2017/2/20 14:54:08	1	25	02		2018-10-25 13:40:52	2018-10-25 16:42:07
1134	110087680	20170123-0051294	110087672	FDCQ	330604012051GB00708F00060163	浙(2017)绍兴市上虞区不动产权第0004299号	共同共有	百官街道大通水尚名都7幢2单元2307室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004299	4299	33001395990	2017/1/23 16:14:16	7	23	07	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1136	110145429	20170207-0052618	110145422	FDCQ	330604012051GB00708F00120048	浙(2017)绍兴市上虞区不动产权第0004970号	单独所有	百官街道大通水尚名都12幢2单元108室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004970	4970	33001396657	2017/2/7 15:36:39	12	1	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1137	110097955	20170124-0051529	110097949	FDCQ	330604012051GB00708F00060152	浙(2017)绍兴市上虞区不动产权第0004468号	共同共有	百官街道大通水尚名都7幢2单元208室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.01㎡/房屋建筑面积87.35㎡	5.01	87.35	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004468	4468	33001396035	2017/1/24 15:23:53	7	2	08	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1138	110098092	20170124-0051536	110098087	FDCQ	330604012051GB00708F00090076	浙(2017)绍兴市上虞区不动产权第0004469号	单独所有	百官街道大通水尚名都10幢2604室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0004469	4469	33001396036	2017/1/24 15:27:01	10	26	04		2018-10-25 13:40:52	2018-10-25 16:42:07
1139	110380795	20170306-0056691	110380789	FDCQ	330604012051GB00708F00070047	浙(2017)绍兴市上虞区不动产权第0007438号	共同共有	百官街道大通水尚名都8幢1单元3A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0007438	7438	33001398547	2017/3/6 11:39:47	8	4	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1140	111390867	20170515-0069859	111390861	FDCQ	330604012051GB00708F00070038	浙(2017)绍兴市上虞区不动产权第0014089号	单独所有	百官街道大通水尚名都8幢1单元2702室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0014089	14089	33001403717	2017/5/15 16:43:22	8	27	02	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1141	110615754	20170322-0059755	110615748	FDCQ	330604012051GB00708F00060149	浙(2017)绍兴市上虞区不动产权第0009589号	共同共有	百官街道大通水尚名都7幢2单元205室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积87.98㎡	5.04	87.98	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009589	9589	33001399652	2017/3/22 16:36:58	7	2	05	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1142	110615317	20170322-0059739	110615312	FDCQ	330604012051GB00708F00030045	浙(2017)绍兴市上虞区不动产权第0009496号	单独所有	百官街道大通水尚名都3幢2001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009496	9496	33001399950	2017/3/22 16:17:13	3	20	01		2018-10-25 13:40:52	2018-10-25 16:42:07
1143	111220739	20170428-0066720	111220733	FDCQ	330604012051GB00708F00070045	浙(2017)绍兴市上虞区不动产权第0012089号	共同共有	百官街道大通水尚名都8幢1单元301室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0012089	12089	33001402226	2017/4/28 15:15:23	8	3	01	1	2018-10-25 13:40:52	2018-10-25 16:42:07
1144	111095958	20170419-0064781	111095953	FDCQ	330604012051GB00708F00070084	浙(2017)绍兴市上虞区不动产权第0011287号	单独所有	百官街道大通水尚名都8幢2单元2104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011287	11287	33001401699	2017/4/19 15:27:19	8	21	04	2	2018-10-25 13:40:52	2018-10-25 16:42:07
1145	111137544	20170424-0065610	111137538	FDCQ	330604012051GB00708F00060106	浙(2017)绍兴市上虞区不动产权第0011619号	共同共有	百官街道大通水尚名都7幢2单元106室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.11㎡/房屋建筑面积89.20㎡	5.11	89.20	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011619	11619	33001401884	2017/4/24 15:53:49	7	1	06	2	2018-10-25 13:40:52	2018-10-25 16:42:08
1146	213505899	20170929-0001180	213505891	FDCQ	330604012051GB00708F00080068	浙(2017)绍兴市上虞区不动产权第0027021号	共同共有	百官街道大通水尚名都9幢2单元12B04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0027021	27021	33001413825	2017/9/29 9:29:27	9	13	04	2	2018-10-25 13:40:52	2018-10-25 16:42:08
1147	111104731	20170420-0064945	111104725	FDCQ	330604012051GB00708F00060192	浙(2017)绍兴市上虞区不动产权第0011591号	共同共有	百官街道大通水尚名都7幢2单元708室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011591	11591	33001401770	2017/4/20 11:14:02	7	7	08	2	2018-10-25 13:40:52	2018-10-25 16:42:08
1148	111350718	20170512-0069424	111350712	FDCQ	330604012051GB00708F00080031	浙(2017)绍兴市上虞区不动产权第0013652号	共同共有	百官街道大通水尚名都9幢1单元23A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0013652	13652	33001402870	2017/5/12 16:57:34	9	24	01	1	2018-10-25 13:40:52	2018-10-25 16:42:08
1150	213542774	20170930-0001542	213542767	FDCQ	330604012051GB00708F00060060	浙(2017)绍兴市上虞区不动产权第0026966号	共同共有	百官街道大通水尚名都7幢1单元2204室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	人才房票补贴政策享受对象，自登记之日起五年内限制转让。	浙	绍兴市上虞区	2017	0026966	26966	33001413271	2017/10/9 15:03:32	7	22	04	1	2018-10-25 13:40:52	2018-10-25 16:42:12
1151	217425826	20180410-0025479	217425820	FDCQ	330604012051GB00708F00070017	浙(2018)绍兴市上虞区不动产权第0019309号	共同共有	百官街道大通水尚名都8幢1单元17A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0019309	19309	33003326365	2018/4/10 9:41:47	8	18	01	1	2018-10-25 13:40:52	2018-10-25 16:42:12
1152	111234011	20170502-0067081	111234004	FDCQ	330604012051GB00708F00030105	浙(2017)绍兴市上虞区不动产权第0012163号	共同共有	百官街道大通水尚名都3幢501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0012163	12163	33001402332	2017/5/2 9:11:44	3	5	01		2018-10-25 13:40:52	2018-10-25 16:42:12
1153	111246230	20170502-0067337	111246224	FDCQ	330604012051GB00708F00100046	浙(2017)绍兴市上虞区不动产权第0012249号	共同共有	百官街道大通水尚名都11幢2单元106室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0012249	12249	33001402538	2017/5/2 17:30:01	11	1	06	2	2018-10-25 13:40:52	2018-10-25 16:42:12
1154	220570493	20180824-0060437	220570486	FDCQ	330604012051GB00708F00090065	浙(2018)绍兴市上虞区不动产权第0039612号	共同共有	百官街道大通水尚名都10幢23A01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0039612	39612	33003380233	2018/8/24 11:27:52	10	24	01		2018-10-25 13:40:52	2018-10-25 16:42:12
1155	111033864	20170413-0063772	111033859	FDCQ	330604012051GB00708F00050094	浙(2017)绍兴市上虞区不动产权第0010920号	单独所有	百官街道大通水尚名都6幢802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010920	10920	33001401086	2017/4/13 16:30:07	6	8	02		2018-10-25 13:40:52	2018-10-25 16:42:12
1156	111197068	20170426-0066163	111197062	FDCQ	330604012051GB00708F00060176	浙(2017)绍兴市上虞区不动产权第0011947号	共同共有	百官街道大通水尚名都7幢2单元308室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011947	11947	33001402402	2017/4/26 15:41:57	7	3	08	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1157	111122438	20170421-0065334	111122432	FDCQ	330604012051GB00708F00060008	浙(2017)绍兴市上虞区不动产权第0011522号	共同共有	百官街道大通水尚名都7幢1单元104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积87.98㎡	5.04	87.98	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011522	11522	33001401979	2017/4/21 15:39:32	7	1	04	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1158	111137281	20170424-0065606	111137275	FDCQ	330604012051GB00708F00060105	浙(2017)绍兴市上虞区不动产权第0011644号	共同共有	百官街道大通水尚名都7幢2单元105室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积87.98㎡	5.04	87.98	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011644	11644	33001402010	2017/4/24 15:45:37	7	1	05	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1159	110865302	20170411-0063224	110865295	FDCQ	330604012051GB00708F00100036	浙(2017)绍兴市上虞区不动产权第0010759号	共同共有	百官街道大通水尚名都11幢1单元504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010759	10759	33001400929	2017/4/11 16:17:42	11	5	04	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1160	111114172	20170421-0065160	111114165	FDCQ	330604012051GB00708F00100022	浙(2017)绍兴市上虞区不动产权第0011494号	共同共有	百官街道大通水尚名都11幢1单元1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011494	11494	33001401590	2017/4/21 9:56:25	11	19	02	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1161	111219653	20170428-0066697	111219648	FDCQ	330604012051GB00708F00060022	浙(2017)绍兴市上虞区不动产权第0012090号	单独所有	百官街道大通水尚名都7幢1单元12B02室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0012090	12090	33001402227	2017/4/28 14:38:05	7	13	02	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1162	111285643	20170505-0068207	111285631	FDCQ	330604012051GB00708F00060190	浙(2017)绍兴市上虞区不动产权第0013730号	共同共有	百官街道大通水尚名都7幢2单元706室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0013730	13730	33001402785	2017/5/5 16:48:35	7	7	06	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1164	111044948	20170414-0063910	111044942	FDCQ	330604012051GB00708F00070013	浙(2017)绍兴市上虞区不动产权第0011040号	共同共有	百官街道大通水尚名都8幢1单元1601室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011040	11040	33001401164	2017/4/14 11:39:24	8	16	01	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1165	111028873	20170412-0063408	111028866	FDCQ	330604012051GB00708F00050080	浙(2017)绍兴市上虞区不动产权第0010511号	共同共有	百官街道大通水尚名都6幢3A04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0010511	10511	33001400871	2017/4/13 14:28:34	6	4	04		2018-10-25 13:40:53	2018-10-25 16:42:12
1166	111057223	20170414-0064077	111057218	FDCQ	330604012051GB00708F00060001	浙(2017)绍兴市上虞区不动产权第0011066号	单独所有	百官街道大通水尚名都7幢1单元1001室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011066	11066	33001401457	2017/4/14 17:01:37	7	10	01	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1167	111271661	20170504-0067903	111271655	FDCQ	330604012051GB00708F00100044	浙(2017)绍兴市上虞区不动产权第0013650号	共同共有	百官街道大通水尚名都11幢1单元904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0013650	13650	33001402763	2017/5/4 16:57:53	11	9	04	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1168	112287610	20170721-0084281	112287604	FDCQ	330604012051GB00708F00070079	浙(2017)绍兴市上虞区不动产权第0020743号	单独所有	百官街道大通水尚名都8幢2单元2003室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0020743	20743	33001407874	2017/7/21 9:27:13	8	20	03	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1169	110663056	20170328-0060693	110663050	FDCQ	330604012051GB00708F00120045	浙(2017)绍兴市上虞区不动产权第0009897号	共同共有	百官街道大通水尚名都12幢2单元105室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0009897	9897	33001399899	2017/3/28 14:55:30	12	1	05	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1170	111185045	20170425-0065916	111185039	FDCQ	330604012051GB00708F00090081	浙(2017)绍兴市上虞区不动产权第0011767号	共同共有	百官街道大通水尚名都10幢2801室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0011767	11767	33001401923	2017/4/25 15:48:37	10	28	01		2018-10-25 13:40:53	2018-10-25 16:42:12
1171	112914652	20170822-0089363	112914646	FDCQ	330604012051GB00708F00100020	浙(2017)绍兴市上虞区不动产权第0022559号	共同共有	百官街道大通水尚名都11幢1单元1704室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0022559	22559	33001410610	2017/8/22 10:31:25	11	17	04	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1172	111773299	20170613-0076266	111773294	FDCQ	330604012051GB00708F00080107	浙(2017)绍兴市上虞区不动产权第0017032号	单独所有	百官街道大通水尚名都9幢2单元503室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0017032	17032	33001405483	2017/6/13 17:11:42	9	5	03	2	2018-10-25 13:40:53	2018-10-25 16:42:12
1173	111786819	20170614-0076522	111786814	FDCQ	330604012051GB00708F00020009	浙(2017)绍兴市上虞区不动产权第0017504号	单独所有	百官街道大通水尚名都2幢12A01室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.66㎡/房屋建筑面积188.26㎡	8.66	188.26	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0017504	17504	33001405694	2017/6/14 16:25:26	2	13	01		2018-10-25 13:40:53	2018-10-25 16:42:12
1174	216593990	20180211-0013811	216593984	FDCQ	330604012051GB00708F00100021	浙(2018)绍兴市上虞区不动产权第0009934号	共同共有	百官街道大通水尚名都11幢1单元1901室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0009934	9934	33003320731	2018/2/11 14:56:31	11	19	01	1	2018-10-25 13:40:53	2018-10-25 16:42:12
1175	111557459	20170525-0072030	111557453	FDCQ	330604012051GB00708F00090051	浙(2017)绍兴市上虞区不动产权第0015749号	共同共有	百官街道大通水尚名都10幢203室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0015749	15749	33001404392	2017/5/25 10:25:45	10	2	03		2018-10-25 13:40:53	2018-10-25 16:42:13
1176	213443476	20170922-0095239	213443468	FDCQ	330604012051GB00708F00030097	浙(2017)绍兴市上虞区不动产权第0026431号	共同共有	百官街道大通水尚名都3幢3101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026431	26431	33001412862	2017/9/22 14:44:05	3	31	01		2018-10-25 13:40:53	2018-10-25 16:42:13
1178	214916242	20171024-0004760	214916235	FDCQ	330604012051GB00708F00030081	浙(2017)绍兴市上虞区不动产权第0028686号	共同共有	百官街道大通水尚名都3幢2801室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0028686	28686	33001414315	2017/10/24 14:53:18	3	28	01		2018-10-25 13:40:53	2018-10-25 16:42:13
1179	216635085	20180223-0014749	216635078	FDCQ	330604012051GB00708F00050006	浙(2018)绍兴市上虞区不动产权第0010265号	共同共有	百官街道大通水尚名都6幢102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.09㎡/房屋建筑面积89.23㎡	5.09	89.23	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0010265	10265	33003322846	2018/2/23 14:55:22	6	1	02		2018-10-25 13:40:53	2018-10-25 16:42:13
1180	112803253	20170818-0088871	112803247	FDCQ	330604012051GB00708F00070024	浙(2017)绍兴市上虞区不动产权第0022546号	共同共有	百官街道大通水尚名都8幢1单元202室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0022546	22546	33001409794	2017/8/18 10:45:44	8	2	02	1	2018-10-25 13:40:53	2018-10-25 16:42:13
1181	213486596	20170927-0000872	213486589	FDCQ	330604012051GB00708F00050010	浙(2017)绍兴市上虞区不动产权第0026772号	共同共有	百官街道大通水尚名都6幢1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026772	26772	33001413232	2017/9/27 11:54:55	6	11	02		2018-10-25 13:40:53	2018-10-25 16:42:13
1182	213270081	20170908-0092668	213270075	FDCQ	330604012051GB00708F00060043	浙(2017)绍兴市上虞区不动产权第0024948号	单独所有	百官街道大通水尚名都7幢1单元1903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0024948	24948	33001411096	2017/9/8 15:10:08	7	19	03	1	2018-10-25 13:40:53	2018-10-25 16:42:13
1183	112950778	20170822-0089455	112950771	FDCQ	330604012051GB00708F00040056	浙(2017)绍兴市上虞区不动产权第0023803号	共同共有	百官街道大通水尚名都5幢2104室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积87.19㎡	4.92	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0023803	23803	33001410808	2017/8/22 14:53:31	5	21	04		2018-10-25 13:40:53	2018-10-25 16:42:13
1184	112794703	20170818-0088724	112794698	FDCQ	330604012051GB00708F00090068	浙(2017)绍兴市上虞区不动产权第0022444号	单独所有	百官街道大通水尚名都10幢23A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0022444	22444	33001409893	2017/8/18 8:54:15	10	24	04		2018-10-25 13:40:53	2018-10-25 16:42:13
1185	213496805	20170928-0001036	213496799	FDCQ	330604012051GB00708F00060136	浙(2017)绍兴市上虞区不动产权第0026930号	共同共有	百官街道大通水尚名都7幢2单元1708室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0026930	26930	33001412981	2017/9/28 10:15:13	7	17	08	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1187	213599514	20171012-0002627	213599507	FDCQ	330604012051GB00708F00060042	浙(2017)绍兴市上虞区不动产权第0028056号	共同共有	百官街道大通水尚名都7幢1单元1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.12㎡/房屋建筑面积89.38㎡	5.12	89.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0028056	28056	33001413183	2017/10/12 16:41:11	7	19	02	1	2018-10-25 13:40:53	2018-10-25 16:42:13
1188	213599555	20171012-0002621	213599549	FDCQ	330604012051GB00708F00060168	浙(2017)绍兴市上虞区不动产权第0027367号	共同共有	百官街道大通水尚名都7幢2单元23A08室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0027367	27367	33001413349	2017/10/12 16:41:58	7	24	08	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1189	217397240	20180408-0025014	217397232	FDCQ	330604012051GB00708F00030046	浙(2018)绍兴市上虞区不动产权第0018860号	共同共有	百官街道大通水尚名都3幢2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0018860	18860	33003325409	2018/4/8 15:39:59	3	20	02		2018-10-25 13:40:53	2018-10-25 16:42:13
1190	215755996	20180102-0000172	215755989	FDCQ	330604012051GB00708F00060005	浙(2018)绍兴市上虞区不动产权第0000039号	共同共有	百官街道大通水尚名都7幢1单元101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.01㎡/房屋建筑面积87.35㎡	5.01	87.35	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0000039	39	33003114381	2018/1/2 10:28:31	7	1	01	1	2018-10-25 13:40:53	2018-10-25 16:42:13
1	219321998	20180529-0037767	219321992	FDCQ	330604012051GB00708F00070103	浙(2018)绍兴市上虞区不动产权第0026611号	共同共有	百官街道大通水尚名都8幢2单元303室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0026611	26611	33003330771	2018/5/29 9:35:18	8	3	03	2	2018-10-25 13:40:48	2018-10-25 16:40:55
15	109124464	20161108-0033637	109124459	FDCQ	330604012051GB00708F00080100	浙(2016)绍兴市上虞区不动产权第0017641号	单独所有	百官街道大通水尚名都9幢2单元2904室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017641	17641	33100061407	2016/11/8 15:29:37	9	29	04	2	2018-10-25 13:40:48	2018-10-25 16:40:55
1192	216420650	20180131-0011000	216420644	FDCQ	330604012051GB00708F00040046	浙(2018)绍兴市上虞区不动产权第0008404号	共同共有	百官街道大通水尚名都5幢2002室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0008404	8404	33003320654	2018/1/31 14:16:54	5	20	02		2018-10-25 13:40:53	2018-10-25 16:42:13
1193	216100339	20180118-0005951	216100333	FDCQ	330604012051GB00708F00050036	浙(2018)绍兴市上虞区不动产权第0004653号	单独所有	百官街道大通水尚名都6幢1704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0004653	4653	33003118716	2018/1/18 9:29:16	6	17	04		2018-10-25 13:40:53	2018-10-25 16:42:13
1194	216698363	20180301-0015952	216698357	FDCQ	330604012051GB00708F00100053	浙(2018)绍兴市上虞区不动产权第0010865号	共同共有	百官街道大通水尚名都11幢2单元12A05室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0010865	10865	33003323488	2018/3/1 16:16:00	11	13	05	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1195	220579194	20180824-0060610	220579189	FDCQ	330604012051GB00708F00090029	浙(2018)绍兴市上虞区不动产权第0039666号	单独所有	百官街道大通水尚名都10幢1601室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.64㎡/房屋建筑面积140.04㎡	6.64	140.04	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0039666	39666	33003380242	2018/8/24 17:16:38	10	16	01		2018-10-25 13:40:53	2018-10-25 16:42:13
1196	216768710	20180307-0017260	216768703	FDCQ	330604012051GB00708F00100073	浙(2018)绍兴市上虞区不动产权第0011537号	共同共有	百官街道大通水尚名都11幢2单元305室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0011537	11537	33003322995	2018/3/7 16:40:06	11	3	05	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1197	216830035	20180312-0018205	216830028	FDCQ	330604012051GB00708F00100069	浙(2018)绍兴市上虞区不动产权第0012040号	共同共有	百官街道大通水尚名都11幢2单元2105室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.64㎡/房屋建筑面积139.11㎡	10.64	139.11	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0012040	12040	33003324713	2018/3/12 14:17:05	11	21	05	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1198	217200467	20180326-0021991	217200461	FDCQ	330604012051GB00708F00080078	浙(2018)绍兴市上虞区不动产权第0014869号	共同共有	百官街道大通水尚名都9幢2单元1904室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.4㎡/房屋建筑面积126.13㎡	5.4	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0014869	14869	33003325268	2018/3/26 15:42:42	9	19	04	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1199	217485263	20180413-0026730	217485257	FDCQ	330604012051GB00708F00040007	浙(2018)绍兴市上虞区不动产权第0020039号	单独所有	百官街道大通水尚名都5幢103室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积89.23㎡	5.03	89.23	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0020039	20039	33003326185	2018/4/13 10:40:07	5	1	03		2018-10-25 13:40:53	2018-10-25 16:42:13
1200	217424155	20180410-0025449	217424149	FDCQ	330604012051GB00708F00070097	浙(2018)绍兴市上虞区不动产权第0019312号	单独所有	百官街道大通水尚名都8幢2单元2803室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0019312	19312	33003326366	2018/4/10 8:56:40	8	28	03	2	2018-10-25 13:40:53	2018-10-25 16:42:13
1201	220992305	20180929-0068603	220992298	FDCQ	330604012051GB00708F00090024	浙(2018)绍兴市上虞区不动产权第0045906号	共同共有	百官街道大通水尚名都10幢12B04室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0045906	45906	33003384366	2018/9/29 9:25:44	10	13	04		2018-10-25 13:40:53	2018-10-25 16:42:13
26	220312644	20180807-0055761	220312638	FDCQ	330604012051GB00708F00090039	浙(2018)绍兴市上虞区不动产权第0036771号	共同共有	百官街道大通水尚名都10幢17A03室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2018	0036771	36771	33003377036	2018/8/7 16:50:10	10	18	03		2018-10-25 13:40:48	2018-10-25 16:40:55
29	109256333	20161123-0036569	109256327	FDCQ	330604012051GB00708F00060009	浙(2016)绍兴市上虞区不动产权第0018757号	共同共有	百官街道大通水尚名都7幢1单元1101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.0㎡/房屋建筑面积87.16㎡	5.0	87.16	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018757	18757	33100062494	2016/11/23 14:17:44	7	11	01	1	2018-10-25 13:40:48	2018-10-25 16:40:55
36	215012968	20171102-0006618	215012961	FDCQ	330604012051GB00708F00070075	浙(2017)绍兴市上虞区不动产权第0029529号	共同共有	百官街道大通水尚名都8幢2单元17A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0029529	29529	33001415664	2017/11/2 11:05:37	8	18	03	2	2018-10-25 13:40:48	2018-10-25 16:40:55
43	219951251	20180712-0048981	219951244	FDCQ	330604012051GB00708F00090004	浙(2018)绍兴市上虞区不动产权第0033089号	共同共有	百官街道大通水尚名都10幢1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.21㎡/房屋建筑面积109.95㎡	5.21	109.95	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让	浙	绍兴市上虞区	2018	0033089	33089	33003371455	2018/7/12 10:03:04	10	10	04		2018-10-25 13:40:48	2018-10-25 16:40:55
52	215359083	20171208-0014027	215359076	FDCQ	330604012051GB00708F00020016	浙(2017)绍兴市上虞区不动产权第0032710号	共同共有	百官街道大通水尚名都2幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	取得不动产权证书满2年后方可转让。	浙	绍兴市上虞区	2017	0032710	32710	33001416923	2017/12/8 16:07:45	2	16	02		2018-10-25 13:40:48	2018-10-25 16:40:55
57	108987227	20161025-0030857	108987222	FDCQ	330604012051GB00708F00030020	浙(2016)绍兴市上虞区不动产权第0015924号	单独所有	百官街道大通水尚名都3幢12A04室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0015924	15924	33100059748	2016/10/25 14:26:38	3	13	04		2018-10-25 13:40:48	2018-10-25 16:40:55
71	108987777	20161025-0030871	108987771	FDCQ	330604012051GB00708F00050016	浙(2016)绍兴市上虞区不动产权第0016055号	共同共有	百官街道大通水尚名都6幢1204室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016055	16055	33100060271	2016/10/25 14:44:03	6	12	04		2018-10-25 13:40:48	2018-10-25 16:40:55
85	217780508	20180504-0032769	217780502	FDCQ	330604012051GB00708F00070088	浙(2018)绍兴市上虞区不动产权第0024075号	单独所有	百官街道大通水尚名都8幢2单元2304室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2018	0024075	24075	33003331697	2018/5/4 15:46:34	8	23	04	2	2018-10-25 13:40:48	2018-10-25 16:40:55
99	109043272	20161101-0032048	109043267	FDCQ	330604012051GB00708F00020048	浙(2016)绍兴市上虞区不动产权第0016751号	单独所有	百官街道大通水尚名都2幢602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016751	16751	33100060798	2016/11/1 11:09:34	2	6	02		2018-10-25 13:40:49	2018-10-25 16:40:55
113	109474153	20161215-0041314	109474147	FDCQ	330604012051GB00708F00050030	浙(2016)绍兴市上虞区不动产权第0021594号	共同共有	百官街道大通水尚名都6幢1602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0021594	21594	33100065196	2016/12/15 14:45:51	6	16	02		2018-10-25 13:40:49	2018-10-25 16:41:07
127	111307612	20170509-0068647	111307606	FDCQ	330604012051GB00708F00020052	浙(2017)绍兴市上虞区不动产权第0013717号	共同共有	百官街道大通水尚名都2幢802室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0013717	13717	33001403229	2017/5/9 16:05:44	2	8	02		2018-10-25 13:40:49	2018-10-25 16:41:07
141	109076912	20161103-0032677	109076906	FDCQ	330604012051GB00708F00070015	浙(2016)绍兴市上虞区不动产权第0017195号	共同共有	百官街道大通水尚名都8幢1单元1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.1㎡/房屋建筑面积142.89㎡	6.1	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017195	17195	33100060990	2016/11/3 14:22:15	8	17	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
155	109007426	20161027-0031292	109007420	FDCQ	330604012051GB00708F00020028	浙(2016)绍兴市上虞区不动产权第0016181号	共同共有	百官街道大通水尚名都2幢2102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016181	16181	33100060024	2016/10/27 14:40:25	2	21	02		2018-10-25 13:40:49	2018-10-25 16:41:07
169	109277415	20161125-0037022	109277410	FDCQ	330604012051GB00708F00010073	浙(2016)绍兴市上虞区不动产权第0019025号	单独所有	百官街道大通水尚名都1幢3101室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019025	19025	33100063071	2016/11/25 14:26:21	1	31	01		2018-10-25 13:40:49	2018-10-25 16:41:07
183	109545426	20161221-0042938	109545420	FDCQ	330604012051GB00708F00120033	浙(2016)绍兴市上虞区不动产权第0022495号	共同共有	百官街道大通水尚名都12幢1单元501室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0022495	22495	33001391402	2016/12/21 14:45:33	12	5	01	1	2018-10-25 13:40:49	2018-10-25 16:41:07
197	108991246	20161026-0030935	108991241	FDCQ	330604012051GB00708F00010087	浙(2016)绍兴市上虞区不动产权第0016103号	单独所有	百官街道大通水尚名都1幢703室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016103	16103	33100060280	2016/10/26 9:09:08	1	7	03		2018-10-25 13:40:49	2018-10-25 16:41:07
211	109240314	20161122-0036225	109240309	FDCQ	330604012051GB00708F00050046	浙(2016)绍兴市上虞区不动产权第0018813号	单独所有	百官街道大通水尚名都6幢2002室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.1㎡/房屋建筑面积89.41㎡	5.1	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018813	18813	33100063016	2016/11/22 10:36:15	6	20	02		2018-10-25 13:40:49	2018-10-25 16:41:07
225	109192788	20161116-0035064	109192782	FDCQ	330604012051GB00708F00050048	浙(2016)绍兴市上虞区不动产权第0018309号	共同共有	百官街道大通水尚名都6幢2004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.97㎡/房屋建筑面积87.19㎡	4.97	87.19	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018309	18309	33100062323	2016/11/16 10:59:48	6	20	04		2018-10-25 13:40:49	2018-10-25 16:41:24
239	109166340	20161114-0034586	109166334	FDCQ	330604012051GB00708F00080015	浙(2016)绍兴市上虞区不动产权第0018140号	共同共有	百官街道大通水尚名都9幢1单元1701室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018140	18140	33100062079	2016/11/14 9:50:47	9	17	01	1	2018-10-25 13:40:49	2018-10-25 16:41:24
253	109109877	20161107-0033263	109109870	FDCQ	330604012051GB00708F00070062	浙(2016)绍兴市上虞区不动产权第0017216号	共同共有	百官街道大通水尚名都8幢2单元1104室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017216	17216	33100061059	2016/11/7 15:00:59	8	11	04	2	2018-10-25 13:40:49	2018-10-25 16:41:24
267	109171156	20161114-0034677	109171151	FDCQ	330604012051GB00708F00070085	浙(2016)绍兴市上虞区不动产权第0017871号	单独所有	百官街道大通水尚名都8幢2单元2203室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.3㎡/房屋建筑面积124.14㎡	5.3	124.14	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017871	17871	33100061480	2016/11/14 14:26:39	8	22	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
281	110009025	20170117-0049778	110009019	FDCQ	330604012051GB00708F00080105	浙(2017)绍兴市上虞区不动产权第0003892号	共同共有	百官街道大通水尚名都9幢2单元3A03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0003892	3892	33001395578	2017/1/17 9:45:52	9	4	03	2	2018-10-25 13:40:49	2018-10-25 16:41:24
295	109079058	20161103-0032714	109079052	FDCQ	330604012051GB00708F00030057	浙(2016)绍兴市上虞区不动产权第0016876号	共同共有	百官街道大通水尚名都3幢2201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016876	16876	33100060878	2016/11/3 15:00:17	3	22	01		2018-10-25 13:40:49	2018-10-25 16:41:24
309	108997714	20161026-0031079	108997708	FDCQ	330604012051GB00708F00040094	浙(2016)绍兴市上虞区不动产权第0016122号	共同共有	百官街道大通水尚名都5幢802室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016122	16122	33100059996	2016/10/26 14:38:39	5	8	02		2018-10-25 13:40:49	2018-10-25 16:41:24
327	109007715	20161027-0031293	109007710	FDCQ	330604012051GB00708F00030025	浙(2016)绍兴市上虞区不动产权第0016223号	单独所有	百官街道大通水尚名都3幢1501室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016223	16223	33100060322	2016/10/27 14:47:57	3	15	01		2018-10-25 13:40:49	2018-10-25 16:41:35
337	109256486	20161123-0036571	109256478	FDCQ	330604012051GB00708F00060072	浙(2016)绍兴市上虞区不动产权第0018908号	共同共有	百官街道大通水尚名都7幢1单元2504室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018908	18908	33100063228	2016/11/23 14:24:14	7	25	04	1	2018-10-25 13:40:49	2018-10-25 16:41:35
351	109217921	20161118-0035719	109217915	FDCQ	330604012051GB00708F00070060	浙(2016)绍兴市上虞区不动产权第0018744号	共同共有	百官街道大通水尚名都8幢2单元1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.38㎡/房屋建筑面积126.13㎡	5.38	126.13	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018744	18744	33100062862	2016/11/18 11:34:02	8	10	04	2	2018-10-25 13:40:49	2018-10-25 16:41:35
365	109215512	20161118-0035672	109215506	FDCQ	330604012051GB00708F00120037	浙(2016)绍兴市上虞区不动产权第0018554号	共同共有	百官街道大通水尚名都12幢1单元701室	国有建设用地使用权/房屋（构筑物）所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018554	18554	33100062416	2016/11/18 10:36:21	12	7	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
379	109166352	20161114-0034584	109166346	FDCQ	330604012051GB00708F00080009	浙(2016)绍兴市上虞区不动产权第0018010号	共同共有	百官街道大通水尚名都9幢1单元12B01室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018010	18010	33100062041	2016/11/14 9:52:07	9	13	01	1	2018-10-25 13:40:50	2018-10-25 16:41:35
393	109115322	20161108-0033404	109115315	FDCQ	330604012051GB00708F00090098	浙(2016)绍兴市上虞区不动产权第0017321号	共同共有	百官街道大通水尚名都10幢3A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积4.14㎡/房屋建筑面积87.45㎡	4.14	87.45	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017321	17321	33100061097	2016/11/8 9:54:08	10	4	02		2018-10-25 13:40:50	2018-10-25 16:41:35
407	109220384	20161118-0035784	109220378	FDCQ	330604012051GB00708F00120006	浙(2016)绍兴市上虞区不动产权第0018524号	共同共有	百官街道大通水尚名都12幢1单元1102室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018524	18524	33100062295	2016/11/18 14:41:10	12	11	02	1	2018-10-25 13:40:50	2018-10-25 16:41:35
421	108569522	20160901-0023124	108569015	FDCQ	330604012051GB00708F00030116	浙(2016)绍兴市上虞区不动产权第0010356号	单独所有	百官街道大通水尚名都3幢704室	国有建设用地使用权/房屋所有权	出让/市场化商品房	出让	市场化商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积4.92㎡/房屋建筑面积112.38㎡	4.92	112.38	国有建设用地使用权2083年01月09日止	\N	资料详见1幢。	浙	绍兴市上虞区	2016	0010356	10356	2016/9/9 8:49:57	3	7	04		2018-10-25 13:40:50	2018-10-25 16:41:36
435	109154936	20161111-0034322	109154930	FDCQ	330604012051GB00708F00100086	浙(2016)绍兴市上虞区不动产权第0018103号	共同共有	百官街道大通水尚名都11幢2单元906室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018103	18103	33100062067	2016/11/11 10:26:34	11	9	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
449	111642688	20170602-0073595	111642682	FDCQ	330604012051GB00708F00020036	浙(2017)绍兴市上虞区不动产权第0016533号	共同共有	百官街道大通水尚名都2幢2502室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	城镇住宅用地/住宅	城镇住宅用地	住宅	土地使用权面积8.68㎡/房屋建筑面积188.80㎡	8.68	188.80	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2017	0016533	16533	33001404792	2017/6/2 9:30:31	2	25	02		2018-10-25 13:40:50	2018-10-25 16:41:40
463	109076902	20161031-0031862	109076896	FDCQ	330604012051GB00708F00120086	浙(2016)绍兴市上虞区不动产权第0016414号	共同共有	百官街道大通水尚名都12幢2单元906室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.67㎡/房屋建筑面积127.40㎡	9.67	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016414	16414	33100060719	2016/11/3 14:21:59	12	9	06	2	2018-10-25 13:40:50	2018-10-25 16:41:40
491	109222971	20161118-0035843	109222965	FDCQ	330604012051GB00708F00080020	浙(2016)绍兴市上虞区不动产权第0018526号	共同共有	百官街道大通水尚名都9幢1单元1902室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.32㎡/房屋建筑面积124.15㎡	5.32	124.15	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018526	18526	33100062296	2016/11/18 15:53:29	9	19	02	1	2018-10-25 13:40:50	2018-10-25 16:41:40
505	109159277	20161111-0034426	109159271	FDCQ	330604012051GB00708F00100043	浙(2016)绍兴市上虞区不动产权第0017684号	共同共有	百官街道大通水尚名都11幢1单元903室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积9.75㎡/房屋建筑面积127.40㎡	9.75	127.40	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017684	17684	33100061418	2016/11/11 14:37:27	11	9	03	1	2018-10-25 13:40:50	2018-10-25 16:41:40
519	108979187	20161024-0030684	108979179	FDCQ	330604012051GB00708F00010042	浙(2016)绍兴市上虞区不动产权第0016168号	共同共有	百官街道大通水尚名都1幢2103室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.55㎡/房屋建筑面积139.97㎡	6.55	139.97	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016168	16168	33100060301	2016/10/24 16:28:23	1	21	03		2018-10-25 13:40:50	2018-10-25 16:41:40
533	109047743	20161101-0032166	109047737	FDCQ	330604012051GB00708F00030062	浙(2016)绍兴市上虞区不动产权第0016580号	共同共有	百官街道大通水尚名都3幢2302室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016580	16580	33100060441	2016/11/1 14:57:34	3	23	02		2018-10-25 13:40:50	2018-10-25 16:41:40
547	109012394	20161028-0031409	109012388	FDCQ	330604012051GB00708F00030074	浙(2016)绍兴市上虞区不动产权第0016344号	共同共有	百官街道大通水尚名都3幢2602室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016344	16344	33100060387	2016/10/28 9:06:39	3	26	02		2018-10-25 13:40:50	2018-10-25 16:41:44
561	109148828	20161110-0034155	109148819	FDCQ	330604012051GB00708F00030066	浙(2016)绍兴市上虞区不动产权第0017536号	共同共有	百官街道大通水尚名都3幢23A02室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积3.91㎡/房屋建筑面积89.23㎡	3.91	89.23	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017536	17536	33100061269	2016/11/10 14:32:48	3	24	02		2018-10-25 13:40:50	2018-10-25 16:41:44
575	109138192	20161109-0033938	109138186	FDCQ	330604012051GB00708F00120044	浙(2016)绍兴市上虞区不动产权第0017418号	共同共有	百官街道大通水尚名都12幢1单元904室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积10.55㎡/房屋建筑面积139.11㎡	10.55	139.11	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017418	17418	33100061221	2016/11/9 15:27:38	12	9	04	1	2018-10-25 13:40:50	2018-10-25 16:41:44
589	109243045	20161122-0036294	109243039	FDCQ	330604012051GB00708F00060181	浙(2016)绍兴市上虞区不动产权第0018638号	共同共有	百官街道大通水尚名都7幢2单元505室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0018638	18638	33100062450	2016/11/22 11:32:31	7	5	05	2	2018-10-25 13:40:50	2018-10-25 16:41:45
603	109091028	20161101-0032156	109091022	FDCQ	330604012051GB00708F00040023	浙(2016)绍兴市上虞区不动产权第0016602号	共同共有	百官街道大通水尚名都5幢12B03室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.04㎡/房屋建筑面积89.41㎡	5.04	89.41	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0016602	16602	33100060450	2016/11/4 14:14:20	5	13	03		2018-10-25 13:40:50	2018-10-25 16:41:45
617	109266134	20161124-0036789	109266128	FDCQ	330604012051GB00708F00080023	浙(2016)绍兴市上虞区不动产权第0019000号	共同共有	百官街道大通水尚名都9幢1单元201室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积6.12㎡/房屋建筑面积142.89㎡	6.12	142.89	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0019000	19000	33100063254	2016/11/24 14:32:24	9	2	01	1	2018-10-25 13:40:51	2018-10-25 16:41:45
631	109136030	20161109-0033877	109136025	FDCQ	330604012051GB00708F00060004	浙(2016)绍兴市上虞区不动产权第0017428号	单独所有	百官街道大通水尚名都7幢1单元1004室	国有建设用地使用权/房屋所有权	出让/商品房	出让	商品房	住宅用地/住宅	住宅用地	住宅	土地使用权面积5.03㎡/房屋建筑面积87.79㎡	5.03	87.79	国有建设用地使用权2083年01月09日止	\N	浙	绍兴市上虞区	2016	0017428	17428	33100061224	2016/11/9 14:30:01	7	10	04	1	2018-10-25 13:40:51	2018-10-25 16:41:45
\.


--
-- Data for Name: household_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.household_maps (id, geom, realestate_id, build_guid, build_no, room_no, build_id) FROM stdin;
1	01030000A0E6100000010000000D0000006B3DC2967A365E40D88220B0120B3E400000000000000000599356967A365E400C5067ED110B3E400000000000000000A8E944617B365E405B4D2AE8110B3E400000000000000000284AF15F7B365E4007890BC60E0B3E400000000000000000151D99A27B365E40EB9046C40E0B3E40000000000000000067CDD0A07B365E4088E26E820B0B3E400000000000000000596260827B365E403E9F38830B0B3E400000000000000000EF833E817B365E407DBF8571090B3E4000000000000000005873E48F7A365E404A42C577090B3E400000000000000000193AE08F7A365E409EC33870090B3E4000000000000000008B12CB397A365E407D837472090B3E4000000000000000004015DB3E7A365E402C3BF6B2120B3E4000000000000000006B3DC2967A365E40D88220B0120B3E400000000000000000	1	6	7	01	6
2	01030000A0E61000000100000010000000CF0501E279365E4007DA0D25130B3E4000000000000000004E7F0EE179365E4049E9D169110B3E400000000000000000131674E979365E4027DB9669110B3E400000000000000000FBCD29EA79365E40AA6EB1B5120B3E4000000000000000004015DB3E7A365E402C3BF6B2120B3E4000000000000000008B12CB397A365E407D837472090B3E400000000000000000666C9CEA79365E40616B8274090B3E400000000000000000F03806EA79365E4011B3855C080B3E400000000000000000EBB0AF5C79365E407E4B2E60080B3E40000000000000000042CEEBE278365E4095285563080B3E400000000000000000A8EC0CE378365E40634DDD9F080B3E400000000000000000AECB38D178365E40807053A0080B3E40000000000000000032BAACD178365E40D8B03774090B3E40000000000000000056811E7E78365E4018586176090B3E4000000000000000004585BF8378365E40D23E002F130B3E400000000000000000CF0501E279365E4007DA0D25130B3E400000000000000000	1	6	7	02	6
3	01030000A0E610000001000000100000004585BF8378365E40D23E002F130B3E40000000000000000056811E7E78365E4018586176090B3E400000000000000000FDE70F1E78365E407ED1DD78090B3E40000000000000000017FD9B1D78365E40C270FDA4080B3E4000000000000000001511360C78365E40FAB770A5080B3E40000000000000000012F1140C78365E405CB3E468080B3E4000000000000000005D0D519277365E4047F0096C080B3E400000000000000000B93CFF0477365E4009C7BA6F080B3E400000000000000000D1F7A30577365E4055256BA1090B3E400000000000000000BE79B3C276365E4048A426A3090B3E400000000000000000CBC0B9C776365E40234A74D2120B3E400000000000000000245B240C77365E40FFE1B5D1120B3E40000000000000000084554C0B77365E401D46D546110B3E400000000000000000E6BD012477365E403790E945110B3E40000000000000000065DD132577365E40EE6CF538130B3E4000000000000000004585BF8378365E40D23E002F130B3E400000000000000000	1	6	7	03	6
4	01030000A0E6100000010000000C0000003F3A90AC75365E40B92CEF14120B3E400000000000000000D82FEF7175365E40CA1D63080B0B3E400000000000000000D3805E5B75365E40499290B5090B3E4000000000000000006215F15675365E40CCB27B6B090B3E40000000000000000072C4FE6D74365E40001817140A0B3E4000000000000000006534477074365E404FE86A340A0B3E40000000000000000020DC4A1374365E40B59FF8700A0B3E400000000000000000D54D768F74365E40C80F6697130B3E400000000000000000E711E0EA74365E408647E15E130B3E400000000000000000BA6E3CE074365E40E47BBE82120B3E400000000000000000B036A2AC75365E4098269316120B3E4000000000000000003F3A90AC75365E40B92CEF14120B3E400000000000000000	1	6	7	05	6
5	01030000A0E61000000100000011000000F38FB33D74365E406F827839140B3E400000000000000000D2FD182374365E40FBFCB34D120B3E40000000000000000096E35D4474365E4054082837120B3E40000000000000000052519F4474365E401FB1293C120B3E40000000000000000011A2A33B74365E40DDE7B741120B3E400000000000000000FC7D184F74365E40F1E831BF130B3E400000000000000000D54D768F74365E40C50F6697130B3E40000000000000000020DC4A1374365E40B19FF8700A0B3E4000000000000000003CA654CF73365E400F913A9D0A0B3E400000000000000000B8A36DBC73365E40CB3CED7F090B3E400000000000000000D0F8A73E73365E4056FBD4D2090B3E40000000000000000057C1773E73365E406DB098CF090B3E4000000000000000006867ACBA72365E408404572C0A0B3E400000000000000000E7BE9DC972365E40807FF9370B0B3E400000000000000000ADD87F5E72365E400396B37D0B0B3E400000000000000000911C1FE172365E40663ADD1D150B3E400000000000000000F38FB33D74365E406F827839140B3E400000000000000000	1	6	7	06	6
6	01030000A0E610000001000000100000005A841B2771365E40E5371DC8150B3E40000000000000000079730AAA70365E403619BE900C0B3E400000000000000000EC91FB5070365E4041DAC4CA0C0B3E40000000000000000080575C5070365E4001FD3BBE0C0B3E400000000000000000AEFCED636F365E40012C9B560D0B3E4000000000000000001D89E3676F365E40480B02A10D0B3E40000000000000000094D4BF836F365E407B5D56AE0F0B3E400000000000000000F179AC666F365E4029CE0DC10F0B3E40000000000000000069C3A58C6F365E401132F98C120B3E400000000000000000AF1B28D36F365E402F36AB5F120B3E4000000000000000008ADB05E46F365E4094058399130B3E4000000000000000001AF9F0DB6F365E404870199F130B3E400000000000000000DCD925F96F365E4080F579C4150B3E400000000000000000E490F0C670365E40E808043D150B3E40000000000000000069138FD170365E40DD9A6A00160B3E4000000000000000005A841B2771365E40E5371DC8150B3E400000000000000000	1	6	7	08	6
7	01030000A0E6100000010000000F000000911C1FE172365E40663ADD1D150B3E400000000000000000ADD87F5E72365E400396B37D0B0B3E400000000000000000A5DFAFF871365E4064B8F9BF0B0B3E4000000000000000005AEA5FEC71365E40D5B8FCBC0A0B3E4000000000000000005B17FA7271365E40F3A7EE000B0B3E400000000000000000C53DCE7271365E409CF7B2FD0A0B3E40000000000000000004D1E1E770365E4087A876560B0B3E4000000000000000007AE075F670365E40C369F35E0C0B3E40000000000000000079730AAA70365E403619BE900C0B3E4000000000000000005A841B2771365E40E5371DC8150B3E400000000000000000DF46777171365E40BC282D97150B3E40000000000000000058F0D85F71365E4071616153140B3E400000000000000000B943A07671365E4084308D44140B3E40000000000000000069ED308E71365E40752BEFFB150B3E400000000000000000911C1FE172365E40663ADD1D150B3E400000000000000000	1	6	7	07	6
51	01030000A0E610000001000000070000007ABCD28475365E407055950DB00B3E40000000000000000064B97CCB75365E407BF1916AB00B3E4000000000000000009609EF5876365E40C8B8B554AB0B3E4000000000000000001A885EE774365E40D3C1E968A90B3E400000000000000000672D9E1974365E40831BFBCAB00B3E400000000000000000003F9E4575365E40F8CA5C53B20B3E4000000000000000007ABCD28475365E407055950DB00B3E400000000000000000	1	11	12	01	11
8	01030000A0E6100000010000000D000000D4D5A73680365E40EBA478640F0B3E400000000000000000DBAC223F80365E4062DACB1E0F0B3E400000000000000000995C99077F365E4064879B530D0B3E400000000000000000DA8C1EFF7E365E40855C48990D0B3E4000000000000000002068EEC37E365E40951C9C7F0F0B3E400000000000000000530E7DA87E365E40B4631F570F0B3E40000000000000000046DFF4487E365E40059B4155120B3E4000000000000000008E06908B7E365E4080CA5AB7120B3E400000000000000000132B9F327E365E4013962992150B3E40000000000000000096B094F57E365E40586CC4AF160B3E400000000000000000FB2A2FDF7E365E40C047096B170B3E4000000000000000002C76BE2E7F365E401484E8DC170B3E400000000000000000D4D5A73680365E40EBA478640F0B3E400000000000000000	1	5	6	04	5
9	01030000A0E6100000010000001000000090E632CD81365E407B93FDCD110B3E40000000000000000061C6ADD581365E4081775088110B3E400000000000000000473CB76C81365E40C7F924F0100B3E400000000000000000618AB78C81365E40687317F30F0B3E4000000000000000007A96311081365E4076F8803B0F0B3E400000000000000000BB020F9A80365E40217C648D0E0B3E4000000000000000002DB7387D80365E4074D44E7A0F0B3E400000000000000000DBAC223F80365E4062DACB1E0F0B3E400000000000000000D4D5A73680365E40EBA478640F0B3E4000000000000000002C76BE2E7F365E401484E8DC170B3E4000000000000000002A16D6707F365E40CB2B813B180B3E40000000000000000009FA6F957F365E4041C8AA0E170B3E400000000000000000E97A54AC7F365E4037F06830170B3E40000000000000000061710E7D7F365E40627DE6C0180B3E400000000000000000545DEFBB80365E402E4646931A0B3E40000000000000000090E632CD81365E407B93FDCD110B3E400000000000000000	1	5	6	03	5
10	01030000A0E61000000100000010000000ED480C6A83365E4080A5B203140B3E4000000000000000000A23877283365E40FCAE05BE130B3E400000000000000000E315BC2883365E40FB56F84F130B3E400000000000000000EC09D44283365E40458ED178120B3E400000000000000000A59AAFCC82365E40AD7AAACA110B3E40000000000000000001D88C5082365E403734C013110B3E4000000000000000006F1E1C4A82365E401264AB48110B3E4000000000000000000456183A82365E40B3DB0E31110B3E4000000000000000006DC0E12182365E40D415CAF6110B3E40000000000000000061C6ADD581365E4081775088110B3E40000000000000000090E632CD81365E407B93FDCD110B3E400000000000000000545DEFBB80365E402E4646931A0B3E400000000000000000C4F60A0C82365E407F97D87E1C0B3E40000000000000000079D8F21782365E405758DC1C1C0B3E400000000000000000795FAE6082365E4018C319881C0B3E400000000000000000ED480C6A83365E4080A5B203140B3E400000000000000000	1	5	6	02	5
11	01030000A0E6100000010000000F000000E0DA78CE83365E408A9107501B0B3E400000000000000000B13160CA83365E401D1FFF491B0B3E400000000000000000B43F43E283365E404CD4BD851A0B3E400000000000000000606BDE1E84365E409A0F00DC1A0B3E4000000000000000005261827C84365E405C582FDD170B3E4000000000000000001B231F6184365E408D0D12B5170B3E400000000000000000C8D8459C84365E40AF7563CC150B3E400000000000000000F756D6A484365E404BC5D686150B3E4000000000000000000A23877283365E40FCAE05BE130B3E400000000000000000ED480C6A83365E4080A5B203140B3E400000000000000000795FAE6082365E4018C319881C0B3E40000000000000000019781FB682365E407A5C14061D0B3E4000000000000000008AA0EECB82365E40AFA968511C0B3E4000000000000000007EE61B8D83365E4000EAD56B1D0B3E400000000000000000E0DA78CE83365E408A9107501B0B3E400000000000000000	1	5	6	01	5
12	01030000A0E6100000010000001000000047E90D278F365E40BC45329E2D0B3E400000000000000000557839228F365E401858EBCF2C0B3E400000000000000000A69F92F38F365E404451A9942C0B3E400000000000000000C6EAE9E58F365E40FABCEE4C2A0B3E400000000000000000EFBBD4DC8F365E40BC557F4F2A0B3E400000000000000000F5C5E4D78F365E409A28337C290B3E400000000000000000267CBB2390365E4091C3E666290B3E400000000000000000F3D0591090365E4074CE2D29260B3E4000000000000000008686BBF38F365E4049764731260B3E40000000000000000069D62DE78F365E401413C619240B3E400000000000000000E7E869E58F365E405E515BCE230B3E4000000000000000008F64E9F58E365E400EA64012240B3E40000000000000000037A3E6F68E365E401866703C240B3E400000000000000000A09BFE988E365E40644D0157240B3E4000285C8FC2A54640A8F3E9D08E365E40EEC0ADB12D0B3E4000285C8FC2A5464047E90D278F365E40BC45329E2D0B3E400000000000000000	1	4	5	01	4
13	01030000A0E6100000010000000D000000E38918728E365E401108A0302E0B3E4000000000000000008317AA6F8E365E40FC6BACC72D0B3E400000000000000000A8F3E9D08E365E40EEC0ADB12D0B3E4000285C8FC2A54640A09BFE988E365E40644D0157240B3E4000285C8FC2A546404FE9F84E8E365E40AD24F26B240B3E40000000000000000086A9E9478E365E4003403642230B3E400000000000000000E16611C88D365E404D7D7B66230B3E400000000000000000FDC5B7418D365E402B3B978C230B3E400000000000000000F3040C488D365E40AAB4BB9B240B3E4000000000000000005299DBDD8C365E40AB28C4B9240B3E4000285C8FC2A546400E7A9EDF8C365E40B0362F05250B3E4000285C8FC2A55640FECB561E8D365E40451EE68F2E0B3E4000285C8FC2A54640E38918728E365E401108A0302E0B3E400000000000000000	1	4	5	02	4
14	01030000A0E61000000100000010000000BDA9B85C8B365E40EDC7F3AB2E0B3E4000285C8FC2A54640660361248B365E405E481B3F250B3E4000285C8FC2A546400CEB7FC68A365E406FCDBD59250B3E4000000000000000005D6678C58A365E405922FF2D250B3E400000000000000000E45216D789365E40C7B6A771250B3E4000000000000000009EC7DAD889365E40855212BD250B3E40000000000000000083867DE489365E4007B732CD270B3E4000000000000000001F1788C789365E40D43E63D5270B3E4000000000000000008E8CF8DA89365E402CBDFB122B0B3E4000000000000000002C7C26258A365E40DB4F0CFE2A0B3E40000000000000000038269E2B8A365E40850595022C0B3E400000000000000000D9CFDC1E8A365E404369FD072C0B3E40000000000000000059F4632C8A365E402017F14A2E0B3E400000000000000000CA2E66FC8A365E40CE25C60B2E0B3E400000000000000000703730018B365E403096B2CA2E0B3E400000000000000000BDA9B85C8B365E40EDC7F3AB2E0B3E4000285C8FC2A54640	1	4	5	04	4
15	01030000A0E6100000010000000F000000FECB561E8D365E40451EE68F2E0B3E4000285C8FC2A546400E7A9EDF8C365E40B0362F05250B3E4000285C8FC2A556405299DBDD8C365E40AB28C4B9240B3E4000285C8FC2A54640662DAB738C365E405197CCD7240B3E400000000000000000E998FE6B8C365E4067E40A91230B3E4000000000000000009625A0F28B365E40E5AB7AB3230B3E4000000000000000000E2134668B365E40461159DB230B3E40000000000000000039F80C6E8B365E402571342A250B3E400000000000000000660361248B365E405E481B3F250B3E4000285C8FC2A54640BDA9B85C8B365E40EDC7F3AB2E0B3E4000285C8FC2A54640792FC29E8B365E400B51C5952E0B3E4000000000000000009234A0978B365E40B61A1B4F2D0B3E40000000000000000006D63CAF8B365E400EC678482D0B3E400000000000000000A6012DB98B365E408E860DF42E0B3E400000000000000000FECB561E8D365E40451EE68F2E0B3E4000285C8FC2A54640	1	4	5	03	4
16	01030000A0E6100000010000000A0000005DC8731770365E40EDCD492D360B3E4000000000000000009C2D411570365E40A7D66E73350B3E40000000000000000016CC249870365E40009CAB60350B3E400000000000000000A2D0129370365E409B8880B5330B3E40000000000000000086946F4371365E406D62B087330B3E4000000000000000000492CA1C71365E40B926CB772C0B3E400000000000000000B699231B71365E406671582C2C0B3E400000000000000000AE19BC106F365E4067A7E4B62C0B3E400000000000000000E2B0C03E6F365E4082B3F862360B3E4000000000000000005DC8731770365E40EDCD492D360B3E400000000000000000	1	7	8	01	7
17	01030000A0E6100000010000000E000000E2B0C03E6F365E4082B3F862360B3E400000000000000000AE19BC106F365E4067A7E4B62C0B3E40000000000000000015C469DE6E365E40FE2B3DC42C0B3E400000000000000000F37249DF6E365E40339F49E92C0B3E400000000000000000B92A7F176E365E40B2ADC71A2D0B3E40000000000000000030965E156E365E40530BECB22C0B3E400000000000000000D9A0291A6D365E4001642DF12C0B3E4000000000000000008C6E711B6D365E4092B3B63C2D0B3E40000000000000000078959C416D365E403B8B4BD9340B3E4000000000000000001D0517DA6D365E403C1D85B3340B3E4000000000000000002FE7A3DE6D365E4096763092350B3E4000000000000000001F8823606E365E40FF7D1972350B3E400000000000000000463A2B666E365E409C2BA098360B3E400000000000000000E2B0C03E6F365E4082B3F862360B3E400000000000000000	1	7	8	02	7
18	01030000A0E6100000010000000D000000EACB972A6C365E402C41D226370B3E40000000000000000077579C246C365E40A3C34602360B3E4000000000000000009AD722A86C365E40158BB2E1350B3E400000000000000000925288A36C365E4016257500350B3E40000000000000000078959C416D365E403B8B4BD9340B3E4000000000000000008C6E711B6D365E4092B3B63C2D0B3E400000000000000000D9A0291A6D365E4001642DF12C0B3E4000000000000000002A4F8F186D365E404EA78BF12C0B3E400000000000000000BC05591D6C365E40D835CD2F2D0B3E40000000000000000096946F1F6C365E4075EAB6952D0B3E400000000000000000EB24CD286B365E407879CFD22D0B3E400000000000000000A2C9B9446B365E40728CC65F370B3E400000000000000000EACB972A6C365E402C41D226370B3E400000000000000000	1	7	8	03	7
19	01030000A0E6100000010000000E000000A2C9B9446B365E40728CC65F370B3E400000000000000000EB24CD286B365E407879CFD22D0B3E400000000000000000862A341F6A365E4032779A142E0B3E400000000000000000F43CE71C6A365E40D43E4CA42D0B3E4000000000000000002138EC1F69365E4094C9F1E22D0B3E400000000000000000584C772169365E4036A66B2E2E0B3E400000000000000000BB3D342369365E40DB0544832E0B3E4000000000000000002DEF02F468365E40FF12F58E2E0B3E400000000000000000C1B9461A69365E407D33FFDD350B3E400000000000000000A65FCDEC69365E401ABED5A9350B3E4000000000000000001D94FBF269365E40D140C2D7360B3E4000000000000000003FAC09746A365E4095D6C9B7360B3E4000000000000000006E9783786A365E405D735F92370B3E400000000000000000A2C9B9446B365E40728CC65F370B3E400000000000000000	1	7	8	04	7
20	01030000A0E6100000010000000C00000077C5EF4188365E40D6700DB1560B3E4000000000000000008700B53F88365E407B520446560B3E400000000000000000185BC48489365E40F92832F4550B3E40000000000000000026FDE36189365E40FBB01D664F0B3E40000000000000000074D4C94489365E40F21C706D4F0B3E400000000000000000579C2E3989365E404290C53E4D0B3E400000000000000000D7379D3789365E4033494DF34C0B3E400000000000000000DA95D40D88365E4021023A3E4D0B3E400000000000000000EA3F5D0A88365E40927A1F974C0B3E40000000000000000071A24CD987365E402ADD78A34C0B3E4000000000000000005645181688365E4064BF14BC560B3E40000000000000000077C5EF4188365E40D6700DB1560B3E400000000000000000	1	3	3	01	3
21	01030000A0E6100000010000000900000079DB76A087365E402DCE123F570B3E4000000000000000007E47169E87365E4068F144DA560B3E4000000000000000005645181688365E4064BF14BC560B3E40000000000000000071A24CD987365E402ADD78A34C0B3E40000000000000000081C12A1687365E40F4B995D44C0B3E400000000000000000309EDC1987365E40F5CEB3864D0B3E400000000000000000ACC3B91E86365E40F7B8E5C54D0B3E400000000000000000EF51F65986365E408D9C429C570B3E40000000000000000079DB76A087365E402DCE123F570B3E400000000000000000	1	3	3	02	3
22	01030000A0E6100000010000000F000000FF88AF9884365E40C484C1A1570B3E4000000000000000005CEF756784365E403B43FF744F0B3E40000000000000000078B6B75B84365E408D11C0814D0B3E400000000000000000D5A8E52C84365E40AA16888D4D0B3E4000000000000000002764543184365E40C300D9624E0B3E400000000000000000189F3EE183365E400F0F03774E0B3E400000000000000000E38252E083365E40E837BB4A4E0B3E4000000000000000004B9B7F0583365E406A8EDE814E0B3E4000000000000000001694110783365E407BB056CD4E0B3E400000000000000000AFA8E00A83365E407CA868844F0B3E40000000000000000095ABCEF182365E4046C3B38A4F0B3E400000000000000000CF64CE1C83365E4061471CA0570B3E4000000000000000007717456184365E40E4FEFD45570B3E4000000000000000005F58C26384365E40DBC4B0B0570B3E400000000000000000FF88AF9884365E40C484C1A1570B3E400000000000000000	1	3	3	04	3
23	01030000A0E6100000010000000C000000EF51F65986365E408D9C429C570B3E400000000000000000ACC3B91E86365E40F7B8E5C54D0B3E40000000000000000070716B2485365E40D009E2044E0B3E40000000000000000006D1AA2085365E408D3131504D0B3E40000000000000000078B6B75B84365E408D11C0814D0B3E4000000000000000005CEF756784365E403B43FF744F0B3E400000000000000000FF88AF9884365E40C484C1A1570B3E4000000000000000009D3E26E384365E40937ABE8C570B3E400000000000000000A653D8DB84365E401568E854560B3E40000000000000000098E735F784365E40A0192D4D560B3E4000000000000000006A4C540185365E4065EC9EFE570B3E400000000000000000EF51F65986365E408D9C429C570B3E400000000000000000	1	3	3	03	3
24	01030000A0E6100000010000000B00000084B258CE68365E4044CC5C6E5A0B3E400000000000000000720B81CA68365E409DED25B1590B3E400000000000000000E617889B69365E40F50BD47D590B3E4000000000000000005C70CF9469365E40DCE39132580B3E4000000000000000007C7D89EE69365E40B62F911C580B3E4000000000000000005503AEC969365E40FE01B79A500B3E400000000000000000C091739B68365E40F484D6E1500B3E4000000000000000002E33F89568365E40879C75D34F0B3E4000000000000000006EE5EFBF67365E40A6100608500B3E4000000000000000002339EEF667365E40730110A05A0B3E40000000000000000084B258CE68365E4044CC5C6E5A0B3E400000000000000000	1	8	9	01	8
25	01030000A0E6100000010000000F0000002339EEF667365E40730110A05A0B3E4000000000000000006EE5EFBF67365E40A6100608500B3E40000000000000000062F0A69167365E40AE0A6413500B3E400000000000000000644F899667365E40F5BE0D04510B3E400000000000000000E50DEDC366365E409B93C237510B3E4000000000000000006E608EC366365E403C54C225510B3E400000000000000000AC9306C266365E40B5A847DA500B3E4000000000000000004AA794D465365E40203A7311510B3E40000000000000000035C745CE65365E40A8C1FF12510B3E4000000000000000000BEBA4F765365E409FA04C0B590B3E400000000000000000EC94E38F66365E40D214EBE5580B3E400000000000000000C68A909466365E408B646DCC590B3E400000000000000000FCF1941567365E40FD29BBAC590B3E4000000000000000002BE98B1B67365E40BA7EADD25A0B3E4000000000000000002339EEF667365E40730110A05A0B3E400000000000000000	1	8	9	02	8
47	01030000A0E61000000100000009000000190051B670365E409DCD1B90A90B3E4000000000000000001AB528D670365E4066713BBAA90B3E4000000000000000006704A46171365E40986FEFB8A40B3E400000000000000000BC43D12470365E4046EE5113A30B3E4000000000000000004C68B1426F365E4094248630AB0B3E400000000000000000DC7619C56F365E409A5B1DDCAB0B3E400000000000000000671565D66F365E409ADAE53CAB0B3E40000000000000000006F5D17170365E40D79F9E06AC0B3E400000000000000000190051B670365E409DCD1B90A90B3E400000000000000000	1	11	12	05	11
26	01030000A0E6100000010000000B00000001857AE064365E407F8CE0585B0B3E4000000000000000007EFD8BDA64365E40A8946B345A0B3E4000000000000000002458E65C65365E40994C6E145A0B3E40000000000000000049AC9C5865365E4082C25832590B3E4000000000000000000BEBA4F765365E409FA04C0B590B3E40000000000000000035C745CE65365E40A8C1FF12510B3E400000000000000000882503D864365E40ECB0774F510B3E400000000000000000E1AAF9D964365E40A3B417B0510B3E4000000000000000005871A5DB63365E40A2648CEE510B3E40000000000000000098DA700D64365E4058CC45865B0B3E40000000000000000001857AE064365E407F8CE0585B0B3E400000000000000000	1	8	9	03	8
27	01030000A0E6100000010000000E00000098DA700D64365E4058CC45865B0B3E4000000000000000005871A5DB63365E40A2648CEE510B3E400000000000000000045E0ADB62365E40CD16902D520B3E400000000000000000B111D0D862365E40EE9B5DBF510B3E400000000000000000BDB95BD861365E40D5AB5FFE510B3E4000000000000000008EB8E3D961365E40584BDA49520B3E4000000000000000003967E9E061365E405D45ECA3530B3E4000000000000000005E1DB4B361365E400D2905AF530B3E4000000000000000006C2815D061365E40DB31B9FE590B3E400000000000000000374C09A062365E40707FA1CB590B3E4000000000000000005C663AA662365E409920F2FC5A0B3E4000000000000000004A509D2863365E407098E9DC5A0B3E400000000000000000FEA1072D63365E4049628BB65B0B3E40000000000000000098DA700D64365E4058CC45865B0B3E400000000000000000	1	8	9	04	8
28	01030000A0E61000000100000009000000E18D5F8D5D365E4027CF9683700B3E40000000000000000050922B5F5D365E4090FA3739700B3E400000000000000000CDEB414E5D365E4037AD79BD700B3E4000000000000000000A02CD265C365E40E548EDC46E0B3E40000000000000000050CD8BF85A365E40CAC46C24770B3E40000000000000000064AAB12B5C365E40D2188A1B790B3E400000000000000000186380205C365E40D5C48776790B3E4000000000000000007D98C1555C365E40D56072CE790B3E400000000000000000E18D5F8D5D365E4027CF9683700B3E400000000000000000	1	9	10	04	9
29	01030000A0E61000000100000009000000FB9CE8235F365E408D0AF711730B3E400000000000000000E18D5F8D5D365E4027CF9683700B3E4000000000000000007D98C1555C365E40D56072CE790B3E400000000000000000322E86975C365E40E252053B7A0B3E400000000000000000B2BEDCC55C365E40001DFBC4780B3E400000000000000000A0D693EB5C365E4014003D03790B3E400000000000000000B25074B55C365E40A12766907A0B3E40000000000000000004E5A1E65D365E40747607887C0B3E400000000000000000FB9CE8235F365E408D0AF711730B3E400000000000000000	1	9	10	03	9
30	01030000A0E6100000010000001400000087335D2D82365E409F3A79CB7B0B3E400000000000000000BF62992682365E40A587569F7A0B3E400000000000000000111C5A9C82365E40F6643B7F7A0B3E40000000000000000019FD5D9082365E40F919E66A780B3E400000000000000000625F79F782365E40DBF2C74E780B3E4000000000000000009C726BFA82365E40EB6995D1780B3E4000000000000000001B0AD0EE83365E40A7DCEC8E780B3E400000000000000000F331E2E783365E4007F04A5B770B3E400000000000000000F890BC2D84365E4076023B48770B3E40000000000000000006FFA91884365E4049A0CFA0730B3E400000000000000000640078F183365E406C657BAB730B3E400000000000000000CDFE35E583365E4016C5838B710B3E400000000000000000C735DD3B83365E408546BBB9710B3E40000000000000000034A7CF3883365E40A27B4732710B3E40000000000000000097641C3783365E40B509D8E6700B3E4000000000000000002D0EBACB81365E40CB242647710B3E400000000000000000939118C781365E4008ED716F700B3E400000000000000000A8AFFFEB80365E40FFC85FAE700B3E40000000000000000061156C2E81365E40AC3402117C0B3E40000000000000000087335D2D82365E409F3A79CB7B0B3E400000000000000000	1	2	2	01	2
31	01030000A0E6100000010000001400000061156C2E81365E40AC3402117C0B3E400000000000000000A8AFFFEB80365E40FFC85FAE700B3E40000000000000000082CCE61080365E40408E4DED700B3E400000000000000000FCD6331680365E402E6157BB710B3E400000000000000000B4C472A97E365E406C4D462B720B3E40000000000000000062B55BAB7E365E40E022A676720B3E40000000000000000000AF97AE7E365E40AA3B3406730B3E400000000000000000C68614017E365E4011778635730B3E4000000000000000005D4D650D7E365E40AE337858750B3E4000000000000000003300AFE67D365E40DA5D0963750B3E400000000000000000CDD0BFFB7D365E40A9117F0A790B3E40000000000000000026081E347E365E4086411DFB780B3E4000000000000000001D669E3A7E365E402848091C7A0B3E40000000000000000039E9CDCF7E365E40A77D5CF3790B3E400000000000000000D85874D47E365E402C3CE0B57A0B3E400000000000000000D243EFA77F365E40634DAD757A0B3E4000000000000000007EBBBBAC7F365E40BCD5974A7B0B3E4000000000000000000A14022380365E40799B522A7B0B3E4000000000000000009571CD2980365E40B38017587C0B3E40000000000000000061156C2E81365E40AC3402117C0B3E400000000000000000	1	2	2	02	2
32	01030000A0E610000001000000090000008FC071BA60365E408BF556A0750B3E400000000000000000FB9CE8235F365E408D0AF711730B3E40000000000000000004E5A1E65D365E40747607887C0B3E400000000000000000902D680D5F365E4089567D6E7E0B3E400000000000000000C4AFF7475F365E4012ED7EAC7C0B3E400000000000000000E08DC45A5F365E40228CD5C97C0B3E40000000000000000019DA6F2B5F365E40D6642F397E0B3E40000000000000000046045C875F365E4029BE9BC87E0B3E4000000000000000008FC071BA60365E408BF556A0750B3E400000000000000000	1	9	10	02	9
33	01030000A0E6100000010000000B00000066F5042361365E40749AE8637F0B3E4000000000000000005605417661365E40AA779EE97F0B3E40000000000000000060B8A86F62365E40A6597791780B3E400000000000000000D4E008D260365E40B814F8F8750B3E400000000000000000331F95D760365E40BDD03DCF750B3E4000000000000000008FC071BA60365E408BF556A0750B3E40000000000000000046045C875F365E4029BE9BC87E0B3E400000000000000000E5590AC15F365E4008169B227F0B3E40000000000000000079A792CB5F365E4026C0DFD07E0B3E400000000000000000429EB4F660365E4082C2AFA2800B3E40000000000000000066F5042361365E40749AE8637F0B3E400000000000000000	1	9	10	01	9
34	01030000A0E61000000100000009000000340A71D661365E40268E2C3D900B3E40000000000000000098BFD76560365E406491E3598E0B3E4000000000000000003E3E2D5E60365E402366B2A08E0B3E4000000000000000006E9E4FD95F365E407E764775930B3E4000000000000000001FE3852260365E4055B9CAD0930B3E4000000000000000006764F0DF5F365E408CD7C039960B3E4000000000000000003C778B0161365E40F6002DA4970B3E4000000000000000000E71F20761365E405B1230AC970B3E400000000000000000340A71D661365E40268E2C3D900B3E400000000000000000	1	10	11	08	10
35	01030000A0E6100000010000001800000049FE68437D365E40A2B4BA429A0B3E4000000000000000001CF4C0407D365E40803C4FD1990B3E400000000000000000C36963977E365E4083176D70990B3E400000000000000000F5421C8B7E365E40242BE70C970B3E4000000000000000004ABA98817E365E40C04F540F970B3E400000000000000000A23DEB6E7E365E40A10A08DA930B3E40000000000000000077AF4EC67E365E4060D058C1930B3E40000000000000000008FDC7C27E365E40DF3B5B2A930B3E400000000000000000818ACEC57E365E401C3F7E29930B3E4000000000000000000C0844BB7E365E405BBD1665910B3E4000000000000000008EEF69697E365E4085083B7C910B3E400000000000000000230AFD617E365E4003C5053E900B3E40000000000000000065473A607E365E4057AE9AF28F0B3E400000000000000000A45832D07C365E40BE8BB563900B3E400000000000000000371AF5D17C365E40D5A220AF900B3E40000000000000000046043FD37C365E4024D36EE6900B3E400000000000000000100D97997C365E409180BCF6900B3E400000000000000000E61F07967C365E40AB21365E900B3E4000000000000000008E5444947C365E40550DCB12900B3E4000000000000000009A3EF45F7C365E404ED69521900B3E400000000000000000A31A81957C365E408D3F0817990B3E40000000000000000056E38A9E7C365E403E858A14990B3E400000000000000000AD2ED2A47C365E4031C8836F9A0B3E40000000000000000049FE68437D365E40A2B4BA429A0B3E400000000000000000	1	1	1	01	1
36	01030000A0E610000001000000080000008D7770FB62365E4094A855BD910B3E400000000000000000340A71D661365E40268E2C3D900B3E4000000000000000000E71F20761365E405B1230AC970B3E40000000000000000068D249C460365E40EE4FB71B9A0B3E40000000000000000021886D9861365E40689CE62E9B0B3E40000000000000000043E3A4A261365E40A289D6D09A0B3E4000000000000000006FD8BDF361365E40B57A863B9B0B3E4000000000000000008D7770FB62365E4094A855BD910B3E400000000000000000	1	10	11	07	10
37	01030000A0E6100000010000000F000000EB11B0A97A365E4076ABF8FE9A0B3E4000000000000000000A6CF19F7A365E40C331D3A3990B3E4000000000000000002F6E5BC17A365E40C71DED99990B3E4000000000000000006085D78B7A365E401AFDF2A5900B3E400000000000000000C1204C5E7A365E40CCC9D3B2900B3E40000000000000000070EA0E607A365E40BFDE3EFE900B3E4000000000000000002AB17D637A365E40942A1D91910B3E4000000000000000006F8DF9287A365E40FEE0A8A1910B3E400000000000000000EC88CA247A365E406BA5D11C910B3E400000000000000000A411B69478365E40536C2D8D910B3E400000000000000000BAD0759678365E40CA5C99D8910B3E4000000000000000005F6A92CD78365E4053C20B119B0B3E4000000000000000003D8BE3227A365E40EE0889B09A0B3E400000000000000000C84B71257A365E4043B203239B0B3E400000000000000000EB11B0A97A365E4076ABF8FE9A0B3E400000000000000000	1	1	1	03	1
38	01030000A0E6100000010000000A0000000C3BE2B664365E40908596C1990B3E400000000000000000449319D264365E4064A199E5990B3E400000000000000000540CDA5D65365E40BFC4AADD940B3E4000000000000000007FED6F2064365E4071997E3D930B3E400000000000000000A2EB3F3F63365E406232C9589B0B3E40000000000000000069762D4C63365E40ECDCDE699B0B3E400000000000000000BD30F6C563365E401CE4CF0A9C0B3E400000000000000000B6A529D763365E40114ABB6D9B0B3E400000000000000000788A5B7264365E40B7F95C389C0B3E4000000000000000000C3BE2B664365E40908596C1990B3E400000000000000000	1	10	11	05	10
39	01030000A0E61000000100000008000000A2EB3F3F63365E406232C9589B0B3E4000000000000000007FED6F2064365E4071997E3D930B3E4000000000000000008D7770FB62365E4094A855BD910B3E4000000000000000006FD8BDF361365E40B57A863B9B0B3E4000000000000000007FF1CD4962365E40D2A4BEAC9B0B3E400000000000000000D60FA23F62365E405DDD670A9C0B3E4000000000000000006789AA0D63365E406728BD219D0B3E400000000000000000A2EB3F3F63365E406232C9589B0B3E400000000000000000	1	10	11	06	10
40	01030000A0E6100000010000000900000055FF2BA17C365E401782307A9C0B3E400000000000000000460D8D8E7C365E403EDEF218990B3E400000000000000000A31A81957C365E408D3F0817990B3E4000000000000000009A3EF45F7C365E404ED69521900B3E4000000000000000006085D78B7A365E401AFDF2A5900B3E4000000000000000002F6E5BC17A365E40C71DED99990B3E4000000000000000004A9C4CCA7A365E4079F54697990B3E400000000000000000891C0FDF7A365E40BE1332F29C0B3E40000000000000000055FF2BA17C365E401782307A9C0B3E400000000000000000	1	1	1	02	1
41	01030000A0E6100000010000000A0000004235449B66365E4051BFD67D960B3E400000000000000000540CDA5D65365E40BFC4AADD940B3E400000000000000000449319D264365E4064A199E5990B3E400000000000000000B6A548ED64365E4093CA91099A0B3E4000000000000000006AE926A964365E40AE07B37C9C0B3E4000000000000000007E762D4A65365E40E76AB1549D0B3E40000000000000000000DF993965365E40D04C6BF09D0B3E4000000000000000005802B9B265365E40083B3E909E0B3E4000000000000000009D7600BA65365E40381ED9999E0B3E4000000000000000004235449B66365E4051BFD67D960B3E400000000000000000	1	10	11	04	10
42	01030000A0E610000001000000080000007AC643C067365E40842CFFFD970B3E4000000000000000004235449B66365E4051BFD67D960B3E4000000000000000009D7600BA65365E40381ED9999E0B3E40000000000000000098DF128865365E401763FA65A00B3E4000000000000000008274A65966365E400D9E2F79A10B3E40000000000000000016C85B6566365E40C718D412A10B3E400000000000000000767D7BB866365E4049DEFB7CA10B3E4000000000000000007AC643C067365E40842CFFFD970B3E400000000000000000	1	10	11	03	10
43	01030000A0E61000000100000009000000AF0D638269365E402937132CA00B3E4000000000000000008426A2E769365E4067C7D1B2A00B3E400000000000000000E7EA956F6A365E40477404D49B0B3E400000000000000000FD6540776A365E40C296358D9B0B3E4000000000000000004C6043E568365E402470277E990B3E400000000000000000016EF81368365E4092A2F906A10B3E4000000000000000006B32C11E68365E40AA0D2A15A10B3E4000000000000000002918143F69365E40D7008590A20B3E400000000000000000AF0D638269365E402937132CA00B3E400000000000000000	1	10	11	01	10
44	01030000A0E61000000100000008000000016EF81368365E4092A2F906A10B3E4000000000000000004C6043E568365E402470277E990B3E4000000000000000007AC643C067365E40842CFFFD970B3E400000000000000000767D7BB866365E4049DEFB7CA10B3E4000000000000000004A1AC40F67365E40809573ECA10B3E4000000000000000009073000567365E403FEC395AA20B3E400000000000000000520CFDD167365E409AAA0E67A30B3E400000000000000000016EF81368365E4092A2F906A10B3E400000000000000000	1	10	11	02	10
45	01030000A0E6100000010000000800000080D3E9DB6D365E407A93F308A00B3E40000000000000000056E76A6A6C365E40E0103D1D9E0B3E400000000000000000B2BCA6626C365E40A100EA639E0B3E400000000000000000969C87DA6B365E40B43C6044A30B3E400000000000000000C1FEE9216C365E4093E2AE9EA30B3E4000000000000000006A91E7E06B365E402CEB17F5A50B3E40000000000000000018EE060C6D365E4017AB9C7EA70B3E40000000000000000080D3E9DB6D365E407A93F308A00B3E400000000000000000	1	11	12	08	11
46	01030000A0E6100000010000000800000043875D006F365E4092D5228EA10B3E40000000000000000080D3E9DB6D365E407A93F308A00B3E40000000000000000018EE060C6D365E4017AB9C7EA70B3E4000000000000000004F5BA8C76C365E405B78A8F2A90B3E4000000000000000009CA6CB946D365E40135A1600AB0B3E40000000000000000018BC61A06D365E40190C269DAA0B3E400000000000000000BC6F72F76D365E40DC4FB30FAB0B3E40000000000000000043875D006F365E4092D5228EA10B3E400000000000000000	1	11	12	07	11
48	01030000A0E610000001000000080000004C68B1426F365E4094248630AB0B3E400000000000000000BC43D12470365E4046EE5113A30B3E40000000000000000043875D006F365E4092D5228EA10B3E400000000000000000BC6F72F76D365E40DC4FB30FAB0B3E40000000000000000084758F4B6E365E40C44F5E7EAB0B3E4000000000000000009ED8BF406E365E40A97A30E5AB0B3E400000000000000000629980116F365E4016E164F4AC0B3E4000000000000000004C68B1426F365E4094248630AB0B3E400000000000000000	1	11	12	06	11
49	01030000A0E610000001000000090000004BCF769E72365E404CC08C5EA60B3E4000000000000000006704A46171365E40986FEFB8A40B3E4000000000000000001AB528D670365E4066713BBAA90B3E400000000000000000B5C5B5EC70365E40157310D8A90B3E4000000000000000004DFF16A870365E40C275B34FAC0B3E400000000000000000C1B0024971365E40E9797023AD0B3E400000000000000000C8A2C93771365E40177BFFC1AD0B3E400000000000000000EDA16CBD71365E402B06CC71AE0B3E4000000000000000004BCF769E72365E404CC08C5EA60B3E400000000000000000	1	11	12	04	11
50	01030000A0E6100000010000000800000057A7EAC273365E40C555BBE3A70B3E4000000000000000004BCF769E72365E404CC08C5EA60B3E400000000000000000EDA16CBD71365E402B06CC71AE0B3E40000000000000000034C7C58B71365E40BD8DE739B00B3E400000000000000000413F095A72365E40B5A8094AB10B3E4000000000000000001B4A1A6572365E405C79BCE7B00B3E400000000000000000752251BB72365E40CF053359B10B3E40000000000000000057A7EAC273365E40C555BBE3A70B3E400000000000000000	1	11	12	03	11
52	01030000A0E61000000100000008000000672D9E1974365E40831BFBCAB00B3E4000000000000000001A885EE774365E40D3C1E968A90B3E40000000000000000057A7EAC273365E40C555BBE3A70B3E400000000000000000752251BB72365E40CF053359B10B3E4000000000000000008B774B0F73365E40D617B8C7B10B3E400000000000000000C16B940473365E402F75552AB20B3E400000000000000000E4C630D573365E40C4B8903FB30B3E400000000000000000672D9E1974365E40831BFBCAB00B3E400000000000000000	1	11	12	02	11
53	01030000A0E6100000010000000C000000D82FEF7175365E40CA1D63080B0B3E4000000000000000003F3A90AC75365E40B92CEF14120B3E400000000000000000DFA12B6E76365E40DFAFEF0F120B3E4000000000000000002592966E76365E40E2596CD3120B3E400000000000000000CBC0B9C776365E40274A74D2120B3E400000000000000000C079B3C276365E4051A426A3090B3E400000000000000000A0A9315E76365E40DF84C0A5090B3E400000000000000000FDB6175E76365E407B705A78090B3E400000000000000000418EDADF75365E408CC49E7B090B3E40000000000000000025E1F3DF75365E40967888B4090B3E400000000000000000B94F407775365E4016B736A3090B3E400000000000000000D82FEF7175365E40CA1D63080B0B3E400000000000000000	1	6	7	04	6
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, url, layer, style, format, tilematrixsetid, description, level, visiblelevel, type, ellipsoid, img, maxlevel, per, sort, created_at, updated_at) FROM stdin;
55	open street map	https://a.tile.openstreetmap.org/	\N	\N	\N	\N	open street map	2	18	OSM	wgs84	\N	18	0	4	2018-03-29 15:02:56	2018-09-12 14:29:58
58	天地图全球影像	http://t0.tianditu.com/img_w/wmts?	img	default	tiles	w	天地图全球影像	1	18	TDT	wgs84	\N	18	0	1	2018-03-29 15:05:23	2018-09-12 14:30:01
72	Esri World Map	https://server.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer	\N	\N	\N	\N	Esri World Map	\N	\N	\N	\N	fa-pencil	\N	0	5	2018-04-17 11:45:19	2018-10-23 14:16:56
56	天地图全球电子地图	http://t0.tianditu.com/vec_w/wmts?	vec	default	tiles	w	天地图全球电子地图	1	18	TDT	wgs84	\N	13	0	8	2018-03-29 15:03:57	2018-10-26 12:54:12
57	离线地图	http://indoor.popsmart.cn:6500/web/Resources/imagery/TLtdt/tiles	\N	\N	\N	\N	离线地图	\N	\N	SingleTile	\N	\N	13	1	9	2018-03-29 15:04:25	2018-10-29 17:52:24
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
185	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542345137	1542345137
186	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542345141	1542345141
187	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542346159	1542346159
188	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542346163	1542346163
189	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542346588	1542346588
190	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542346595	1542346595
191	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542347367	1542347367
192	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542347373	1542347373
193	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542348289	1542348289
194	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542348304	1542348304
195	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542348378	1542348378
196	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542348385	1542348385
197	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542351512	1542351512
198	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542351516	1542351516
199	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542589650	1542589650
200	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542589785	1542589785
201	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542590666	1542590666
202	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542590686	1542590686
203	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542593483	1542593483
204	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"72.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542593488	1542593488
205	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542599316	1542599316
206	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542599332	1542599332
207	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542677418	1542677418
208	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542677428	1542677428
209	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542678959	1542678959
210	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"69.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542678972	1542678972
211	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542699304	1542699304
212	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.234\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:27:\\"Windows NT 10.0; Win64; x64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542699309	1542699309
213	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542706888	1542706888
214	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.236\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542706895	1542706895
215	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542706913	1542706913
216	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.3.254\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1542706915	1542706915
217	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.1.131\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1543308054	1543308054
218	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.1.131\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1543308054	1543308054
219	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.1.131\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:0;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1543368471	1543368471
220	default	{"displayName":"App\\\\Jobs\\\\UserLoginInfo","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\UserLoginInfo","command":"O:22:\\"App\\\\Jobs\\\\UserLoginInfo\\":12:{s:26:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000ip\\";s:13:\\"192.168.1.131\\";s:35:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserName\\";s:6:\\"Chrome\\";s:38:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000browserVersion\\";s:4:\\"70.0\\";s:32:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000platform\\";s:22:\\"Windows NT 10.0; WOW64\\";s:31:\\"\\u0000App\\\\Jobs\\\\UserLoginInfo\\u0000user_id\\";i:1;s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}	0	\N	1543368484	1543368484
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 220, true);


--
-- Data for Name: measures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measures (id, title, _id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: measures_bts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measures_bts (id, measures_id, name, img, icon, created_at, updated_at) FROM stdin;
\.


--
-- Name: measures_bts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measures_bts_id_seq', 1, false);


--
-- Name: measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measures_id_seq', 1, false);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_01_04_173148_create_admin_tables	1
4	2018_03_15_090617_create_roles_table	1
5	2018_03_15_090734_create_permissions_table	1
6	2018_03_15_091400_create_permission_user_table	1
7	2018_03_15_091556_create_permission_role_table	1
8	2018_03_25_192533_create_images_table	1
9	2018_03_25_204001_create_terrains_table	1
10	2018_03_25_204424_create_tilesets_table	1
11	2018_03_25_220937_create_pois_table	1
12	2018_03_26_094232_crate_poi_types_table	1
13	2018_03_26_095322_crate_measures_table	1
14	2018_03_26_095336_crate_toolbars_table	1
15	2018_03_26_095842_create_measures_bts_table	1
16	2018_03_26_095856_create_toolbar_bts_table	1
17	2018_03_26_165617_create_user_login_table	1
18	2018_03_27_171743_create_role_user_table	1
19	2018_03_28_201631_create_cache_table	1
20	2018_03_29_145940_create_user_pois_table	1
21	2018_03_29_171720_crate_angles_table	1
22	2018_03_29_214736_create_user_files_table	1
23	2018_04_02_163418_create_sessions_table	1
24	2018_04_09_094533_create_comments_table	1
25	2018_04_19_100211_create_tileset_groups_table	1
26	2018_04_25_063217_create_business_table	1
27	2018_05_04_095118_create_monomers_table	1
28	2018_08_22_175324_create_jobs_table	1
29	2018_08_22_175346_create_failed_jobs_table	1
30	2018_08_24_140000_create_build_types_table	1
31	2018_08_24_145559_create_builds_table	1
32	2018_09_06_132927_create_tileset_build_table	1
33	2018_09_06_170026_create_event_types_table	1
34	2018_09_06_170028_create_events_table	1
35	2018_09_18_105056_create_pattern_dirs_table	1
36	2018_09_18_105058_create_patterns_table	1
37	2018_09_18_105060_create_schemes_table	1
38	2018_10_25_090040_create_real_estates_table	1
39	2018_10_25_093738_create_real_estate_maps_table	1
42	2018_10_25_112118_create_shui_shang_m_ds_table	2
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 42, true);


--
-- Data for Name: monomers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monomers (id, table_name, tileset_id, operator, created_at, updated_at) FROM stdin;
\.


--
-- Name: monomers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monomers_id_seq', 1, false);


--
-- Data for Name: new_household_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_household_maps (id, geom, "Id", estate_id, build_id, build_no, room_no) FROM stdin;
1	01030000A0E6100000010000000E0000006B3DC2967A365E40D88220B0120B3E4000000000000000005B9356967A365E400E5067ED110B3E400000000000000000A8E944617B365E405D4D2AE8110B3E4000000000000000002A4AF15F7B365E4009890BC60E0B3E400000000000000000151D99A27B365E40EC9046C40E0B3E40000000000000000067CDD0A07B365E408AE26E820B0B3E400000000000000000596260827B365E40409F38830B0B3E400000000000000000EF833E817B365E407DBF8571090B3E400000000000000000F6E398807B365E404308DD42080B3E4000000000000000003BD63E8F7A365E40C58A1C49080B3E400000000000000000D93D3A8F7A365E408F0E9041080B3E400000000000000000E24625397A365E401ECDCB43080B3E4000000000000000004015DB3E7A365E402E3BF6B2120B3E4000000000000000006B3DC2967A365E40D88220B0120B3E400000000000000000	0	1	6	7	01
2	01030000A0E6100000010000000C0000002FE80DC276365E4094EB7D74080B3E40000000000000000041198C5D76365E4009CC1777080B3E400000000000000000A026725D76365E40A5B7B149080B3E40000000000000000063FF34DF75365E408F0BF64C080B3E400000000000000000736C49DF75365E40AA604D72080B3E400000000000000000AD69617B75365E40673BE374080B3E400000000000000000D82FEF7175365E40CD1D63080B0B3E4000000000000000003F3A90AC75365E40B92CEF14120B3E400000000000000000DFA12B6E76365E40DFAFEF0F120B3E4000000000000000002592966E76365E40E2596CD3120B3E400000000000000000CBC0B9C776365E40254A74D2120B3E4000000000000000002FE80DC276365E4094EB7D74080B3E400000000000000000	0	1	6	7	04
3	01030000A0E61000000100000010000000CF0501E279365E4009DA0D25130B3E4000000000000000004E7F0EE179365E404BE9D169110B3E400000000000000000151674E979365E4029DB9669110B3E400000000000000000FBCD29EA79365E40AA6EB1B5120B3E4000000000000000004015DB3E7A365E402E3BF6B2120B3E400000000000000000E24625397A365E401ECDCB43080B3E4000000000000000001A72F6E979365E4022B6D945080B3E400000000000000000D19D60E979365E404FFBDC2D070B3E4000000000000000007B170A5C79365E4091938531070B3E400000000000000000443646E278365E408070AC34070B3E400000000000000000AA5467E278365E4050953471070B3E400000000000000000E43393D078365E4068B8AA71070B3E400000000000000000602207D178365E40CBF88E45080B3E400000000000000000CE15747D78365E40F3BFB847080B3E4000000000000000004585BF8378365E40D43E002F130B3E400000000000000000CF0501E279365E4009DA0D25130B3E400000000000000000	0	1	6	7	02
4	01030000A0E610000001000000100000004585BF8378365E40D43E002F130B3E400000000000000000CE15747D78365E40F3BFB847080B3E4000000000000000004F526A1D78365E403819354A080B3E4000000000000000007067F61C78365E4070B85476070B3E400000000000000000A27B900B78365E40A4FFC776070B3E4000000000000000000EAD6F0B78365E40E8F83B3A070B3E4000000000000000002CE1AA9177365E40BD3B613D070B3E4000000000000000009728580477365E4064181241070B3E4000000000000000007565FE0477365E40B66CC272080B3E4000000000000000002FE80DC276365E4094EB7D74080B3E400000000000000000CBC0B9C776365E40254A74D2120B3E400000000000000000245B240C77365E40FFE1B5D1120B3E40000000000000000085554C0B77365E401D46D546110B3E400000000000000000E6BD012477365E403990E945110B3E40000000000000000065DD132577365E40F26CF538130B3E4000000000000000004585BF8378365E40D43E002F130B3E400000000000000000	0	1	6	7	03
5	01030000A0E6100000010000000B000000E511E0EA74365E408847E15E130B3E400000000000000000BB6E3CE074365E40E57BBE82120B3E400000000000000000B036A2AC75365E4094269316120B3E4000000000000000003F3A90AC75365E40B92CEF14120B3E400000000000000000D82FEF7175365E40CD1D63080B0B3E400000000000000000E4673B4575365E40CA342843080B3E4000000000000000008419495C74365E40DA97C3EB080B3E40000000000000000015FD476074365E40EEFFE90A090B3E400000000000000000FCB7830374365E40F4325347090B3E400000000000000000D54D768F74365E40C60F6697130B3E400000000000000000E511E0EA74365E408847E15E130B3E400000000000000000	0	1	6	7	05
6	01030000A0E61000000100000013000000F58FB33D74365E4071827839140B3E400000000000000000D2FD182374365E40FDFCB34D120B3E40000000000000000096E35D4474365E4056082837120B3E40000000000000000052519F4474365E4021B1293C120B3E40000000000000000011A2A33B74365E40DFE7B741120B3E400000000000000000FC7D184F74365E40F3E831BF130B3E400000000000000000D54D768F74365E40C60F6697130B3E400000000000000000FCB7830374365E40F4325347090B3E400000000000000000DEA54B0374365E4090B67747090B3E400000000000000000BB7055BF73365E405AA7B973090B3E4000000000000000007D1C3EAC73365E40A8FB8B56080B3E400000000000000000FA72782E73365E4020B973A9080B3E400000000000000000B9FB472E73365E409C9A31A6080B3E400000000000000000C6FB3A2D73365E4019E6EEA6080B3E4000000000000000004EA36FA972365E40FF38AD03090B3E4000000000000000009B2CA0B972365E408F84770E0A0B3E4000000000000000009EB9B84E72365E404C290E540A0B3E400000000000000000911C1FE172365E40693ADD1D150B3E400000000000000000F58FB33D74365E4071827839140B3E400000000000000000	0	1	6	7	06
7	01030000A0E610000001000000120000005C841B2771365E40E7371DC8150B3E400000000000000000D758439A70365E4051A018670B0B3E4000000000000000009E26099A70365E40548B3E670B0B3E4000000000000000000F46FA4070365E409F4B45A10B0B3E4000000000000000005C23864070365E40B381A0940B0B3E4000000000000000002FCB17546F365E40BDAEFF2C0C0B3E400000000000000000AEFCED636F365E40032C9B560D0B3E4000000000000000001D89E3676F365E404A0B02A10D0B3E40000000000000000094D4BF836F365E407C5D56AE0F0B3E400000000000000000F179AC666F365E4029CE0DC10F0B3E40000000000000000069C3A58C6F365E401132F98C120B3E400000000000000000AF1B28D36F365E403036AB5F120B3E4000000000000000008ADB05E46F365E4095058399130B3E4000000000000000001CF9F0DB6F365E404A70199F130B3E400000000000000000DCD925F96F365E4082F579C4150B3E400000000000000000E490F0C670365E40E908043D150B3E40000000000000000069138FD170365E40DF9A6A00160B3E4000000000000000005C841B2771365E40E7371DC8150B3E400000000000000000	0	1	6	7	08
8	01030000A0E6100000010000000E000000911C1FE172365E40693ADD1D150B3E4000000000000000009EB9B84E72365E404C290E540A0B3E4000000000000000009347824E72365E402F9A31540A0B3E400000000000000000B14FB2E871365E40B2BB77960A0B3E40000000000000000090C16DDA71365E400DF5DC87090B3E400000000000000000B7382DD870365E40569CC52C0A0B3E400000000000000000C49274E670365E4085DC73350B0B3E400000000000000000D758439A70365E4051A018670B0B3E4000000000000000005C841B2771365E40E7371DC8150B3E400000000000000000DF46777171365E40BC282D97150B3E40000000000000000058F0D85F71365E4073616153140B3E400000000000000000B943A07671365E4084308D44140B3E40000000000000000069ED308E71365E40752BEFFB150B3E400000000000000000911C1FE172365E40693ADD1D150B3E400000000000000000	0	1	6	7	07
9	01030000A0E6100000010000000F000000D4D5A73680365E40EDA478640F0B3E400000000000000000DBAC223F80365E4062DACB1E0F0B3E40000000000000000083E80D6180365E40C68018080E0B3E4000000000000000001E9B84297F365E408332E83C0C0B3E400000000000000000995C99077F365E4066879B530D0B3E400000000000000000DA8C1EFF7E365E40865C48990D0B3E4000000000000000002068EEC37E365E40951C9C7F0F0B3E400000000000000000530E7DA87E365E40B6631F570F0B3E40000000000000000046DFF4487E365E40059B4155120B3E4000000000000000008E06908B7E365E4080CA5AB7120B3E400000000000000000132B9F327E365E4013962992150B3E40000000000000000096B094F57E365E40596CC4AF160B3E400000000000000000FB2A2FDF7E365E40C047096B170B3E4000000000000000002C76BE2E7F365E401684E8DC170B3E400000000000000000D4D5A73680365E40EDA478640F0B3E400000000000000000	0	1	5	6	04
10	01030000A0E6100000010000001200000090E632CD81365E407D93FDCD110B3E40000000000000000061C6ADD581365E4083775088110B3E40000000000000000019AD1FF781365E4054BFEB70100B3E400000000000000000F823298E81365E402E43C0D80F0B3E40000000000000000016A9A4AE81365E40D2E166DC0E0B3E4000000000000000002C7A1D3281365E40BD96CE240E0B3E40000000000000000059ABF9BB80365E40254AB0760D0B3E40000000000000000045F2239F80365E40E5799B630E0B3E40000000000000000083E80D6180365E40C68018080E0B3E400000000000000000DBAC223F80365E4062DACB1E0F0B3E400000000000000000D4D5A73680365E40EDA478640F0B3E4000000000000000002C76BE2E7F365E401684E8DC170B3E4000000000000000002C16D6707F365E40CD2B813B180B3E40000000000000000009FA6F957F365E4043C8AA0E170B3E400000000000000000E97A54AC7F365E4037F06830170B3E40000000000000000061710E7D7F365E40647DE6C0180B3E400000000000000000545DEFBB80365E40304646931A0B3E40000000000000000090E632CD81365E407D93FDCD110B3E400000000000000000	0	1	5	6	03
11	01030000A0E61000000100000011000000EF480C6A83365E4082A5B203140B3E4000000000000000000A23877283365E40FCAE05BE130B3E400000000000000000211EC99483365E40CAF1D2A7120B3E400000000000000000A711FE4A83365E40ED9AC539120B3E4000000000000000007CFFBF6483365E40E8451F62110B3E400000000000000000871B9AEE82365E40420DF6B3100B3E4000000000000000003FE4757282365E40D2A109FD0F0B3E4000000000000000007A8AD86182365E40D1478EE40F0B3E40000000000000000072A6534382365E40855C65DF100B3E40000000000000000019AD1FF781365E4054BFEB70100B3E40000000000000000061C6ADD581365E4083775088110B3E40000000000000000090E632CD81365E407D93FDCD110B3E400000000000000000545DEFBB80365E40304646931A0B3E400000000000000000C4F60A0C82365E407F97D87E1C0B3E40000000000000000079D8F21782365E405958DC1C1C0B3E400000000000000000795FAE6082365E401AC319881C0B3E400000000000000000EF480C6A83365E4082A5B203140B3E400000000000000000	0	1	5	6	02
12	01030000A0E61000000100000011000000E0DA78CE83365E408C9107501B0B3E400000000000000000B13160CA83365E401D1FFF491B0B3E400000000000000000B43F43E283365E404ED4BD851A0B3E400000000000000000606BDE1E84365E409A0F00DC1A0B3E4000000000000000005261827C84365E405E582FDD170B3E4000000000000000001B231F6184365E408F0D12B5170B3E400000000000000000C8D8459C84365E40B17563CC150B3E400000000000000000F956D6A484365E404DC5D686150B3E400000000000000000474F18C784365E406803A470140B3E400000000000000000211EC99483365E40CAF1D2A7120B3E4000000000000000000A23877283365E40FCAE05BE130B3E400000000000000000EF480C6A83365E4082A5B203140B3E400000000000000000795FAE6082365E401AC319881C0B3E40000000000000000019781FB682365E407C5C14061D0B3E4000000000000000008AA0EECB82365E40AFA968511C0B3E40000000000000000080E61B8D83365E4002EAD56B1D0B3E400000000000000000E0DA78CE83365E408C9107501B0B3E400000000000000000	0	1	5	6	01
13	01030000A0E6100000010000001100000047E90D278F365E40BE45329E2D0B3E400000000000000000557839228F365E401A58EBCF2C0B3E400000000000000000A69F92F38F365E404651A9942C0B3E400000000000000000C6EAE9E58F365E40FCBCEE4C2A0B3E400000000000000000EFBBD4DC8F365E40BE557F4F2A0B3E400000000000000000F7C5E4D78F365E409C28337C290B3E400000000000000000267CBB2390365E4091C3E666290B3E400000000000000000F3D0591090365E4076CE2D29260B3E4000000000000000008686BBF38F365E404B764731260B3E40000000000000000069D62DE78F365E401813C619240B3E400000000000000000248869E58F365E40D86C5BCE230B3E400000000000000000448B58DE8F365E4081C2B0A0220B3E40000000000000000072B1D9EE8E365E400E9E95E4220B3E40000000000000000037A8DAEF8E365E407550C40E230B3E4000000000000000001DECF2918E365E4057225529230B3E4000285C8FC2A54640A8F3E9D08E365E40F2C0ADB12D0B3E4000285C8FC2A5464047E90D278F365E40BE45329E2D0B3E400000000000000000	0	1	4	5	01
14	01030000A0E6100000010000000E000000E38918728E365E401308A0302E0B3E4000000000000000008317AA6F8E365E40FC6BACC72D0B3E400000000000000000A8F3E9D08E365E40F2C0ADB12D0B3E4000285C8FC2A546401DECF2918E365E4057225529230B3E4000285C8FC2A546404AF0EC478E365E40570E463E230B3E4000000000000000003790D8408E365E406C9D8B14220B3E400000000000000000D57C00C18D365E4031CDD038220B3E400000000000000000470BA73A8D365E40837DEC5E220B3E400000000000000000E28000418D365E40027D0F6E230B3E4000000000000000008016D0D68C365E4092F0178C230B3E4000285C8FC2A54640B86CF1D58C365E4021EA568C230B3E40ABBADDB8B20154400E7A9EDF8C365E40B0362F05250B3E4000285C8FC2A55640FECB561E8D365E40471EE68F2E0B3E4000285C8FC2A54640E38918728E365E401308A0302E0B3E400000000000000000	0	1	4	5	02
15	01030000A0E61000000100000010000000BDA9B85C8B365E40EFC7F3AB2E0B3E4000285C8FC2A54640E5C3521D8B365E4008D66F11240B3E4000285C8FC2A54640E9C76EBF8A365E40DD2C132C240B3E400000000000000000C69066BE8A365E4067B45400240B3E400000000000000000A41D8BD089365E40E112D743240B3E4000000000000000009EC7DAD889365E40855212BD250B3E40000000000000000083867DE489365E4009B732CD270B3E400000000000000000211788C789365E40D43E63D5270B3E4000000000000000008E8CF8DA89365E402EBDFB122B0B3E4000000000000000002C7C26258A365E40DB4F0CFE2A0B3E40000000000000000038269E2B8A365E40850595022C0B3E400000000000000000D9CFDC1E8A365E404769FD072C0B3E40000000000000000059F4632C8A365E402217F14A2E0B3E400000000000000000CA2E66FC8A365E40CE25C60B2E0B3E400000000000000000703730018B365E403296B2CA2E0B3E400000000000000000BDA9B85C8B365E40EFC7F3AB2E0B3E4000285C8FC2A54640	0	1	4	5	04
16	01030000A0E6100000010000000F000000FECB561E8D365E40471EE68F2E0B3E4000285C8FC2A546400E7A9EDF8C365E40B0362F05250B3E4000285C8FC2A55640B86CF1D58C365E4021EA568C230B3E40ABBADDB8B2015440D3AB9F6C8C365E40C65E20AA230B3E4000000000000000000F52ED648C365E40474E6063220B3E400000000000000000B8488EEB8B365E404340D085220B3E40000000000000000065AE215F8B365E4009D0AEAD220B3E40000000000000000020D3FB668B365E4045D189FC230B3E400000000000000000E5C3521D8B365E4008D66F11240B3E4000285C8FC2A54640BDA9B85C8B365E40EFC7F3AB2E0B3E4000285C8FC2A54640792FC29E8B365E400B51C5952E0B3E4000000000000000009234A0978B365E40B81A1B4F2D0B3E40000000000000000007D63CAF8B365E4010C678482D0B3E400000000000000000A6012DB98B365E4090860DF42E0B3E400000000000000000FECB561E8D365E40471EE68F2E0B3E4000285C8FC2A54640	0	1	4	5	03
17	01030000A0E6100000010000000B0000005FC8731770365E40EDCD492D360B3E4000000000000000009C2D411570365E40A7D66E73350B3E40000000000000000018CC249870365E40029CAB60350B3E400000000000000000A2D0129370365E409C8880B5330B3E40000000000000000086946F4371365E406D62B087330B3E4000000000000000000492CA1C71365E40BA26CB772C0B3E400000000000000000B699231B71365E406871582C2C0B3E400000000000000000A4B8871471365E401D9C8DFE2A0B3E400000000000000000CDFD1E0B6F365E405240D6882B0B3E400000000000000000E2B0C03E6F365E4084B3F862360B3E4000000000000000005FC8731770365E40EDCD492D360B3E400000000000000000	0	1	7	8	01
18	01030000A0E61000000100000010000000E2B0C03E6F365E4084B3F862360B3E400000000000000000CDFD1E0B6F365E405240D6882B0B3E400000000000000000BD3E200A6F365E4002D019892B0B3E400000000000000000BDE9CDD76E365E40615472962B0B3E4000000000000000001B911CD96E365E40D85162BB2B0B3E4000000000000000003B4B52116E365E40905FE0EC2B0B3E400000000000000000160D310F6E365E4038E704852B0B3E4000000000000000005D096F146D365E4051482AC32B0B3E40000000000000000061D405146D365E40AA6D43C32B0B3E4000000000000000008A6E711B6D365E4094B3B63C2D0B3E4000000000000000007A959C416D365E403D8B4BD9340B3E4000000000000000001D0517DA6D365E403E1D85B3340B3E4000000000000000002FE7A3DE6D365E4098763092350B3E4000000000000000001F8823606E365E40007E1972350B3E400000000000000000463A2B666E365E409D2BA098360B3E400000000000000000E2B0C03E6F365E4084B3F862360B3E400000000000000000	0	1	7	8	02
19	01030000A0E6100000010000000E000000EACB972A6C365E402E41D226370B3E40000000000000000077579C246C365E40A5C34602360B3E4000000000000000009AD722A86C365E40178BB2E1350B3E400000000000000000925288A36C365E4018257500350B3E4000000000000000007A959C416D365E403D8B4BD9340B3E4000000000000000008A6E711B6D365E4094B3B63C2D0B3E40000000000000000061D405146D365E40AA6D43C32B0B3E4000000000000000006BBAD4126D365E402A1089C32B0B3E40000000000000000009C961126D365E403C82A4C32B0B3E4000000000000000008F822B176C365E40D10FE6012C0B3E400000000000000000F7B742196C365E40299BCF672C0B3E400000000000000000CF7658256B365E401EB53BA42C0B3E400000000000000000A2C9B9446B365E40748CC65F370B3E400000000000000000EACB972A6C365E402E41D226370B3E400000000000000000	0	1	7	8	03
20	01030000A0E6100000010000000F000000A2C9B9446B365E40748CC65F370B3E400000000000000000CF7658256B365E401EB53BA42C0B3E400000000000000000344BA0226B365E403D29E8A42C0B3E400000000000000000ED5307196A365E40F725B3E62C0B3E40000000000000000037E9BA166A365E402ACD64762C0B3E4000000000000000005FE7BF1969365E40F5560AB52C0B3E4000000000000000006A3B071D69365E403CBF5C552D0B3E40000000000000000069EDD5ED68365E402FCC0D612D0B3E4000000000000000002DEF02F468365E40FF12F58E2E0B3E400000000000000000C1B9461A69365E407D33FFDD350B3E400000000000000000A65FCDEC69365E401CBED5A9350B3E4000000000000000001D94FBF269365E40D340C2D7360B3E40000000000000000041AC09746A365E4095D6C9B7360B3E4000000000000000006E9783786A365E405F735F92370B3E400000000000000000A2C9B9446B365E40748CC65F370B3E400000000000000000	0	1	7	8	04
21	01030000A0E6100000010000000E00000077C5EF4188365E40D6700DB1560B3E4000000000000000008700B53F88365E407C520446560B3E400000000000000000185BC48489365E40FB2832F4550B3E40000000000000000026FDE36189365E40FDB01D664F0B3E40000000000000000074D4C94489365E40F21C706D4F0B3E400000000000000000579C2E3989365E404290C53E4D0B3E400000000000000000D7379D3789365E4033494DF34C0B3E400000000000000000F7A5573189365E40F02C6CC54B0B3E4000000000000000007A078F0788365E40B7E458104C0B3E4000000000000000006829170488365E40657F3E694B0B3E400000000000000000858C06D387365E40CBE197754B0B3E400000000000000000901234D287365E4058DBCC754B0B3E4000000000000000005645181688365E4066BF14BC560B3E40000000000000000077C5EF4188365E40D6700DB1560B3E400000000000000000	0	1	3	3	01
22	01030000A0E6100000010000000A00000079DB76A087365E402FCE123F570B3E4000000000000000007E47169E87365E406AF144DA560B3E4000000000000000005645181688365E4066BF14BC560B3E400000000000000000901234D287365E4058DBCC754B0B3E400000000000000000DFADE40F87365E40D5BDB4A64B0B3E4000000000000000001ADE961387365E40D8BDD2584C0B3E4000000000000000008806741886365E40E4A604984C0B3E400000000000000000DC38A11786365E4094B239984C0B3E400000000000000000EF51F65986365E408E9C429C570B3E40000000000000000079DB76A087365E402FCE123F570B3E400000000000000000	0	1	3	3	02
23	01030000A0E61000000100000010000000FF88AF9884365E40C484C1A1570B3E4000000000000000005CEF756784365E403D43FF744F0B3E400000000000000000FF309F5484365E40F20814544C0B3E400000000000000000EDF89F2684365E40C800A75F4C0B3E400000000000000000EFB10D2B84365E40EA2BF8344D0B3E400000000000000000D2EDF7DA83365E40E83922494D0B3E4000000000000000003E9D0ADA83365E406CB0DA1C4D0B3E40000000000000000039B837FF82365E401406FE534D0B3E4000000000000000004B9B7F0583365E406C8EDE814E0B3E4000000000000000001694110783365E407CB056CD4E0B3E400000000000000000AFA8E00A83365E407CA868844F0B3E40000000000000000095ABCEF182365E4048C3B38A4F0B3E400000000000000000CF64CE1C83365E4063471CA0570B3E4000000000000000007717456184365E40E4FEFD45570B3E4000000000000000005F58C26384365E40DBC4B0B0570B3E400000000000000000FF88AF9884365E40C484C1A1570B3E400000000000000000	0	1	3	3	04
24	01030000A0E6100000010000000D000000EF51F65986365E408E9C429C570B3E400000000000000000DC38A11786365E4094B239984C0B3E4000000000000000003DB7251E85365E40C4F600D74C0B3E400000000000000000421E651A85365E409E1C50224C0B3E4000000000000000000506725584365E40DAFBDE534C0B3E400000000000000000FF309F5484365E40F20814544C0B3E4000000000000000005CEF756784365E403D43FF744F0B3E400000000000000000FF88AF9884365E40C484C1A1570B3E4000000000000000009D3E26E384365E40957ABE8C570B3E400000000000000000A653D8DB84365E401768E854560B3E40000000000000000098E735F784365E40A2192D4D560B3E4000000000000000006A4C540185365E4066EC9EFE570B3E400000000000000000EF51F65986365E408E9C429C570B3E400000000000000000	0	1	3	3	03
25	01030000A0E6100000010000000C00000084B258CE68365E4045CC5C6E5A0B3E400000000000000000720B81CA68365E409FED25B1590B3E400000000000000000E617889B69365E40F70BD47D590B3E4000000000000000005C70CF9469365E40DCE39132580B3E4000000000000000007C7D89EE69365E40B62F911C580B3E4000000000000000005503AEC969365E400002B79A500B3E4000000000000000006DD4CFC369365E4088B2BC6C4F0B3E4000000000000000006766959568365E406334DCB34F0B3E40000000000000000035D6D88F68365E4016F98AA54E0B3E400000000000000000CB96D0B967365E4081691BDA4E0B3E4000000000000000002339EEF667365E40750110A05A0B3E40000000000000000084B258CE68365E4045CC5C6E5A0B3E400000000000000000	0	1	8	9	01
26	01030000A0E6100000010000000E0000002339EEF667365E40750110A05A0B3E400000000000000000CB96D0B967365E4081691BDA4E0B3E4000000000000000007696878B67365E40426679E54E0B3E40000000000000000030796A9067365E403CFA22D64F0B3E4000000000000000002B3ACEBD66365E4018CED709500B3E40000000000000000096543BBC66365E40EDEA48AC4F0B3E400000000000000000FF6AC9CE65365E407A7B74E34F0B3E400000000000000000199D26C865365E40191115E54F0B3E4000000000000000000BEBA4F765365E409FA04C0B590B3E400000000000000000EC94E38F66365E40D414EBE5580B3E400000000000000000C68A909466365E408D646DCC590B3E400000000000000000FCF1941567365E40FF29BBAC590B3E4000000000000000002BE98B1B67365E40BA7EADD25A0B3E4000000000000000002339EEF667365E40750110A05A0B3E400000000000000000	0	1	8	9	02
27	01030000A0E6100000010000000B00000001857AE064365E407F8CE0585B0B3E4000000000000000007EFD8BDA64365E40A9946B345A0B3E4000000000000000002458E65C65365E409B4C6E145A0B3E40000000000000000049AC9C5865365E4085C25832590B3E4000000000000000000BEBA4F765365E409FA04C0B590B3E400000000000000000199D26C865365E40191115E54F0B3E4000000000000000003211E4D164365E40CEFA8C21500B3E400000000000000000C26CDAD364365E40C9082D82500B3E400000000000000000343886D563365E405BB7A1C0500B3E40000000000000000098DA700D64365E4058CC45865B0B3E40000000000000000001857AE064365E407F8CE0585B0B3E400000000000000000	0	1	8	9	03
28	01030000A0E6100000010000000F00000098DA700D64365E4058CC45865B0B3E400000000000000000343886D563365E405BB7A1C0500B3E400000000000000000E725EBD462365E400769A5FF500B3E4000000000000000008313B0D262365E40C91E7391500B3E40000000000000000092BE3BD261365E40BA2D75D0500B3E400000000000000000BDB95BD861365E40D7AB5FFE510B3E4000000000000000008EB8E3D961365E40584BDA49520B3E4000000000000000003967E9E061365E405F45ECA3530B3E4000000000000000005E1DB4B361365E400F2905AF530B3E4000000000000000006C2815D061365E40DC31B9FE590B3E400000000000000000374C09A062365E40707FA1CB590B3E4000000000000000005C663AA662365E409D20F2FC5A0B3E4000000000000000004A509D2863365E407098E9DC5A0B3E400000000000000000FEA1072D63365E4049628BB65B0B3E40000000000000000098DA700D64365E4058CC45865B0B3E400000000000000000	0	1	8	9	04
29	01030000A0E6100000010000000A000000472573B15D365E4051F92E706F0B3E400000000000000000E78CAE835D365E401A7083266F0B3E400000000000000000C45492745D365E40F15EC2AD6F0B3E400000000000000000D5751D4D5C365E40040E36B56D0B3E4000000000000000000C02CD265C365E40E748EDC46E0B3E40000000000000000050CD8BF85A365E40CCC46C24770B3E40000000000000000064AAB12B5C365E40D4188A1B790B3E400000000000000000186380205C365E40D7C48776790B3E4000000000000000007F98C1555C365E40D56072CE790B3E400000000000000000472573B15D365E4051F92E706F0B3E400000000000000000	0	1	9	10	04
30	01030000A0E6100000010000000A000000D330FC475F365E401E2E8FFE710B3E4000000000000000000F88E2B15D365E40ED43E2706F0B3E400000000000000000472573B15D365E4051F92E706F0B3E4000000000000000007F98C1555C365E40D56072CE790B3E400000000000000000322E86975C365E40E252053B7A0B3E400000000000000000B2BEDCC55C365E40021DFBC4780B3E400000000000000000A0D693EB5C365E4018003D03790B3E400000000000000000B25074B55C365E40A32766907A0B3E40000000000000000004E5A1E65D365E40767607887C0B3E400000000000000000D330FC475F365E401E2E8FFE710B3E400000000000000000	0	1	9	10	03
31	01030000A0E6100000010000001400000087335D2D82365E40A03A79CB7B0B3E400000000000000000BF62992682365E40A787569F7A0B3E400000000000000000111C5A9C82365E40F8643B7F7A0B3E4000000000000000001AFD5D9082365E40FB19E66A780B3E400000000000000000625F79F782365E40DDF2C74E780B3E4000000000000000009C726BFA82365E40ED6995D1780B3E4000000000000000001B0AD0EE83365E40A9DCEC8E780B3E400000000000000000F331E2E783365E4009F04A5B770B3E400000000000000000F890BC2D84365E4076023B48770B3E40000000000000000006FFA91884365E404BA0CFA0730B3E400000000000000000640078F183365E406D657BAB730B3E400000000000000000CDFE35E583365E4017C5838B710B3E400000000000000000524269DE83365E40681BC65D700B3E4000000000000000004B7B103583365E40239CFD8B700B3E400000000000000000ECAD813083365E407EEB0CB96F0B3E4000000000000000009C3F3FC581365E408C915219700B3E4000000000000000003A2CF1BF81365E40D6A6CD416F0B3E4000000000000000004A671FE580365E40CA15A7806F0B3E40000000000000000063156C2E81365E40AC3402117C0B3E40000000000000000087335D2D82365E40A03A79CB7B0B3E400000000000000000	0	1	2	2	01
32	01030000A0E6100000010000001400000063156C2E81365E40AC3402117C0B3E4000000000000000004A671FE580365E40CA15A7806F0B3E400000000000000000E04CD8E480365E40DC81BB806F0B3E4000000000000000004B6CBF0980365E403046A9BF6F0B3E4000000000000000001D10900E80365E40FE0CD88D700B3E4000000000000000001A02CFA17E365E409DF7C6FD700B3E4000000000000000008021CCA77E365E40243E76D8710B3E400000000000000000BA1449FA7D365E40E971C807720B3E4000000000000000005D4D650D7E365E40AE337858750B3E4000000000000000003300AFE67D365E40DC5D0963750B3E400000000000000000CDD0BFFB7D365E40AB117F0A790B3E40000000000000000026081E347E365E4088411DFB780B3E4000000000000000001F669E3A7E365E402848091C7A0B3E4000000000000000003BE9CDCF7E365E40A77D5CF3790B3E400000000000000000D85874D47E365E402E3CE0B57A0B3E400000000000000000D243EFA77F365E40644DAD757A0B3E4000000000000000007EBBBBAC7F365E40BCD5974A7B0B3E4000000000000000000B14022380365E40799B522A7B0B3E4000000000000000009571CD2980365E40B58017587C0B3E40000000000000000063156C2E81365E40AC3402117C0B3E400000000000000000	0	1	2	2	02
33	01030000A0E6100000010000000A000000DA5085DE60365E408212EF8C740B3E400000000000000000A1936B485F365E40A77842FF710B3E400000000000000000D330FC475F365E401E2E8FFE710B3E40000000000000000004E5A1E65D365E40767607887C0B3E400000000000000000922D680D5F365E408B567D6E7E0B3E400000000000000000C4AFF7475F365E4014ED7EAC7C0B3E400000000000000000E08DC45A5F365E40248CD5C97C0B3E40000000000000000019DA6F2B5F365E40D8642F397E0B3E40000000000000000046045C875F365E4029BE9BC87E0B3E400000000000000000DA5085DE60365E408212EF8C740B3E400000000000000000	0	1	9	10	02
34	01030000A0E6100000010000000D00000066F5042361365E40769AE8637F0B3E4000000000000000005605417661365E40AB779EE97F0B3E40000000000000000060B8A86F62365E40A8597791780B3E400000000000000000F4C61C9462365E400ACDAA7E770B3E40000000000000000003F37CF660365E40E68E2BE6740B3E4000000000000000000E1218FC60365E40A93789BC740B3E400000000000000000ACB3F4DE60365E40F65CA28D740B3E400000000000000000DA5085DE60365E408212EF8C740B3E40000000000000000046045C875F365E4029BE9BC87E0B3E400000000000000000E5590AC15F365E4008169B227F0B3E40000000000000000079A792CB5F365E402AC0DFD07E0B3E400000000000000000429EB4F660365E4084C2AFA2800B3E40000000000000000066F5042361365E40769AE8637F0B3E400000000000000000	0	1	9	10	01
35	01030000A0E6100000010000000A000000340A71D661365E40288E2C3D900B3E4000000000000000008B5724F561365E404B66FD218F0B3E40000000000000000094C4818460365E40213EA83E8D0B3E4000000000000000003E3E2D5E60365E402366B2A08E0B3E4000000000000000006E9E4FD95F365E4080764775930B3E40000000000000000021E3852260365E4055B9CAD0930B3E4000000000000000006764F0DF5F365E408ED7C039960B3E4000000000000000003C778B0161365E40F8002DA4970B3E4000000000000000000E71F20761365E405D1230AC970B3E400000000000000000340A71D661365E40288E2C3D900B3E400000000000000000	0	1	10	11	08
36	01030000A0E6100000010000001700000049FE68437D365E40A4B4BA429A0B3E4000000000000000001CF4C0407D365E40803C4FD1990B3E400000000000000000C36963977E365E4083176D70990B3E400000000000000000F5421C8B7E365E40262BE70C970B3E4000000000000000004ABA98817E365E40C14F540F970B3E400000000000000000A23DEB6E7E365E40A30A08DA930B3E40000000000000000077AF4EC67E365E4062D058C1930B3E40000000000000000008FDC7C27E365E40E13B5B2A930B3E400000000000000000838ACEC57E365E401D3F7E29930B3E4000000000000000000C0844BB7E365E405CBD1665910B3E4000000000000000008EEF69697E365E4087083B7C910B3E400000000000000000230AFD617E365E4005C5053E900B3E40000000000000000065473A607E365E405BAE9AF28F0B3E400000000000000000873C2F597E365E409553EEC48E0B3E400000000000000000755227C97C365E404E2F09368F0B3E40000000000000000028CB33CC7C365E402485C2B88F0B3E4000000000000000009FD48B927C365E40543210C98F0B3E4000000000000000004F27398D7C365E40E4BB1EE58E0B3E4000000000000000004B0CE9587C365E403D86E9F38E0B3E400000000000000000A31A81957C365E408F3F0817990B3E40000000000000000056E38A9E7C365E4041858A14990B3E400000000000000000AD2ED2A47C365E4033C8836F9A0B3E40000000000000000049FE68437D365E40A4B4BA429A0B3E400000000000000000	0	1	1	1	01
37	01030000A0E6100000010000000A0000008D7770FB62365E4096A855BD910B3E400000000000000000F9C1231A63365E40A87C26A2900B3E4000000000000000008B5724F561365E404B66FD218F0B3E400000000000000000340A71D661365E40288E2C3D900B3E4000000000000000000E71F20761365E405D1230AC970B3E40000000000000000068D249C460365E40F04FB71B9A0B3E40000000000000000021886D9861365E406A9CE62E9B0B3E40000000000000000043E3A4A261365E40A489D6D09A0B3E4000000000000000006FD8BDF361365E40B77A863B9B0B3E4000000000000000008D7770FB62365E4096A855BD910B3E400000000000000000	0	1	10	11	07
38	01030000A0E6100000010000000F000000EB11B0A97A365E4078ABF8FE9A0B3E4000000000000000000A6CF19F7A365E40C531D3A3990B3E4000000000000000002F6E5BC17A365E40C91DED99990B3E4000000000000000008B58CC847A365E4014AB46788F0B3E40000000000000000023FA40577A365E40FD7527858F0B3E4000000000000000001F90725C7A365E4031D57063900B3E400000000000000000126DEE217A365E405E8BFC73900B3E4000000000000000000288CB1D7A365E403AE521EF8F0B3E4000000000000000006B15B78D78365E4072AA7D5F900B3E400000000000000000A411B69478365E40536C2D8D910B3E400000000000000000BAD0759678365E40CC5C99D8910B3E4000000000000000005F6A92CD78365E4055C20B119B0B3E4000000000000000003D8BE3227A365E40F00889B09A0B3E400000000000000000C84B71257A365E4045B203239B0B3E400000000000000000EB11B0A97A365E4078ABF8FE9A0B3E400000000000000000	0	1	1	1	03
39	01030000A0E6100000010000000B0000000C3BE2B664365E40908596C1990B3E400000000000000000449319D264365E4066A199E5990B3E400000000000000000F0508D7C65365E40AA907BC2930B3E4000000000000000007DA8213F64365E4085614D22920B3E4000000000000000007FED6F2064365E4071997E3D930B3E400000000000000000A2EB3F3F63365E406332C9589B0B3E40000000000000000069762D4C63365E40EEDCDE699B0B3E400000000000000000BD30F6C563365E401DE4CF0A9C0B3E400000000000000000B6A529D763365E40144ABB6D9B0B3E400000000000000000788A5B7264365E40B9F95C389C0B3E4000000000000000000C3BE2B664365E40908596C1990B3E400000000000000000	0	1	10	11	05
40	01030000A0E6100000010000000A000000A2EB3F3F63365E406332C9589B0B3E4000000000000000007FED6F2064365E4071997E3D930B3E4000000000000000007DA8213F64365E4085614D22920B3E400000000000000000F9C1231A63365E40A87C26A2900B3E4000000000000000008D7770FB62365E4096A855BD910B3E4000000000000000006FD8BDF361365E40B77A863B9B0B3E4000000000000000007FF1CD4962365E40D4A4BEAC9B0B3E400000000000000000D60FA23F62365E4060DD670A9C0B3E4000000000000000006789AA0D63365E406928BD219D0B3E400000000000000000A2EB3F3F63365E406332C9589B0B3E400000000000000000	0	1	10	11	06
41	01030000A0E6100000010000000900000055FF2BA17C365E401982307A9C0B3E400000000000000000460D8D8E7C365E4040DEF218990B3E400000000000000000A31A81957C365E408F3F0817990B3E4000000000000000004B0CE9587C365E403D86E9F38E0B3E4000000000000000008B58CC847A365E4014AB46788F0B3E4000000000000000002F6E5BC17A365E40C91DED99990B3E4000000000000000004A9C4CCA7A365E407BF54697990B3E400000000000000000891C0FDF7A365E40C01332F29C0B3E40000000000000000055FF2BA17C365E401982307A9C0B3E400000000000000000	0	1	1	1	02
42	01030000A0E6100000010000000A0000002B7FF8B966365E408CE1A862950B3E400000000000000000F0508D7C65365E40AA907BC2930B3E400000000000000000449319D264365E4066A199E5990B3E400000000000000000B6A548ED64365E4094CA91099A0B3E4000000000000000006AE926A964365E40AF07B37C9C0B3E4000000000000000007E762D4A65365E40E76AB1549D0B3E40000000000000000000DF993965365E40D04C6BF09D0B3E4000000000000000005802B9B265365E400A3B3E909E0B3E4000000000000000009D7600BA65365E403A1ED9999E0B3E4000000000000000002B7FF8B966365E408CE1A862950B3E400000000000000000	0	1	10	11	04
43	01030000A0E610000001000000080000008A0DF8DE67365E40C04AD1E2960B3E4000000000000000002B7FF8B966365E408CE1A862950B3E4000000000000000009D7600BA65365E403A1ED9999E0B3E40000000000000000098DF128865365E401763FA65A00B3E4000000000000000008274A65966365E400E9E2F79A10B3E40000000000000000016C85B6566365E40C718D412A10B3E400000000000000000767D7BB866365E4049DEFB7CA10B3E4000000000000000008A0DF8DE67365E40C04AD1E2960B3E400000000000000000	0	1	10	11	03
44	01030000A0E6100000010000000A000000AF0D638269365E402A37132CA00B3E4000000000000000008426A2E769365E4067C7D1B2A00B3E400000000000000000E7EA956F6A365E40497404D49B0B3E400000000000000000FD6540776A365E40C496358D9B0B3E400000000000000000E951EA956A365E407220FA719A0B3E40000000000000000082A4F70369365E40608AF962980B3E400000000000000000016EF81368365E4094A2F906A10B3E4000000000000000006B32C11E68365E40AC0D2A15A10B3E4000000000000000002918143F69365E40D9008590A20B3E400000000000000000AF0D638269365E402A37132CA00B3E400000000000000000	0	1	10	11	01
45	01030000A0E61000000100000008000000016EF81368365E4094A2F906A10B3E40000000000000000082A4F70369365E40608AF962980B3E4000000000000000008A0DF8DE67365E40C04AD1E2960B3E400000000000000000767D7BB866365E4049DEFB7CA10B3E4000000000000000004C1AC40F67365E40809573ECA10B3E4000000000000000009073000567365E4041EC395AA20B3E400000000000000000520CFDD167365E409CAA0E67A30B3E400000000000000000016EF81368365E4094A2F906A10B3E400000000000000000	0	1	10	11	02
46	01030000A0E6100000010000000900000046A0B9FA6D365E40FB81E9ED9E0B3E40000000000000000079917B896C365E40995189029D0B3E40000000000000000056E76A6A6C365E40E2103D1D9E0B3E400000000000000000B2BCA6626C365E40A300EA639E0B3E400000000000000000969C87DA6B365E40B53C6044A30B3E400000000000000000C1FEE9216C365E4093E2AE9EA30B3E4000000000000000006A91E7E06B365E402DEB17F5A50B3E40000000000000000018EE060C6D365E4019AB9C7EA70B3E40000000000000000046A0B9FA6D365E40FB81E9ED9E0B3E400000000000000000	0	1	11	12	08
47	01030000A0E6100000010000000900000032512D1F6F365E4016C01873A00B3E400000000000000000137AFAFA6D365E4016CF3FEE9E0B3E40000000000000000046A0B9FA6D365E40FB81E9ED9E0B3E40000000000000000018EE060C6D365E4019AB9C7EA70B3E4000000000000000004F5BA8C76C365E405C78A8F2A90B3E4000000000000000009CA6CB946D365E40175A1600AB0B3E40000000000000000018BC61A06D365E401C0C269DAA0B3E400000000000000000BC6F72F76D365E40DE4FB30FAB0B3E40000000000000000032512D1F6F365E4016C01873A00B3E400000000000000000	0	1	11	12	07
48	01030000A0E6100000010000000A000000190051B670365E409FCD1B90A90B3E4000000000000000001AB528D670365E4068713BBAA90B3E4000000000000000006FC8738071365E40C551E59DA30B3E400000000000000000A6E4E14370365E40D1219EF8A10B3E400000000000000000D50AA14370365E40CCD447F8A10B3E4000000000000000004C68B1426F365E4094248630AB0B3E400000000000000000DC7619C56F365E409A5B1DDCAB0B3E400000000000000000671565D66F365E409CDAE53CAB0B3E40000000000000000006F5D17170365E40D79F9E06AC0B3E400000000000000000190051B670365E409FCD1B90A90B3E400000000000000000	0	1	11	12	05
49	01030000A0E610000001000000090000004C68B1426F365E4094248630AB0B3E400000000000000000D50AA14370365E40CCD447F8A10B3E400000000000000000012B6E1F6F365E40280D6F73A00B3E40000000000000000032512D1F6F365E4016C01873A00B3E400000000000000000BC6F72F76D365E40DE4FB30FAB0B3E40000000000000000084758F4B6E365E40C44F5E7EAB0B3E4000000000000000009ED8BF406E365E40AB7A30E5AB0B3E400000000000000000629980116F365E4018E164F4AC0B3E4000000000000000004C68B1426F365E4094248630AB0B3E400000000000000000	0	1	11	12	06
50	01030000A0E6100000010000000A000000429046BD72365E40239E8243A50B3E40000000000000000042A2B48071365E40C49E3B9EA30B3E4000000000000000006FC8738071365E40C551E59DA30B3E4000000000000000001AB528D670365E4068713BBAA90B3E400000000000000000B7C5B5EC70365E40157310D8A90B3E4000000000000000004DFF16A870365E40C475B34FAC0B3E400000000000000000C1B0024971365E40EA797023AD0B3E400000000000000000C8A2C93771365E40197BFFC1AD0B3E400000000000000000EDA16CBD71365E402B06CC71AE0B3E400000000000000000429046BD72365E40239E8243A50B3E400000000000000000	0	1	11	12	04
51	01030000A0E610000001000000090000007965BAE173365E409D2FB1C8A60B3E400000000000000000176A87BD72365E4018EBD843A50B3E400000000000000000429046BD72365E40239E8243A50B3E400000000000000000EDA16CBD71365E402B06CC71AE0B3E40000000000000000034C7C58B71365E40C08DE739B00B3E400000000000000000413F095A72365E40B7A8094AB10B3E4000000000000000001B4A1A6572365E405D79BCE7B00B3E400000000000000000772251BB72365E40D1053359B10B3E4000000000000000007965BAE173365E409D2FB1C8A60B3E400000000000000000	0	1	11	12	03
52	01030000A0E610000001000000080000007ABCD28475365E407055950DB00B3E40000000000000000064B97CCB75365E407DF1916AB00B3E400000000000000000067FB17776365E40A7E49939AA0B3E400000000000000000401D6F0675365E408CE4354EA80B3E40000000000000000066432E0675365E40A797DF4DA80B3E400000000000000000682D9E1974365E40851BFBCAB00B3E400000000000000000003F9E4575365E40FACA5C53B20B3E4000000000000000007ABCD28475365E407055950DB00B3E400000000000000000	0	1	11	12	01
53	01030000A0E61000000100000009000000682D9E1974365E40851BFBCAB00B3E40000000000000000066432E0675365E40A797DF4DA80B3E400000000000000000513FFBE173365E40887C07C9A60B3E4000000000000000007965BAE173365E409D2FB1C8A60B3E400000000000000000772251BB72365E40D1053359B10B3E4000000000000000008B774B0F73365E40D817B8C7B10B3E400000000000000000C16B940473365E403075552AB20B3E400000000000000000E4C630D573365E40C5B8903FB30B3E400000000000000000682D9E1974365E40851BFBCAB00B3E400000000000000000	0	1	11	12	02
\.


--
-- Name: new_household_maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_household_maps_id_seq', 53, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: pattern_dirs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pattern_dirs (id, name, user_id, created_at, updated_at) FROM stdin;
2	home	1	2018-10-27 14:22:27	2018-10-27 14:22:27
\.


--
-- Name: pattern_dirs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pattern_dirs_id_seq', 2, true);


--
-- Data for Name: patterns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patterns (id, name, size, path, orgin_type, user_id, created_at, updated_at, status) FROM stdin;
9	model.gltf	5.07 MB	images/users/huyouheng/partten/2/model.gltf	gltf	1	2018-10-27 14:22:35	2018-10-27 14:22:35	0
10	A1.gltf	5.09 MB	images/users/huyouheng/partten//A1.gltf	gltf	1	2018-10-27 15:09:37	2018-10-27 15:09:37	0
11	A1.gltf	5.09 MB	images/users/huyouheng/partten//A1.gltf	gltf	1	2018-10-27 15:09:39	2018-10-27 15:09:39	0
12	A1.gltf	5.09 MB	images/users/huyouheng/partten//A1.gltf	gltf	1	2018-10-27 15:10:14	2018-10-27 15:10:14	0
13	model.gltf	5.07 MB	images/users/huyouheng//model.gltf	gltf	1	2018-10-27 15:33:58	2018-10-27 15:33:58	0
14	A1.gltf	5.09 MB	images/users/huyouheng//A1.gltf	gltf	1	2018-10-27 15:34:53	2018-10-27 15:34:53	0
15	A1.gltf	5.09 MB	images/users/huyouheng//A1.gltf	gltf	1	2018-10-27 15:41:49	2018-10-27 15:41:49	0
16	A1.gltf	5.09 MB	images/users/huyouheng//A1.gltf	gltf	1	2018-10-27 15:45:43	2018-10-27 15:45:43	0
17	A1.gltf	5.09 MB	images/users/huyouheng//A1.gltf	gltf	1	2018-10-27 15:45:44	2018-10-27 15:45:44	0
18	1540628947.gltf	3.68 MB	images/users/huyouheng/1540628947.gltf	obj	1	2018-10-27 16:29:07	2018-10-27 16:29:07	0
19	1540628955.gltf	3.68 MB	images/users/huyouheng/1540628955.gltf	obj	1	2018-10-27 16:29:15	2018-10-27 16:29:15	0
20	1540628961.gltf	3.68 MB	images/users/huyouheng/1540628961.gltf	obj	1	2018-10-27 16:29:21	2018-10-27 16:29:21	0
21	1540628989.gltf	3.68 MB	images/users/huyouheng/1540628989.gltf	obj	1	2018-10-27 16:29:49	2018-10-27 16:29:49	0
22	1540629120.gltf	3.68 MB	images/users/huyouheng/1540629120.gltf	obj	1	2018-10-27 16:32:00	2018-10-27 16:32:00	0
23	1540629294.gltf	3.68 MB	images/users/huyouheng/1540629294.gltf	obj	1	2018-10-27 16:34:54	2018-10-27 16:34:54	0
24	1540629413.gltf	3.68 MB	images/users/huyouheng/1540629413.gltf	obj	1	2018-10-27 16:36:53	2018-10-27 16:36:53	0
25	1540629431.gltf	3.68 MB	images/users/huyouheng/1540629431.gltf	obj	1	2018-10-27 16:37:11	2018-10-27 16:37:11	0
26	1540629452.gltf	3.68 MB	images/users/huyouheng/1540629452.gltf	obj	1	2018-10-27 16:37:32	2018-10-27 16:37:32	0
27	1540629496.gltf	3.68 MB	images/users/huyouheng/1540629496.gltf	obj	1	2018-10-27 16:38:16	2018-10-27 16:38:16	0
28	1540629509.gltf	3.68 MB	images/users/huyouheng/1540629509.gltf	obj	1	2018-10-27 16:38:29	2018-10-27 16:38:29	0
29	1540629543.gltf	3.68 MB	images/users/huyouheng/1540629543.gltf	obj	1	2018-10-27 16:39:03	2018-10-27 16:39:03	0
30	1540629608.gltf	3.68 MB	images/users/huyouheng/1540629608.gltf	obj	1	2018-10-27 16:40:08	2018-10-27 16:40:08	0
31	1540629638.gltf	3.68 MB	images/users/huyouheng/1540629638.gltf	obj	1	2018-10-27 16:40:38	2018-10-27 16:40:38	0
32	1540629664.gltf	3.68 MB	images/users/huyouheng/1540629664.gltf	obj	1	2018-10-27 16:41:04	2018-10-27 16:41:04	0
33	1540630068.gltf	3.68 MB	images/users/huyouheng/1540630068.gltf	obj	1	2018-10-27 16:47:48	2018-10-27 16:47:48	0
34	1540630244.gltf	3.68 MB	images/users/huyouheng/1540630244.gltf	obj	1	2018-10-27 16:50:44	2018-10-27 16:50:44	0
35	1540630519.gltf	3.68 MB	images/users/huyouheng/1540630519.gltf	obj	1	2018-10-27 16:55:19	2018-10-27 16:55:19	0
36	1540630583.gltf	3.68 MB	images/users/huyouheng/1540630583.gltf	obj	1	2018-10-27 16:56:23	2018-10-27 16:56:23	0
37	1540630640.gltf	3.68 MB	images/users/huyouheng/1540630640.gltf	obj	1	2018-10-27 16:57:20	2018-10-27 16:57:20	0
38	1540630773.gltf	3.68 MB	images/users/huyouheng/1540630773.gltf	obj	1	2018-10-27 16:59:33	2018-10-27 16:59:33	0
39	1540630846.gltf	3.68 MB	images/users/huyouheng/1540630846.gltf	obj	1	2018-10-27 17:00:46	2018-10-27 17:00:46	0
40	1540630893.gltf	3.68 MB	images/users/huyouheng/1540630893.gltf	obj	1	2018-10-27 17:01:33	2018-10-27 17:01:33	0
41	1540630931.gltf	3.68 MB	images/users/huyouheng/1540630931.gltf	obj	1	2018-10-27 17:02:11	2018-10-27 17:02:11	0
42	1540630998.gltf	3.68 MB	images/users/huyouheng/1540630998.gltf	obj	1	2018-10-27 17:03:18	2018-10-27 17:03:18	0
43	1540631074.gltf	3.68 MB	images/users/huyouheng/1540631074.gltf	obj	1	2018-10-27 17:04:34	2018-10-27 17:04:34	0
44	1540631194.gltf	3.68 MB	images/users/huyouheng/1540631194.gltf	obj	1	2018-10-27 17:06:34	2018-10-27 17:06:34	0
45	1540631265.gltf	3.68 MB	images/users/huyouheng/1540631265.gltf	obj	1	2018-10-27 17:07:45	2018-10-27 17:07:45	0
46	1540631365.gltf	3.68 MB	images/users/huyouheng/1540631365.gltf	obj	1	2018-10-27 17:09:25	2018-10-27 17:09:25	0
47	1540631412.gltf	3.68 MB	images/users/huyouheng/1540631412.gltf	obj	1	2018-10-27 17:10:12	2018-10-27 17:10:12	0
48	1540631634.gltf	3.68 MB	images/users/huyouheng/1540631634.gltf	obj	1	2018-10-27 17:13:54	2018-10-27 17:13:54	0
49	1540631730.gltf	3.68 MB	images/users/huyouheng/1540631730.gltf	obj	1	2018-10-27 17:15:30	2018-10-27 17:15:30	0
50	1540631869.gltf	3.68 MB	images/users/huyouheng/1540631869.gltf	obj	1	2018-10-27 17:17:49	2018-10-27 17:17:49	0
51	1540631940.gltf	3.68 MB	images/users/huyouheng/1540631940.gltf	obj	1	2018-10-27 17:19:00	2018-10-27 17:19:00	0
52	1540632005.gltf	3.68 MB	images/users/huyouheng/1540632005.gltf	obj	1	2018-10-27 17:20:05	2018-10-27 17:20:05	0
53	1540632049.gltf	3.68 MB	images/users/huyouheng/1540632049.gltf	obj	1	2018-10-27 17:20:50	2018-10-27 17:20:50	0
54	1540632069.gltf	3.68 MB	images/users/huyouheng/1540632069.gltf	obj	1	2018-10-27 17:21:09	2018-10-27 17:21:09	0
55	1540632100.gltf	3.68 MB	images/users/huyouheng/1540632100.gltf	obj	1	2018-10-27 17:21:40	2018-10-27 17:21:40	0
56	1540632106.gltf	3.68 MB	images/users/huyouheng/1540632106.gltf	obj	1	2018-10-27 17:21:46	2018-10-27 17:21:46	0
57	1540632141.gltf	3.68 MB	images/users/huyouheng/1540632141.gltf	obj	1	2018-10-27 17:22:21	2018-10-27 17:22:21	0
58	1540632246.gltf	3.68 MB	images/users/huyouheng/1540632246.gltf	obj	1	2018-10-27 17:24:06	2018-10-27 17:24:06	0
59	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:30:36	2018-10-27 17:30:36	0
60	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:31:51	2018-10-27 17:31:51	0
61	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:32:37	2018-10-27 17:32:37	0
62	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:32:57	2018-10-27 17:32:57	0
63	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:33:41	2018-10-27 17:33:41	0
64	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:34:54	2018-10-27 17:34:54	0
65	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:35:06	2018-10-27 17:35:06	0
66	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:36:12	2018-10-27 17:36:12	0
67	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:38:41	2018-10-27 17:38:41	0
68	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:39:28	2018-10-27 17:39:28	0
69	model.gltf	5.07 MB	images/users/huyouheng/model.gltf	gltf	1	2018-10-27 17:39:41	2018-10-27 17:39:41	0
70	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:41:19	2018-10-27 17:41:19	0
71	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:41:28	2018-10-27 17:41:28	0
72	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:41:40	2018-10-27 17:41:40	0
73	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:41:44	2018-10-27 17:41:44	0
74	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:42:30	2018-10-27 17:42:30	0
75	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:42:35	2018-10-27 17:42:35	0
76	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-27 17:43:06	2018-10-27 17:43:06	0
77	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:22:09	2018-10-27 18:22:09	0
78	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:24:40	2018-10-27 18:24:40	0
79	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:25:17	2018-10-27 18:25:17	0
80	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:28:33	2018-10-27 18:28:33	0
81	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:32:33	2018-10-27 18:32:33	0
82	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:33:05	2018-10-27 18:33:05	0
83	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:34:39	2018-10-27 18:34:39	0
84	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:38:08	2018-10-27 18:38:08	0
85	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:40:28	2018-10-27 18:40:28	0
86	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:43:47	2018-10-27 18:43:47	0
87	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:44:20	2018-10-27 18:44:20	0
88	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:44:31	2018-10-27 18:44:31	0
89	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:44:38	2018-10-27 18:44:38	0
90	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:44:45	2018-10-27 18:44:45	0
91	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:44:53	2018-10-27 18:44:53	0
92	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:45:01	2018-10-27 18:45:01	0
93	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:45:08	2018-10-27 18:45:08	0
94	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:51:24	2018-10-27 18:51:24	0
95	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:55:18	2018-10-27 18:55:18	0
96	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:56:39	2018-10-27 18:56:39	0
97	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:57:59	2018-10-27 18:57:59	0
98	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 18:59:14	2018-10-27 18:59:14	0
99	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:01:50	2018-10-27 19:01:50	0
100	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:06:31	2018-10-27 19:06:31	0
101	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:40:27	2018-10-27 19:40:27	0
102	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:51:10	2018-10-27 19:51:10	0
103	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:52:03	2018-10-27 19:52:03	0
104	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:52:56	2018-10-27 19:52:56	0
105	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:55:42	2018-10-27 19:55:42	0
106	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 19:58:02	2018-10-27 19:58:02	0
107	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:14:41	2018-10-27 22:14:41	0
108	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:20:55	2018-10-27 22:20:55	0
109	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:32:12	2018-10-27 22:32:12	0
110	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:50:33	2018-10-27 22:50:33	0
111	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:54:36	2018-10-27 22:54:36	0
112	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:56:44	2018-10-27 22:56:44	0
113	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:57:31	2018-10-27 22:57:31	0
114	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 22:58:42	2018-10-27 22:58:42	0
115	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:01:06	2018-10-27 23:01:06	0
116	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:02:02	2018-10-27 23:02:02	0
117	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:04:40	2018-10-27 23:04:40	0
118	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:08:53	2018-10-27 23:08:53	0
119	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:09:14	2018-10-27 23:09:14	0
120	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:09:57	2018-10-27 23:09:57	0
121	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:11:36	2018-10-27 23:11:36	0
122	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:12:38	2018-10-27 23:12:38	0
123	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-27 23:16:02	2018-10-27 23:16:02	0
124	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 07:52:05	2018-10-28 07:52:05	0
125	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 07:52:27	2018-10-28 07:52:27	0
126	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 07:52:56	2018-10-28 07:52:56	0
127	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 07:53:26	2018-10-28 07:53:26	0
128	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 09:35:46	2018-10-28 09:35:46	0
129	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 09:44:24	2018-10-28 09:44:24	0
130	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 09:45:55	2018-10-28 09:45:55	0
131	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:20:25	2018-10-28 18:20:25	0
132	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:27:39	2018-10-28 18:27:39	0
133	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:29:23	2018-10-28 18:29:23	0
134	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 18:32:51	2018-10-28 18:32:51	0
135	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 18:33:20	2018-10-28 18:33:20	0
136	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:33:29	2018-10-28 18:33:29	0
137	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 18:33:30	2018-10-28 18:33:30	0
138	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-28 18:33:41	2018-10-28 18:33:41	0
139	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:33:41	2018-10-28 18:33:41	0
140	shu.gltf	4.35 MB	images/users/huyouheng/shu.gltf	gltf	1	2018-10-28 18:34:01	2018-10-28 18:34:01	0
141	1111.gltf	7.99 KB	images/users/huyouheng/1111.gltf	gltf	1	2018-10-28 19:42:19	2018-10-28 19:42:19	0
142	A4.gltf	6.57 MB	images/users/huyouheng/A4.gltf	gltf	1	2018-10-29 08:22:21	2018-10-29 08:22:21	0
143	A4.gltf	6.57 MB	images/users/huyouheng/A4.gltf	gltf	1	2018-10-29 08:23:23	2018-10-29 08:23:23	0
144	A1.gltf	5.09 MB	images/users/huyouheng/A1.gltf	gltf	1	2018-10-29 08:38:08	2018-10-29 08:38:08	0
145	xiaogaoceng1.gltf	2.45 MB	images/users/huyouheng/xiaogaoceng1.gltf	gltf	1	2018-10-29 10:11:40	2018-10-29 10:11:40	0
146	cc.gltf	1.23 MB	images/users/huyouheng/cc.gltf	gltf	1	2018-11-16 13:57:33	2018-11-16 13:57:33	0
147	cc.gltf	1.23 MB	images/users/huyouheng/cc.gltf	gltf	1	2018-11-16 13:58:00	2018-11-16 13:58:00	0
\.


--
-- Name: patterns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patterns_id_seq', 147, true);


--
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_user (permission_id, user_id) FROM stdin;
273	1
218	1
217	1
161	1
157	1
160	1
156	1
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, display_name, description, res_id, deleted_at, created_at, updated_at) FROM stdin;
156	images	Esri World Map	Esri World Map	72	\N	2018-09-12 14:26:03	2018-09-12 14:26:03
157	images	天地图全球电子地图	天地图全球电子地图	56	\N	2018-09-12 14:26:08	2018-09-12 14:26:08
160	images	open street map	open street map	55	\N	2018-09-12 14:29:58	2018-09-12 14:29:58
161	images	天地图全球影像	天地图全球影像	58	\N	2018-09-12 14:30:01	2018-09-12 14:30:01
216	tileset_groups	镇海组	镇海	12	\N	2018-09-12 16:32:01	2018-09-12 16:32:01
217	terrains	google全球地形	google全球地形	2	\N	2018-09-12 16:52:36	2018-09-12 16:52:36
218	terrains	STK全球地形	STK全球地形	1	\N	2018-09-12 16:52:37	2018-09-12 16:52:37
236	tileset_groups	绍兴组	绍兴	11	\N	2018-09-12 16:53:02	2018-09-12 16:53:02
237	tileset_groups	慈城组	慈城	10	\N	2018-09-12 16:53:02	2018-09-12 16:53:02
251	tileset_groups	丽水组	丽水	9	\N	2018-09-12 17:12:53	2018-09-12 17:12:53
273	tileset_groups	上虞组	上虞	13	\N	2018-10-17 17:37:18	2018-10-17 17:37:18
7	tilesets	1	1	7	\N	2018-11-14 15:55:02	2018-11-14 15:55:02
8	tilesets	2	2	8	\N	2018-11-14 15:55:47	2018-11-14 15:55:47
9	tilesets	3	3	9	\N	2018-11-14 15:56:00	2018-11-14 15:56:00
10	tilesets	4	4	10	\N	2018-11-14 15:56:18	2018-11-14 15:56:18
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 14, true);


--
-- Data for Name: poi_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poi_types (id, name, icon, created_at, updated_at) FROM stdin;
1	学校	images/poi29.svg	2018-03-28 10:29:59	2018-04-08 16:05:38
6	家	images/poi31.svg	2018-03-28 10:49:42	2018-04-08 16:06:16
5	医院	images/poi28.svg	2018-03-28 10:49:23	2018-04-08 16:06:59
3	小区	images/poi28.svg	2018-03-28 10:48:22	2018-04-08 16:07:39
4	公交车站	images/poi28.svg	2018-03-28 10:48:42	2018-04-08 16:07:59
7	工业	fa-camera-retro	2018-04-13 11:01:00	2018-04-13 11:01:17
\.


--
-- Name: poi_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poi_types_id_seq', 1, false);


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pois (id, name, lon, lat, alt, poi_type_id, "desc", link, media, is_public, is_comment, again_share, is_followed, comment_count, followed_count, share_count, view_count, created_at, updated_at) FROM stdin;
31	便民服务中心	120.85594691078042	30.036644258830464	29.314730005450013	1	上虞区便民服务中心	\N	{"type":"indoor","src":"http:\\/\\/192.168.3.150:8080\\/sybm\\/"}	1	1	1	1	\N	\N	\N	\N	2018-11-16 13:34:21	2018-11-16 13:34:21
\.


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pois_id_seq', 31, true);


--
-- Data for Name: real_estate_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_maps (id, real_estate_id, build_name, content, created_at, updated_at) FROM stdin;
\.


--
-- Name: real_estate_maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_maps_id_seq', 1, false);


--
-- Data for Name: real_estates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estates (id, name, street, guid, address, map, estate_company, building_num, parking_num, greening_rate, build_type, year_limit, average_price, property_company, build_time, business_time, comment, created_at, updated_at, area_rate) FROM stdin;
1	大通水尚名都	百官街道	\N	上虞区百官街道称山路与江华路交叉口	\N	上虞嘉业房地产开发有限公司	11	\N	32%	住宅	70	14206	文邦物业	2014-01-18	2014-01-18	小区由11幢高层建筑和4幢商业用房组成。共有住房1199户，户型面积从87到188平米不等，一般标准层高3.1米，底层层高3.7米，其中2号楼3.6米。11楼与12楼为复式住宅，挑空部分层高6.2米。本项目中13000平米的商业配套，其中6000平米用于引进一个超市，生活方便，另周边有配套幼儿园。小区内设有1000米下沉式泳池，一个篮球场，网球场。40000方中央园林景观，项目采用现代ART DECO风格，并通过建筑围合的方式最大限度地营造出一个大型中央花园，在花园中设置了游泳池、水体、密林、草坪等，丰富业主的活动空间，同时与河滨绿地河景相互渗透，形成“城中有景，景中有城”的绿色空间。本项目交通便捷，123路公交，北面1公里左右为高铁北站，从动车旅游出差都非常方便。离大通购物中心、大润发，市政府只5分钟左右车程。	2018-10-26 10:28:31	2018-10-26 10:28:31	1.69999999999999996
\.


--
-- Name: real_estates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estates_id_seq', 1, true);


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (role_id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, display_name, description, deleted_at, created_at, updated_at) FROM stdin;
1	test	测试	\N	\N	2018-10-26 13:19:09	2018-10-26 13:19:09
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Data for Name: schemes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schemes (id, name, model, user_id, created_at, updated_at, description, status, _points, points) FROM stdin;
101	周杰	images/users/huyouheng/xiaogaoceng1.gltf	1	2018-10-28 09:44:24	2018-10-28 09:44:24		0	\N	53.23352120052459,39.23020392462333,528.4044376627503
103	GDuQrA	images/users/huyouheng/shu.gltf	1	2018-10-28 18:20:25	2018-10-28 18:20:25		0	\N	101.82921747000111,47.74845363359082,0
105	上虞新1	images/users/huyouheng/shu.gltf	1	2018-10-28 18:29:23	2018-10-28 18:29:23		0	\N	95.11171550332266,41.61169251749981,0
112	fasdfasdf	images/users/huyouheng/shu.gltf	1	2018-10-28 18:34:01	2018-10-28 18:34:01		0	\N	57.07370531031789,43.018871374100684,0
113	上虞新1	images/users/huyouheng/1111.gltf	1	2018-10-28 19:42:19	2018-10-28 19:42:19		0	\N	134.84257501346343,44.02163088336,0
114	上虞水尚名都	images/users/huyouheng/A4.gltf	1	2018-10-29 08:22:21	2018-10-29 08:22:21	1234	0	\N	62.335147188240455,36.57684491522845,0
115	上虞水尚名都	images/users/huyouheng/A4.gltf	1	2018-10-29 08:23:23	2018-10-29 08:23:23		0	\N	62.336018121284916,36.57719713334599,0
116	上虞4	images/users/huyouheng/A1.gltf	1	2018-10-29 08:38:08	2018-10-29 08:38:08		0	\N	62.335341786434796,36.57636227772577,0
117	admin	images/users/huyouheng/xiaogaoceng1.gltf	1	2018-10-29 10:11:40	2018-10-29 10:11:42		1	\N	63.6371757758613,44.805960092890324,107.86989645073434
118	上虞	images/users/huyouheng/cc.gltf	1	2018-11-16 13:57:33	2018-11-16 13:57:33		0	\N	undefined,undefined,undefined
119	上虞	images/users/huyouheng/cc.gltf	1	2018-11-16 13:58:00	2018-11-16 13:58:00		0	\N	120.86837256323226,30.04744878291949,4.246155811223953
96	admin	images/users/huyouheng/xiaogaoceng1.gltf	1	2018-10-28 07:52:05	2018-10-28 07:52:05		0	\N	57.07322117479036,43.018427700036064,0
\.


--
-- Name: schemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schemes_id_seq', 119, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
lHxYfasoLKQ4cgZt6JKFeqiemxLoR8Pl6uxFo7oF	\N	192.168.3.2	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTjdiQW1ZMnZRa1VucTNtbWM2U3lNUjVkUmZMTHVhZkxHSnhFU0ZCYyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU4OiJodHRwOi8vMTkyLjE2OC4zLjM6MTIzNDUvUG9wQ2l0eT9zPSUyRlBvcENpdHkmcz0lMkZQb3BDaXR5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=	1542338296
AEKGMqpUsH2uVIOtg5O6NCMal2guXuHQ0KiYzDeM	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoidE1INjJGejUyaUo3SlpsNDRwcFdPaDIxTGNqc3lCZGlvU1ExbGZMdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMjcuMC4wLjE6MTIzNDUiO31zOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1543367911
vzgOCLKYqcpTMD865WUutcHYcwUzXnR6OMbFM8RM	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoid0hsazhrMXRzR0RyWjBGblp4WVJmTzZGdEIzcm5Za1Zub0lmV20wbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMjcuMC4wLjE6MTIzNDUvUG9wQ2l0eS9tZWRpYS1tYW5hZ2VyP3M9JTJGUG9wQ2l0eSUyRm1lZGlhLW1hbmFnZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=	1543219767
BNvMOJKodPljyEgfTz5NLaoFBgGbOlF4Jv9PTpom	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOGZsTHZWOU5rYVdMS2g2bG10U0VHRGp4dlVyaTVYQVh1d29IMUdQTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6MTIzNDUvUG9wQ2l0eS9hdXRoL21lbnU/cz0lMkZQb3BDaXR5JTJGYXV0aCUyRm1lbnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MTp7czozMzoiWDEzNThlNGExNWM1MmZkMmVjMmFmNzAwNGEzYzhjZWZhIjtOO319	1542955641
PeXqTIdCnjBEWuz2LeYhIQlxWss5XmmVkoQLBvbO	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZ0Z2blk4VmVWMllVZ2xqbmpvWXh5YUlQYTd5b00zb29hT1ljZDhYTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMjcuMC4wLjE6MTIzNDUvUG9wQ2l0eS9yZXNvdXJjZS90aWxlc2V0cz9zPSUyRlBvcENpdHklMkZyZXNvdXJjZSUyRnRpbGVzZXRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319	1542338541
po6dZMD5rjld3Bv0XeoufhRDEoxiED7Gn8SpNdEk	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTDV6UENxSkpsNVV3a1hxeXVSSGY5NU9VaG93RVBOZlJPSUJBdnJXSiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjY3OiJodHRwOi8vMTI3LjAuMC4xOjEyMzQ1L1BvcENpdHkvYXV0aC9tZW51P3M9JTJGUG9wQ2l0eSUyRmF1dGglMkZtZW51Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=	1543313771
0oe7T9rjMTr5yCdo8nEmVkCb8lTuBGVALFgsFsJr	\N	192.168.3.2	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaWVleWV1NVk3T2RPU0xIRlRVMFdqaTU2SkNnUFRWcFRzdWdKUnVLcyI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjg5OiJodHRwOi8vMTkyLjE2OC4zLjM6MTIzNDUvUG9wQ2l0eS90b29sYmFycz9zPSUyRlBvcENpdHklMkZ0b29sYmFycyZzPSUyRlBvcENpdHklMkZ0b29sYmFycyI7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9	1542346799
vPnyK77rF3bZcZwMFzZBYVU3kiDaZJuOzmgjEFvD	\N	192.168.3.254	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN1V2VW5SZzBkSVhLNVJHZ0RNTWNxWG9JV0JJQzZsekhEa2d6RFZobiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU4OiJodHRwOi8vMTkyLjE2OC4zLjM6MTIzNDUvUG9wQ2l0eT9zPSUyRlBvcENpdHkmcz0lMkZQb3BDaXR5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=	1542338195
\.


--
-- Name: shui_shang_m_ds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shui_shang_m_ds_id_seq', 1202, true);


--
-- Name: shuishagnmingdu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shuishagnmingdu_id_seq', 53, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys  FROM stdin;
\.


--
-- Data for Name: terrains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terrains (id, name, url, description, watermask, vertexnormals, ellipsoid, type, img, per, created_at, updated_at) FROM stdin;
2	google全球地形	http://www.supermapol.com/iserver/services/3D-stk_terrain/rest/realspace/datas/info/data/path	google全球地形	1	1	wgs84	popdem	fa-adn	0	2018-03-28 11:20:09	2018-09-12 16:52:36
1	STK全球地形	https://assets.agi.com/stk-terrain/world	STK全球地形	1	1	wgs84	popdem	fa-adn	0	2018-03-28 11:15:01	2018-09-12 16:52:37
\.


--
-- Name: terrains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terrains_id_seq', 1, false);


--
-- Data for Name: tileset_build; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tileset_build (tileset_id, build_id) FROM stdin;
\.


--
-- Data for Name: tileset_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tileset_groups (id, name, display_name, per, created_at, updated_at) FROM stdin;
9	MwAiM2	丽水	0	2018-09-12 14:45:31	2018-09-12 17:12:53
13	VmcnJ8	上虞	0	2018-10-17 17:27:10	2018-10-17 17:37:18
12	lLzPas	镇海	0	2018-09-12 14:52:58	2018-09-12 16:32:01
11	9icrqG	绍兴	0	2018-09-12 14:45:41	2018-09-12 16:53:02
10	xBQDW4	慈城	0	2018-09-12 14:45:36	2018-09-12 16:53:02
1	GDuQrA	上虞新	0	2018-10-28 10:15:55	2018-10-28 10:15:55
\.


--
-- Name: tileset_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tileset_groups_id_seq', 1, true);


--
-- Data for Name: tilesets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tilesets (id, name, url, description, icon, img, per, group_id, created_at, updated_at) FROM stdin;
8	2	http://192.168.3.234:84/Scene/Scene/shangyu/final/sy-block14_cesium/Scene/symblock14_cesium.json	2	\N	\N	0	13	2018-11-14 15:55:47	2018-11-14 15:55:47
10	4	http://192.168.3.234:84/Scene/Scene/shangyu/final/sy-block16_cesium/Scene/symblock16_cesium.json	4	\N	\N	0	13	2018-11-14 15:56:18	2018-11-14 15:56:18
7	1	http://192.168.3.234:84/Scene/Scene/shangyu/final/sy-block13_cesium/Scene/symblock13_cesium.json	1	\N	\N	0	13	2018-11-14 15:55:02	2018-11-14 15:55:09
9	3	http://192.168.3.234:84/Scene/Scene/shangyu/final/sy-block15_cesium/Scene/symblock15_cesium.json	3	\N	\N	0	13	2018-11-14 15:56:00	2018-11-14 15:56:00
11	水尚名都	http://192.168.3.234:84/Scene/Scene/sy-shuishangmingdu_cesium/Scene/symshuishangmingdu_cesium.json	1	\N	\N	1	\N	2018-11-14 17:26:15	2018-11-16 11:20:24
\.


--
-- Name: tilesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tilesets_id_seq', 11, true);


--
-- Data for Name: toolbar_bts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.toolbar_bts (id, toolbar_id, name, btn_id, created_at, updated_at) FROM stdin;
1	3	信息	imageryBtn	2018-10-26 14:36:07	2018-10-26 14:36:07
2	3	设置	imagerySetting	2018-10-26 14:36:22	2018-10-26 14:36:22
3	2	查看	tilesetBtn	2018-10-26 14:36:38	2018-10-26 14:36:38
\.


--
-- Name: toolbar_bts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.toolbar_bts_id_seq', 3, true);


--
-- Data for Name: toolbars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.toolbars (id, name, type, icon, img, created_at, updated_at) FROM stdin;
1	地形	terrains	\N	\N	2018-10-26 14:34:40	2018-10-26 14:37:25
3	影像	images	http://192.168.3.254/popcity/images/city.png	http://192.168.3.254/popcity/images/city.png	2018-10-26 14:35:45	2018-11-14 16:26:13
2	城市实景	tilesets	http://192.168.3.254/popcity/images/city.png	http://192.168.3.254/popcity/images/city.png	2018-10-26 14:35:30	2018-11-14 16:26:46
\.


--
-- Name: toolbars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.toolbars_id_seq', 3, true);


--
-- Data for Name: user_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_files (id, user_id, name, url, file_size, file_type, "position", created_at, updated_at, origin) FROM stdin;
38	1	polygon4.geojson	images/users/huyouheng/file/polygon4.geojson	17	geojson	\N	2018-11-28 09:41:25	2018-11-28 09:41:25	\N
39	1	redline.geojson	images/users/huyouheng/file/redline.geojson	3	geojson	\N	2018-11-28 10:40:22	2018-11-28 10:40:22	\N
\.


--
-- Name: user_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_files_id_seq', 39, true);


--
-- Data for Name: user_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_login (id, user_id, ip, location, browser_name, browser_version, platform, created_at, updated_at) FROM stdin;
39	0	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-28 22:56:10	2018-10-28 22:56:10
40	1	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-28 22:56:22	2018-10-28 22:56:22
41	0	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-29 08:06:34	2018-10-29 08:06:34
42	1	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-29 08:06:56	2018-10-29 08:06:56
43	0	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-29 08:07:08	2018-10-29 08:07:08
44	1	3232236526	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-10-29 08:07:21	2018-10-29 08:07:21
45	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 08:59:19	2018-10-29 08:59:19
46	1	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 08:59:38	2018-10-29 08:59:38
47	0	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-10-29 09:00:15	2018-10-29 09:00:15
48	1	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-10-29 09:00:19	2018-10-29 09:00:19
49	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 09:17:56	2018-10-29 09:17:56
50	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 09:17:59	2018-10-29 09:17:59
51	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 09:24:25	2018-10-29 09:24:25
52	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 09:24:28	2018-10-29 09:24:28
53	1	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 09:25:00	2018-10-29 09:25:00
54	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 09:26:55	2018-10-29 09:26:55
55	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 09:26:58	2018-10-29 09:26:58
56	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:11:23	2018-10-29 10:11:23
57	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:11:26	2018-10-29 10:11:26
58	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:18:33	2018-10-29 10:18:33
59	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:24:58	2018-10-29 10:24:58
60	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:44:50	2018-10-29 10:44:50
61	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:44:54	2018-10-29 10:44:54
62	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:57:41	2018-10-29 10:57:41
63	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 10:57:44	2018-10-29 10:57:44
64	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 11:18:28	2018-10-29 11:18:28
65	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 11:18:31	2018-10-29 11:18:31
66	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 11:27:58	2018-10-29 11:27:58
67	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-10-29 11:28:01	2018-10-29 11:28:01
68	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 12:43:02	2018-10-29 12:43:02
69	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 12:44:07	2018-10-29 12:44:07
70	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 12:44:17	2018-10-29 12:44:17
71	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:41:18	2018-10-29 17:41:18
72	1	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:42:20	2018-10-29 17:42:20
73	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:44:28	2018-10-29 17:44:28
74	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:44:53	2018-10-29 17:44:53
75	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:46:46	2018-10-29 17:46:46
76	0	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:49:16	2018-10-29 17:49:16
77	1	3232236310	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-10-29 17:53:59	2018-10-29 17:53:59
78	0	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-11-14 15:57:05	2018-11-14 15:57:05
79	1	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-11-14 15:57:06	2018-11-14 15:57:06
80	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:06	2018-11-14 15:57:06
81	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:07	2018-11-14 15:57:07
82	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:07	2018-11-14 15:57:07
83	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:07	2018-11-14 15:57:07
84	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:08	2018-11-14 15:57:08
85	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:08	2018-11-14 15:57:08
86	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:09	2018-11-14 15:57:09
87	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:09	2018-11-14 15:57:09
88	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:10	2018-11-14 15:57:10
89	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:10	2018-11-14 15:57:10
90	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-14 15:57:11	2018-11-14 15:57:11
91	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-14 15:57:11	2018-11-14 15:57:11
92	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:12	2018-11-14 15:57:12
93	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 15:57:12	2018-11-14 15:57:12
94	0	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 16:17:41	2018-11-14 16:17:41
95	1	3232236542	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; WOW64	2018-11-14 16:17:42	2018-11-14 16:17:42
96	0	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; Win64; x64	2018-11-15 11:21:43	2018-11-15 11:21:43
97	1	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	70.0	Windows NT 10.0; Win64; x64	2018-11-15 11:21:47	2018-11-15 11:21:47
98	0	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-11-16 11:14:36	2018-11-16 11:14:36
99	1	3232236522	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	72.0	Windows NT 10.0; Win64; x64	2018-11-16 11:14:58	2018-11-16 11:14:58
100	0	3232236290	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-11-16 11:15:09	2018-11-16 11:15:09
101	1	3232236290	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	68.0	Windows NT 10.0; WOW64	2018-11-16 11:15:13	2018-11-16 11:15:13
102	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-16 11:17:39	2018-11-16 11:17:39
103	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-16 11:17:40	2018-11-16 11:17:40
104	1	3232236291	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-11-16 11:21:29	2018-11-16 11:21:29
105	0	3232236291	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Failed to identify the browser	Failed to identify the browser	6	2018-11-16 11:21:34	2018-11-16 11:21:34
106	0	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-16 11:46:39	2018-11-16 11:46:39
107	1	3232236524	{"status":"1","info":"OK","infocode":"10000","province":"局域网","city":[],"adcode":[],"rectangle":[]}	Chrome	69.0	Windows NT 10.0; WOW64	2018-11-16 11:46:54	2018-11-16 11:46:54
\.


--
-- Name: user_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_login_id_seq', 107, true);


--
-- Data for Name: user_pois; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_pois (id, user_id, poi_id, created_at, updated_at) FROM stdin;
1	1	1	2018-10-26 14:42:03	2018-10-26 14:42:03
2	1	2	2018-10-26 15:06:16	2018-10-26 15:06:16
3	1	3	2018-10-26 15:07:16	2018-10-26 15:07:16
4	1	4	2018-10-26 15:08:03	2018-10-26 15:08:03
5	1	5	2018-10-26 15:09:26	2018-10-26 15:09:26
6	1	6	2018-10-26 15:11:03	2018-10-26 15:11:03
7	1	7	2018-10-26 15:11:34	2018-10-26 15:11:34
8	1	8	2018-10-26 15:12:10	2018-10-26 15:12:10
9	1	9	2018-10-26 15:12:33	2018-10-26 15:12:33
10	1	10	2018-10-26 15:13:36	2018-10-26 15:13:36
11	1	11	2018-10-26 15:14:37	2018-10-26 15:14:37
12	1	12	2018-10-26 15:14:39	2018-10-26 15:14:39
13	1	13	2018-10-26 15:15:35	2018-10-26 15:15:35
15	1	15	2018-10-26 15:16:54	2018-10-26 15:16:54
16	1	16	2018-10-26 15:44:55	2018-10-26 15:44:55
17	1	17	2018-10-26 17:41:50	2018-10-26 17:41:50
22	1	22	2018-10-26 18:42:17	2018-10-26 18:42:17
23	1	23	2018-10-26 18:43:07	2018-10-26 18:43:07
31	1	31	2018-11-16 13:34:21	2018-11-16 13:34:21
\.


--
-- Name: user_pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_pois_id_seq', 31, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, avatar, sex, phone, active, api_token, angle_count, poi_count, share_count, pic_count, file_count, following_count, followed_count, like_count, comment_count, login_count, login_type, deleted_at, created_at, updated_at) FROM stdin;
1	huyouheng	huyouheng@popsmart.cn	$2y$10$WgEky3zuT7HILK/BNxPzg.WMZLOB0oUzsrFX21g7nFEzsQcD.iK/S	images/20170824133845861.png	2	\N	0	oxrumKTXOAtjfX65FqpUlJmE6hAiCAwQam1pPd1sfQ9P6jPKqyO2TiPaLHoI	3	2	0	9	0	0	0	0	0	0	name	\N	2018-10-26 13:10:10	2018-11-28 10:40:22
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: admin_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_menu
    ADD CONSTRAINT admin_menu_pkey PRIMARY KEY (id);


--
-- Name: admin_operation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_operation_log
    ADD CONSTRAINT admin_operation_log_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_name_unique UNIQUE (name);


--
-- Name: admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_name_unique UNIQUE (name);


--
-- Name: admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_username_unique UNIQUE (username);


--
-- Name: angles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angles
    ADD CONSTRAINT angles_pkey PRIMARY KEY (id);


--
-- Name: buildPolygon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT "buildPolygon_pkey" PRIMARY KEY (id);


--
-- Name: build_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_types
    ADD CONSTRAINT build_types_pkey PRIMARY KEY (id);


--
-- Name: builds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_pkey PRIMARY KEY (id);


--
-- Name: cache_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_key_unique UNIQUE (key);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: measures_bts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measures_bts
    ADD CONSTRAINT measures_bts_pkey PRIMARY KEY (id);


--
-- Name: measures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measures
    ADD CONSTRAINT measures_pkey PRIMARY KEY (id);


--
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: monomers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monomers
    ADD CONSTRAINT monomers_pkey PRIMARY KEY (id);


--
-- Name: new_household_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_household_maps
    ADD CONSTRAINT new_household_maps_pkey PRIMARY KEY (id);


--
-- Name: pattern_dirs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_dirs
    ADD CONSTRAINT pattern_dirs_pkey PRIMARY KEY (id);


--
-- Name: patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patterns
    ADD CONSTRAINT patterns_pkey PRIMARY KEY (id);


--
-- Name: permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (user_id, permission_id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: poi_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poi_types
    ADD CONSTRAINT poi_types_pkey PRIMARY KEY (id);


--
-- Name: pois_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pois
    ADD CONSTRAINT pois_pkey PRIMARY KEY (id);


--
-- Name: real_estate_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_maps
    ADD CONSTRAINT real_estate_maps_pkey PRIMARY KEY (id);


--
-- Name: real_estates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estates
    ADD CONSTRAINT real_estates_pkey PRIMARY KEY (id);


--
-- Name: role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_pkey PRIMARY KEY (id);


--
-- Name: sessions_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_unique UNIQUE (id);


--
-- Name: shui_shang_m_ds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.household
    ADD CONSTRAINT shui_shang_m_ds_pkey PRIMARY KEY (id);


--
-- Name: shuishagnmingdu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.household_maps
    ADD CONSTRAINT shuishagnmingdu_pkey PRIMARY KEY (id);


--
-- Name: terrains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terrains
    ADD CONSTRAINT terrains_pkey PRIMARY KEY (id);


--
-- Name: tileset_build_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tileset_build
    ADD CONSTRAINT tileset_build_pkey PRIMARY KEY (tileset_id, build_id);


--
-- Name: tileset_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tileset_groups
    ADD CONSTRAINT tileset_groups_pkey PRIMARY KEY (id);


--
-- Name: tilesets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tilesets
    ADD CONSTRAINT tilesets_pkey PRIMARY KEY (id);


--
-- Name: toolbar_bts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toolbar_bts
    ADD CONSTRAINT toolbar_bts_pkey PRIMARY KEY (id);


--
-- Name: toolbars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toolbars
    ADD CONSTRAINT toolbars_pkey PRIMARY KEY (id);


--
-- Name: user_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_files
    ADD CONSTRAINT user_files_pkey PRIMARY KEY (id);


--
-- Name: user_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT user_login_pkey PRIMARY KEY (id);


--
-- Name: user_pois_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_pois
    ADD CONSTRAINT user_pois_pkey PRIMARY KEY (id);


--
-- Name: users_api_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_api_token_unique UNIQUE (api_token);


--
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_unique UNIQUE (name);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: admin_operation_log_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_operation_log_user_id_index ON public.admin_operation_log USING btree (user_id);


--
-- Name: admin_role_menu_role_id_menu_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_role_menu_role_id_menu_id_index ON public.admin_role_menu USING btree (role_id, menu_id);


--
-- Name: admin_role_permissions_role_id_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_role_permissions_role_id_permission_id_index ON public.admin_role_permissions USING btree (role_id, permission_id);


--
-- Name: admin_role_users_role_id_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_role_users_role_id_user_id_index ON public.admin_role_users USING btree (role_id, user_id);


--
-- Name: admin_user_permissions_user_id_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_user_permissions_user_id_permission_id_index ON public.admin_user_permissions USING btree (user_id, permission_id);


--
-- Name: building_build_no__index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX building_build_no__index ON public.buildings USING btree (build_no);


--
-- Name: building_real_estate_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX building_real_estate_id_index ON public.buildings USING btree (real_estate_id);


--
-- Name: builds_build_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX builds_build_type_id_index ON public.builds USING btree (build_type_id);


--
-- Name: business_title_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX business_title_index ON public.business USING btree (title);


--
-- Name: comments_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comments_active_index ON public.comments USING btree (active);


--
-- Name: comments_res_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comments_res_id_index ON public.comments USING btree (res_id);


--
-- Name: comments_res_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comments_res_type_index ON public.comments USING btree (res_type);


--
-- Name: events_event_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_event_type_id_index ON public.events USING btree (event_type_id);


--
-- Name: file_origin_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_origin_index ON public.user_files USING btree (origin);


--
-- Name: household_build_no_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX household_build_no_index ON public.household USING btree (build_no);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: patterns_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patterns_name_index ON public.patterns USING btree (name);


--
-- Name: permission_role_permission_id_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_permission_id_role_id_index ON public.permission_role USING btree (permission_id, role_id);


--
-- Name: real_estate_maps_real_estate_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX real_estate_maps_real_estate_id_index ON public.real_estate_maps USING btree (real_estate_id);


--
-- Name: real_estates_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX real_estates_name_index ON public.real_estates USING btree (name);


--
-- Name: scheme_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scheme_status_index ON public.schemes USING btree (status);


--
-- Name: shui_shang_m_ds_build_num_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shui_shang_m_ds_build_num_index ON public.household USING btree (build_no);


--
-- Name: sidx_buildPolygon_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "sidx_buildPolygon_geom" ON public.buildings USING gist (geom);


--
-- Name: sidx_new_household_maps_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_new_household_maps_geom ON public.new_household_maps USING gist (geom);


--
-- Name: sidx_shuishagnmingdu_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_shuishagnmingdu_geom ON public.household_maps USING gist (geom);


--
-- Name: status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX status_index ON public.patterns USING btree (status);


--
-- Name: user_files_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_files_user_id_index ON public.user_files USING btree (user_id);


--
-- Name: user_login_ip_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_login_ip_index ON public.user_login USING btree (ip);


--
-- Name: builds_build_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_build_type_id_foreign FOREIGN KEY (build_type_id) REFERENCES public.build_types(id);


--
-- Name: measures_bts_measures_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measures_bts
    ADD CONSTRAINT measures_bts_measures_id_foreign FOREIGN KEY (measures_id) REFERENCES public.measures(id) ON DELETE CASCADE;


--
-- Name: pattern_dirs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_dirs
    ADD CONSTRAINT pattern_dirs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: patterns_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patterns
    ADD CONSTRAINT patterns_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permission_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schemes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: tileset_build_build_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tileset_build
    ADD CONSTRAINT tileset_build_build_id_foreign FOREIGN KEY (build_id) REFERENCES public.builds(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tileset_build_tileset_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tileset_build
    ADD CONSTRAINT tileset_build_tileset_id_foreign FOREIGN KEY (tileset_id) REFERENCES public.tilesets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: toolbar_bts_toolbar_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.toolbar_bts
    ADD CONSTRAINT toolbar_bts_toolbar_id_foreign FOREIGN KEY (toolbar_id) REFERENCES public.toolbars(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

