--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: ghstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore;


--
-- Name: ghstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_in(cstring) RETURNS ghstore
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'ghstore_in';


--
-- Name: ghstore_out(ghstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_out(ghstore) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'ghstore_out';


--
-- Name: ghstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore (
    INTERNALLENGTH = variable,
    INPUT = ghstore_in,
    OUTPUT = ghstore_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- Name: hstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore;


--
-- Name: hstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_in(cstring) RETURNS hstore
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'hstore_in';


--
-- Name: hstore_out(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_out(hstore) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'hstore_out';


--
-- Name: hstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore (
    INTERNALLENGTH = variable,
    INPUT = hstore_in,
    OUTPUT = hstore_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- Name: akeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION akeys(hstore) RETURNS text[]
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'akeys';


--
-- Name: avals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION avals(hstore) RETURNS text[]
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'avals';


--
-- Name: defined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION defined(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'defined';


--
-- Name: delete(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete(hstore, text) RETURNS hstore
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'delete';


--
-- Name: each(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION each(hs hstore, OUT key text, OUT value text) RETURNS SETOF record
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'each';


--
-- Name: exist(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exist(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'exists';


--
-- Name: fetchval(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fetchval(hstore, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'fetchval';


--
-- Name: ghstore_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_compress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_compress';


--
-- Name: ghstore_consistent(internal, internal, integer, oid, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_consistent(internal, internal, integer, oid, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_consistent';


--
-- Name: ghstore_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_decompress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_decompress';


--
-- Name: ghstore_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_penalty';


--
-- Name: ghstore_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_picksplit(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_picksplit';


--
-- Name: ghstore_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_same(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_same';


--
-- Name: ghstore_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_union(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_union';


--
-- Name: gin_consistent_hstore(internal, smallint, internal, integer, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_consistent_hstore(internal, smallint, internal, integer, internal, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_consistent_hstore';


--
-- Name: gin_extract_hstore(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_hstore(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_extract_hstore';


--
-- Name: gin_extract_hstore_query(internal, internal, smallint, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_hstore_query(internal, internal, smallint, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_extract_hstore_query';


--
-- Name: hs_concat(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_concat(hstore, hstore) RETURNS hstore
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_concat';


--
-- Name: hs_contained(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contained(hstore, hstore) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_contained';


--
-- Name: hs_contains(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contains(hstore, hstore) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_contains';


--
-- Name: isdefined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isdefined(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'defined';


--
-- Name: isexists(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isexists(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'exists';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: queue_classic_jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE queue_classic_jobs (
    id integer NOT NULL,
    q_name character varying(255),
    method character varying(255),
    args text,
    locked_at timestamp with time zone
);


--
-- Name: lock_head(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lock_head(tname character varying) RETURNS SETOF queue_classic_jobs
    LANGUAGE plpgsql
    AS $_$
BEGIN
  RETURN QUERY EXECUTE 'SELECT * FROM lock_head($1,10)' USING tname;
END;
$_$;


--
-- Name: lock_head(character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lock_head(q_name character varying, top_boundary integer) RETURNS SETOF queue_classic_jobs
    LANGUAGE plpgsql
    AS $_$
DECLARE
  unlocked integer;
  relative_top integer;
  job_count integer;
BEGIN
  -- The purpose is to release contention for the first spot in the table.
  -- The select count(*) is going to slow down dequeue performance but allow
  -- for more workers. Would love to see some optimization here...

  EXECUTE 'SELECT count(*) FROM '
    || '(SELECT * FROM queue_classic_jobs WHERE q_name = '
    || quote_literal(q_name)
    || ' LIMIT '
    || quote_literal(top_boundary)
    || ') limited'
  INTO job_count;

  SELECT TRUNC(random() * (top_boundary - 1))
  INTO relative_top;

  IF job_count < top_boundary THEN
    relative_top = 0;
  END IF;

  LOOP
    BEGIN
      EXECUTE 'SELECT id FROM queue_classic_jobs '
        || ' WHERE locked_at IS NULL'
        || ' AND q_name = '
        || quote_literal(q_name)
        || ' ORDER BY id ASC'
        || ' LIMIT 1'
        || ' OFFSET ' || quote_literal(relative_top)
        || ' FOR UPDATE NOWAIT'
      INTO unlocked;
      EXIT;
    EXCEPTION
      WHEN lock_not_available THEN
        -- do nothing. loop again and hope we get a lock
    END;
  END LOOP;

  RETURN QUERY EXECUTE 'UPDATE queue_classic_jobs '
    || ' SET locked_at = (CURRENT_TIMESTAMP)'
    || ' WHERE id = $1'
    || ' AND locked_at is NULL'
    || ' RETURNING *'
  USING unlocked;

  RETURN;
END;
$_$;


--
-- Name: skeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION skeys(hstore) RETURNS SETOF text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'skeys';


--
-- Name: svals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION svals(hstore) RETURNS SETOF text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'svals';


--
-- Name: tconvert(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tconvert(text, text) RETURNS hstore
    LANGUAGE c IMMUTABLE
    AS '$libdir/hstore', 'tconvert';


--
-- Name: ->; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR -> (
    PROCEDURE = fetchval,
    LEFTARG = hstore,
    RIGHTARG = text
);


--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR => (
    PROCEDURE = tconvert,
    LEFTARG = text,
    RIGHTARG = text
);


--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = exist,
    LEFTARG = hstore,
    RIGHTARG = text,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = hs_concat,
    LEFTARG = hstore,
    RIGHTARG = hstore
);


--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: gin_hstore_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gin_hstore_ops
    DEFAULT FOR TYPE hstore USING gin AS
    STORAGE text ,
    OPERATOR 7 @>(hstore,hstore) ,
    OPERATOR 9 ?(hstore,text) ,
    FUNCTION 1 bttextcmp(text,text) ,
    FUNCTION 2 gin_extract_hstore(internal,internal) ,
    FUNCTION 3 gin_extract_hstore_query(internal,internal,smallint,internal,internal) ,
    FUNCTION 4 gin_consistent_hstore(internal,smallint,internal,integer,internal,internal);


--
-- Name: gist_hstore_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_hstore_ops
    DEFAULT FOR TYPE hstore USING gist AS
    STORAGE ghstore ,
    OPERATOR 7 @>(hstore,hstore) ,
    OPERATOR 9 ?(hstore,text) ,
    OPERATOR 13 @(hstore,hstore) ,
    FUNCTION 1 ghstore_consistent(internal,internal,integer,oid,internal) ,
    FUNCTION 2 ghstore_union(internal,internal) ,
    FUNCTION 3 ghstore_compress(internal) ,
    FUNCTION 4 ghstore_decompress(internal) ,
    FUNCTION 5 ghstore_penalty(internal,internal,internal) ,
    FUNCTION 6 ghstore_picksplit(internal,internal) ,
    FUNCTION 7 ghstore_same(internal,internal,internal);


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    user_id integer NOT NULL,
    target_type character varying(40),
    target_id integer,
    target_name character varying(60),
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    branch_id integer DEFAULT 0
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: arrivals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE arrivals (
    id integer NOT NULL,
    loading_id integer,
    unload_date timestamp without time zone,
    delivery_date timestamp without time zone,
    unload_point character varying(1),
    unload_place_id integer,
    city_id integer,
    country_id character varying(2),
    district character varying(30),
    postcode character varying(5),
    address character varying(100),
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    consignee_id integer,
    notify_id integer,
    notify2_id integer,
    deliver_id integer,
    custom_id integer,
    customofficer_id integer,
    statement character varying(20),
    statement_date date,
    notes character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    post_trans boolean DEFAULT false,
    unload_place character varying(60),
    unload_city character varying(100),
    unload_place_code character varying(20),
    creater_id integer DEFAULT 0,
    updater_id integer DEFAULT 0,
    patron_id integer NOT NULL
);


--
-- Name: arrivals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE arrivals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: arrivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE arrivals_id_seq OWNED BY arrivals.id;


--
-- Name: arsiv_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE arsiv_documents (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    document_date date NOT NULL,
    document_no character varying(255),
    documented_type character varying(100),
    documented_id integer,
    status character varying(10) DEFAULT 'active'::character varying,
    country_id character varying(20),
    description character varying(255),
    document_file character varying(255),
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: arsiv_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE arsiv_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: arsiv_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE arsiv_documents_id_seq OWNED BY arsiv_documents.id;


--
-- Name: arsiv_junks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE arsiv_junks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    junked_type character varying(100) NOT NULL,
    junked_id integer NOT NULL,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    "desc" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: arsiv_junks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE arsiv_junks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: arsiv_junks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE arsiv_junks_id_seq OWNED BY arsiv_junks.id;


--
-- Name: assetim_ware_actions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assetim_ware_actions (
    id integer NOT NULL,
    ware_id integer NOT NULL,
    action_date date NOT NULL,
    title character varying(255) NOT NULL,
    action_type character varying(255),
    "desc" text,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company character varying(255),
    person_id integer
);


--
-- Name: assetim_ware_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assetim_ware_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assetim_ware_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assetim_ware_actions_id_seq OWNED BY assetim_ware_actions.id;


--
-- Name: assetim_wares; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assetim_wares (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    serial_no character varying(100),
    barcode character varying(30),
    location character varying(255),
    branch_id integer,
    status character varying(20),
    "desc" text,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    person_id integer,
    "group" character varying(50),
    trademark character varying(50),
    model character varying(255),
    debit_no character varying(20),
    supplier_id integer,
    entry_date date,
    invoice_no character varying(25),
    price double precision,
    currency character varying(10),
    warranty character varying(100),
    details text,
    owner_company character varying(255),
    user_company character varying(255)
);


--
-- Name: assetim_wares_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assetim_wares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assetim_wares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assetim_wares_id_seq OWNED BY assetim_wares.id;


--
-- Name: banks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE banks (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    code character varying(10),
    service_code character varying(10),
    service_url character varying(255),
    response_type character varying(10),
    country character varying(10),
    currency character varying(5),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE banks_id_seq OWNED BY banks.id;


--
-- Name: betausers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE betausers (
    id integer NOT NULL,
    email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(100),
    company character varying(100),
    phone character varying(30),
    country character varying(20),
    ipaddr character varying(20)
);


--
-- Name: betausers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE betausers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: betausers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE betausers_id_seq OWNED BY betausers.id;


--
-- Name: blogger_articles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blogger_articles (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    author_id integer NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    publish_date date,
    website character varying(40),
    blog_comments_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: blogger_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blogger_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blogger_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blogger_articles_id_seq OWNED BY blogger_articles.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branches (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    tel character varying(15),
    fax character varying(15),
    email character varying(40),
    postcode character varying(5),
    address character varying(80),
    district character varying(40),
    city_id integer,
    state_id integer,
    country_id character varying(2),
    status character varying(1) DEFAULT 'A'::character varying,
    patron_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    slug character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city character varying(100)
);


--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- Name: cases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cases (
    id integer NOT NULL,
    company_id integer NOT NULL,
    case_date date NOT NULL,
    case_type character varying(40) NOT NULL,
    case_source character varying(40),
    source_url character varying(100),
    case_status character varying(10),
    description text,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cases_id_seq OWNED BY cases.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    code character varying(10),
    telcode character varying(10),
    state_id integer,
    country_id character varying(2),
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    slug character varying(40)
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_text character varying(300),
    commentable_type character varying(40),
    commentable_id integer,
    commenter character varying(1) DEFAULT 'U'::character varying,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    title character varying(100),
    company_type character varying(5),
    tel character varying(15),
    fax character varying(15),
    gsm character varying(15),
    voip character varying(15),
    website character varying(30),
    contact character varying(40),
    sector character varying(40),
    email character varying(40),
    postcode character varying(5),
    address character varying(80),
    district character varying(40),
    city_id integer,
    state_id integer,
    country_id character varying(2),
    status character varying(1) DEFAULT 'A'::character varying,
    branch_id integer,
    patron_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    twitter_url character varying(30),
    facebook_url character varying(50),
    linkedin_url character varying(50),
    notes character varying(250),
    description character varying(250),
    saler_id integer,
    user_id integer NOT NULL,
    company_no integer,
    slug character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_id integer,
    updater_id integer,
    city character varying(40),
    state character varying(40),
    contacts_count integer DEFAULT 0,
    events_count integer DEFAULT 0,
    partners_count integer DEFAULT 0
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    name character varying(30),
    surname character varying(30) NOT NULL,
    company_id integer,
    user_id integer NOT NULL,
    salutation character varying(5),
    email character varying(90),
    tel character varying(15),
    gsm character varying(15),
    jobtitle character varying(40),
    department character varying(60),
    tel2 character varying(20),
    fax character varying(20),
    birthdate date,
    patron_id integer,
    twitter character varying(50),
    facebook character varying(50),
    linkedin character varying(50),
    des character varying(255),
    slug character varying(60),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: containers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE containers (
    id integer NOT NULL,
    sealno character varying(40),
    container_type character varying(40),
    free_day integer DEFAULT 0,
    demurrage numeric DEFAULT 0,
    demurrage_curr character varying(3),
    notes character varying(200),
    loading_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patron_id integer NOT NULL,
    name character varying(30) NOT NULL,
    due_date date
);


--
-- Name: containers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE containers_id_seq OWNED BY containers.id;


--
-- Name: costs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE costs (
    id integer NOT NULL,
    cost_source character varying(50) NOT NULL,
    cost_type character varying(50) NOT NULL,
    owner_id integer,
    operation character varying(20),
    costable_id integer,
    costable_type character varying(255),
    costable_reference character varying(50),
    cost_price numeric DEFAULT 0,
    price_curr character varying(10),
    cost_vat numeric DEFAULT 0,
    curr_rate double precision DEFAULT 1,
    local_cost_price numeric DEFAULT 0,
    local_price_vat numeric DEFAULT 0,
    truck character varying(20),
    vehicle character varying(20),
    document_no character varying(20),
    document_date date,
    cost_firm character varying(100),
    cost_taxoffice character varying(100),
    cost_taxno character varying(20),
    country_id character varying(20),
    city_id integer,
    branch_id integer,
    settlement_flag boolean DEFAULT true,
    settlement_price numeric DEFAULT 0,
    settlement_curr character varying(10),
    description character varying(255),
    cost_file character varying(255),
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payoff_id integer
);


--
-- Name: costs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE costs_id_seq OWNED BY costs.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    code character varying(2) NOT NULL,
    name character varying(40) NOT NULL,
    telcode character varying(10),
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    slug character varying(40),
    locale character varying(20),
    language character varying(10),
    time_zone character varying(255),
    mail_encoding character varying(20),
    domain character varying(10),
    code3 character varying(3),
    currency character varying(20),
    region character varying(100),
    subregion character varying(100),
    listable boolean DEFAULT true
);


--
-- Name: currates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE currates (
    id integer NOT NULL,
    bank_id integer,
    rate_date date,
    cur1 character varying(255),
    cur2 character varying(255),
    buying numeric,
    selling numeric,
    banknote_buying numeric,
    banknote_selling numeric,
    rate numeric,
    ctime integer,
    bank_refid integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: currates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currates_id_seq OWNED BY currates.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE currencies (
    code character varying(5) NOT NULL,
    name character varying(40) NOT NULL,
    symbol character varying(1),
    multiplier double precision DEFAULT 1 NOT NULL
);


--
-- Name: departures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE departures (
    id integer NOT NULL,
    loading_id integer,
    load_date timestamp without time zone,
    pickup_date timestamp without time zone,
    load_point character varying(1),
    load_place_id integer,
    city_id integer,
    country_id character varying(2),
    district character varying(30),
    postcode character varying(5),
    address character varying(100),
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    loader_id integer,
    sender_id integer,
    custom_id integer,
    customofficer_id integer,
    statement character varying(20),
    statement_date date,
    notes character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_trans boolean DEFAULT false,
    load_place character varying(60),
    load_city character varying(100),
    load_place_code character varying(20),
    creater_id integer DEFAULT 0,
    updater_id integer DEFAULT 0,
    patron_id integer NOT NULL
);


--
-- Name: departures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departures_id_seq OWNED BY departures.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    document_type character varying(50) NOT NULL,
    document_date date NOT NULL,
    document_no character varying(255),
    operation character varying(20),
    documented_id integer,
    documented_type character varying(255),
    owner_reference character varying(50),
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    due_date date,
    page_number integer DEFAULT 1,
    status character varying(1),
    country_id character varying(20),
    city_id integer,
    description character varying(255),
    document_file character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    company_id integer,
    event_date date NOT NULL,
    event_type character varying(40) NOT NULL,
    event_source character varying(40),
    source_url character varying(100),
    event_status character varying(10),
    description text,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    eventable_type character varying(100),
    eventable_id integer,
    event_title character varying(255),
    event_hour character varying(5),
    finish_date date
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feedbacks (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(40),
    msg character varying(500),
    user_id integer,
    patron_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE feedbacks_id_seq OWNED BY feedbacks.id;


--
-- Name: findocs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE findocs (
    id integer NOT NULL,
    docdate date NOT NULL,
    amount double precision DEFAULT 0 NOT NULL,
    curr character varying(3) NOT NULL,
    rate double precision,
    rate_amount double precision DEFAULT 0,
    rate_type character varying(3),
    unit_type character varying(3) NOT NULL,
    unit_id integer NOT NULL,
    unit_name character varying(50),
    process_type character varying(10),
    target_type character varying(3),
    target_id integer,
    target_name character varying(50),
    docno character varying(10),
    extno character varying(20),
    doctype character varying(10),
    des character varying(100),
    glstatus boolean DEFAULT false,
    gldocno integer,
    user_id integer NOT NULL,
    branch_id integer NOT NULL,
    doc_group character varying(20),
    patron_id integer NOT NULL,
    patron_token character varying(40) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: findocs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE findocs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: findocs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE findocs_id_seq OWNED BY findocs.id;


--
-- Name: finunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE finunits (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    curr character varying(5) NOT NULL,
    unit_type character varying(10) NOT NULL,
    branch_id integer,
    bank_id integer,
    bank_branch character varying(30),
    account character varying(20),
    iban character varying(50),
    person_id integer,
    patron_id integer NOT NULL,
    patron_token character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: finunits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE finunits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finunits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE finunits_id_seq OWNED BY finunits.id;


--
-- Name: fleet_vehicles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fleet_vehicles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(20) NOT NULL,
    vehicle_class character varying(20),
    vehicle_type character varying(20),
    brand character varying(20),
    model character varying(50),
    model_year integer,
    patron_id integer,
    owner character varying(50),
    vehicle_price numeric DEFAULT 0,
    price_curr character varying(5),
    buying_date date,
    fuel_capacity integer,
    fuel_type character varying(10),
    tire_size character varying(2),
    link_type character varying(2),
    longitude double precision,
    latitude double precision,
    slug character varying(20),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fleet_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fleet_vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fleet_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fleet_vehicles_id_seq OWNED BY fleet_vehicles.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE follows (
    id integer NOT NULL,
    follower_type character varying(255),
    follower_id integer,
    followable_type character varying(255),
    followable_id integer,
    created_at timestamp without time zone
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE follows_id_seq OWNED BY follows.id;


--
-- Name: fuels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fuels (
    id integer NOT NULL,
    process_date date NOT NULL,
    process_type character varying(255) NOT NULL,
    truck character varying(20),
    vehicle character varying(20),
    staff_id integer NOT NULL,
    fuel_amount numeric DEFAULT 0,
    amount_type character varying(20) NOT NULL,
    document_no character varying(20),
    document_date character varying(255),
    fuel_price numeric DEFAULT 0,
    price_curr character varying(20),
    payment_type character varying(20),
    payment_card character varying(20),
    depot_id integer,
    payment_firm character varying(50),
    payoff_id integer,
    notes text,
    country_id character varying(255),
    city_id integer,
    branch_id integer NOT NULL,
    patron_id integer NOT NULL,
    creater_id integer NOT NULL,
    updater_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fuels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fuels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fuels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fuels_id_seq OWNED BY fuels.id;


--
-- Name: helpdesk_ticket_actions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE helpdesk_ticket_actions (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    action_code character varying(30) NOT NULL,
    assigned character varying(100),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: helpdesk_ticket_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE helpdesk_ticket_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: helpdesk_ticket_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE helpdesk_ticket_actions_id_seq OWNED BY helpdesk_ticket_actions.id;


--
-- Name: helpdesk_tickets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE helpdesk_tickets (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    "desc" text NOT NULL,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    status character varying(30) NOT NULL,
    assigned_id integer,
    close_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reference character varying(30)
);


--
-- Name: helpdesk_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE helpdesk_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: helpdesk_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE helpdesk_tickets_id_seq OWNED BY helpdesk_tickets.id;


--
-- Name: invoitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invoitems (
    id integer NOT NULL,
    invoice_id integer,
    unit_name character varying(100) NOT NULL,
    invoice_name character varying(100),
    unit_number integer DEFAULT 1 NOT NULL,
    unit_price numeric DEFAULT 0 NOT NULL,
    item_price numeric DEFAULT 0 NOT NULL,
    item_vat numeric DEFAULT 0 NOT NULL,
    price_curr character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    credit_debit character varying(10) NOT NULL,
    company_id integer NOT NULL,
    vat_rate double precision DEFAULT 0 NOT NULL,
    curr_rate double precision DEFAULT 1 NOT NULL,
    local_price numeric DEFAULT 0 NOT NULL,
    local_vat numeric DEFAULT 0 NOT NULL,
    local_curr character varying(10) NOT NULL,
    branch_id integer NOT NULL,
    operation character varying(20),
    service character varying(10),
    invoitem_owner_id integer,
    invoitem_owner_type character varying(255),
    owner_reference character varying(50),
    user_id integer NOT NULL,
    approved boolean,
    approver_id integer,
    patron_id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invoitems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invoitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invoitems_id_seq OWNED BY invoitems.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE journals (
    id integer NOT NULL,
    process_date date NOT NULL,
    journal_model character varying(40),
    journaled_type character varying(40),
    journaled_id integer NOT NULL,
    unit integer DEFAULT 0,
    amount numeric DEFAULT 0,
    patron_id integer NOT NULL,
    patron_token character varying(20)
);


--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE journals_id_seq OWNED BY journals.id;


--
-- Name: junks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE junks (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    junked_type character varying(100) NOT NULL,
    junked_id integer NOT NULL,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    "desc" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: junks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE junks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: junks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE junks_id_seq OWNED BY junks.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE likes (
    id integer NOT NULL,
    liker_type character varying(255),
    liker_id integer,
    likeable_type character varying(255),
    likeable_id integer,
    created_at timestamp without time zone
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: listheaders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listheaders (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    i18n_code character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: listheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listheaders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE listheaders_id_seq OWNED BY listheaders.id;


--
-- Name: listitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listitems (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    list_code character varying(255),
    i18n_code character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    listheader_id integer NOT NULL
);


--
-- Name: listitems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE listitems_id_seq OWNED BY listitems.id;


--
-- Name: loadings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE loadings (
    id integer NOT NULL,
    reference character varying(30) NOT NULL,
    position_id integer,
    operation character varying(255),
    direction character varying(255),
    incoterm character varying(20),
    paid_at character varying(20),
    channel character varying(30),
    load_type character varying(1),
    branch_id integer NOT NULL,
    company_id integer NOT NULL,
    agent_id integer,
    user_id integer NOT NULL,
    saler_id integer,
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    agent_price numeric DEFAULT 0,
    agent_curr character varying(255),
    agent_share double precision,
    product_price numeric DEFAULT 0,
    product_curr character varying(255),
    slug character varying(40),
    bank_flag boolean,
    producer character varying(60),
    marks_nos character varying(50),
    hts_no character varying(20),
    brut_wg double precision,
    volume double precision,
    ladameter double precision,
    price_wg double precision,
    patron_id integer NOT NULL,
    commodity character varying(500),
    notes character varying(500),
    load_coun character varying(2),
    unload_coun character varying(2),
    status character varying(1) DEFAULT 'A'::character varying,
    stage character varying(4),
    stage_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sender_id integer,
    consignee_id integer,
    creater_id integer,
    updater_id integer,
    bank character varying(100),
    category character varying(60),
    waybill_no character varying(60),
    waybill_date date,
    departures_count integer DEFAULT 0,
    arrivals_count integer DEFAULT 0,
    containers_count integer DEFAULT 0,
    packages_count integer DEFAULT 0,
    documents_count integer DEFAULT 0,
    weight_unit character varying(20)
);


--
-- Name: loadings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE loadings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loadings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE loadings_id_seq OWNED BY loadings.id;


--
-- Name: logistics_arrivals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_arrivals (
    id integer NOT NULL,
    loading_id integer NOT NULL,
    unload_date date NOT NULL,
    delivery_date date,
    unload_point character varying(10),
    post_trans boolean DEFAULT false,
    unload_place_code character varying(20),
    unload_place character varying(60),
    unload_city character varying(60),
    country_id character varying(2) NOT NULL,
    district character varying(30),
    postcode character varying(5),
    address character varying(100),
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    consignee character varying(60),
    notify character varying(60),
    notify2 character varying(60),
    deliver character varying(60),
    custom character varying(60),
    customofficer character varying(60),
    statement character varying(20),
    statement_date date,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_arrivals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_arrivals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_arrivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_arrivals_id_seq OWNED BY logistics_arrivals.id;


--
-- Name: logistics_containers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_containers (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    sealno character varying(40),
    container_type character varying(40),
    loading_id integer NOT NULL,
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    free_day integer DEFAULT 0,
    due_date date,
    demurrage numeric DEFAULT 0,
    demurrage_curr character varying(3),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_containers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_containers_id_seq OWNED BY logistics_containers.id;


--
-- Name: logistics_departures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_departures (
    id integer NOT NULL,
    loading_id integer NOT NULL,
    load_date date NOT NULL,
    pickup_date date,
    load_point character varying(10),
    pre_trans boolean DEFAULT false,
    load_place_code character varying(20),
    load_place character varying(60),
    load_city character varying(60),
    country_id character varying(2),
    district character varying(30),
    postcode character varying(5),
    address character varying(100),
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    loader character varying(60),
    sender character varying(60),
    custom character varying(60),
    customofficer character varying(60),
    statement character varying(20),
    statement_date date,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_departures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_departures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_departures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_departures_id_seq OWNED BY logistics_departures.id;


--
-- Name: logistics_loadings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_loadings (
    id integer NOT NULL,
    reference character varying(30) NOT NULL,
    position_id integer,
    incoterm character varying(20),
    paid_at character varying(20),
    channel character varying(30),
    load_type character varying(1),
    branch_id integer NOT NULL,
    company_id integer NOT NULL,
    agent_id integer,
    user_id integer NOT NULL,
    saler_id integer,
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    agent_price numeric DEFAULT 0,
    agent_curr character varying(255),
    agent_share double precision,
    product_price numeric DEFAULT 0,
    product_curr character varying(255),
    slug character varying(40),
    bank_flag boolean,
    bank character varying(100),
    producer character varying(60),
    marks_nos character varying(50),
    hts_no character varying(20),
    brut_wg double precision,
    volume double precision,
    ladameter double precision,
    price_wg double precision,
    weight_unit character varying(20),
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    commodity text,
    notes text,
    load_coun character varying(2),
    unload_coun character varying(2),
    status character varying(10) DEFAULT 'active'::character varying,
    sender character varying(255),
    consignee character varying(255),
    category character varying(60),
    departures_count integer DEFAULT 0,
    arrivals_count integer DEFAULT 0,
    containers_count integer DEFAULT 0,
    packages_count integer DEFAULT 0,
    documents_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_loadings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_loadings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_loadings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_loadings_id_seq OWNED BY logistics_loadings.id;


--
-- Name: logistics_packages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_packages (
    id integer NOT NULL,
    loading_id integer NOT NULL,
    pack_type character varying(255) NOT NULL,
    total integer DEFAULT 0,
    dimension1 integer,
    dimension2 integer,
    dimension3 integer,
    brutwg double precision DEFAULT 0,
    netwg double precision DEFAULT 0,
    volume double precision DEFAULT 0,
    lada double precision DEFAULT 0,
    weight_unit character varying(20),
    imo character varying(20),
    gtip character varying(20),
    po character varying(20),
    container_no character varying(40),
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    description text,
    loading_notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_packages_id_seq OWNED BY logistics_packages.id;


--
-- Name: logistics_positions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_positions (
    id integer NOT NULL,
    reference character varying(30) NOT NULL,
    title character varying(255) NOT NULL,
    branch_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying,
    report_date date,
    slug character varying(40),
    trashed boolean DEFAULT false,
    notes text,
    patron_id integer NOT NULL,
    loadings_count integer DEFAULT 0,
    transports_count integer DEFAULT 0,
    documents_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_positions_id_seq OWNED BY logistics_positions.id;


--
-- Name: logistics_transports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_transports (
    id integer NOT NULL,
    position_id integer NOT NULL,
    trans_method character varying(20) NOT NULL,
    vessel character varying(20),
    truck character varying(20),
    voyage character varying(20),
    vagon character varying(255),
    waybill_no character varying(40),
    waybill_date date,
    driver_name character varying(60),
    driver_id integer,
    owner_id integer,
    supplier_id integer,
    branch_id integer,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    departure_date date,
    departure_hour character varying(5),
    dep_place_type character varying(10),
    dep_place character varying(60),
    dep_city character varying(60),
    dep_country_id character varying(2),
    arrival_date date,
    arrival_hour character varying(5),
    arv_place_type character varying(10),
    arv_place character varying(60),
    arv_city character varying(60),
    arv_country_id character varying(2),
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    notes text,
    status character varying(10) DEFAULT 'active'::character varying,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_transports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_transports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_transports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_transports_id_seq OWNED BY logistics_transports.id;


--
-- Name: logistics_transroutes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics_transroutes (
    id integer NOT NULL,
    route_type character varying(20) NOT NULL,
    route_name character varying(60) NOT NULL,
    route_city character varying(50),
    route_country character varying(2) NOT NULL,
    arrival_date date,
    departure_date date,
    transport_id integer NOT NULL,
    route_id integer,
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: logistics_transroutes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_transroutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistics_transroutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_transroutes_id_seq OWNED BY logistics_transroutes.id;


--
-- Name: mentions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mentions (
    id integer NOT NULL,
    mentioner_type character varying(255),
    mentioner_id integer,
    mentionable_type character varying(255),
    mentionable_id integer,
    created_at timestamp without time zone
);


--
-- Name: mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mentions_id_seq OWNED BY mentions.id;


--
-- Name: messenger_message_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messenger_message_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message_id integer NOT NULL,
    is_read boolean DEFAULT false,
    read_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: messenger_message_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE messenger_message_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messenger_message_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE messenger_message_users_id_seq OWNED BY messenger_message_users.id;


--
-- Name: messenger_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messenger_messages (
    id integer NOT NULL,
    message text NOT NULL,
    sender_id integer NOT NULL,
    parent_id integer,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE messenger_messages_id_seq OWNED BY messenger_messages.id;


--
-- Name: network_companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE network_companies (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    title character varying(255),
    company_type character varying(10),
    tel character varying(30),
    fax character varying(30),
    gsm character varying(30),
    voip character varying(30),
    email character varying(100),
    website character varying(255),
    sector character varying(40),
    postcode character varying(5),
    address character varying(255),
    district character varying(100),
    city character varying(100),
    state character varying(100),
    country_id character varying(2),
    status character varying(10) DEFAULT 'active'::character varying,
    branch_id integer NOT NULL,
    patron_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    notes text,
    saler_id integer,
    user_id integer NOT NULL,
    company_no character varying(10),
    slug character varying(50),
    contacts_count integer DEFAULT 0,
    events_count integer DEFAULT 0,
    partners_count integer DEFAULT 0,
    discussions_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: network_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE network_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: network_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE network_companies_id_seq OWNED BY network_companies.id;


--
-- Name: network_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE network_contacts (
    id integer NOT NULL,
    name character varying(50),
    surname character varying(50) NOT NULL,
    company_id integer,
    user_id integer NOT NULL,
    salutation character varying(10),
    email character varying(100),
    tel character varying(30),
    gsm character varying(30),
    jobtitle character varying(100),
    department character varying(60),
    tel2 character varying(30),
    fax character varying(30),
    birthdate date,
    patron_id integer,
    twitter character varying(50),
    facebook character varying(50),
    linkedin character varying(50),
    des character varying(255),
    slug character varying(60),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: network_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE network_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: network_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE network_contacts_id_seq OWNED BY network_contacts.id;


--
-- Name: nicks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nicks (
    id integer NOT NULL,
    name character varying(30),
    patron_id integer NOT NULL,
    nicknamed_id integer,
    nicknamed_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nicks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nicks_id_seq OWNED BY nicks.id;


--
-- Name: nimbos_activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_activities (
    id integer NOT NULL,
    user_id integer NOT NULL,
    target_type character varying(40),
    target_id integer,
    target_name character varying(60),
    patron_id integer NOT NULL,
    branch_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_activities_id_seq OWNED BY nimbos_activities.id;


--
-- Name: nimbos_branches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_branches (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    tel character varying(15),
    fax character varying(15),
    email character varying(40),
    postcode character varying(5),
    address character varying(80),
    district character varying(40),
    city character varying(100),
    state character varying(100),
    country_id character varying(2),
    status character varying(10) DEFAULT 'active'::character varying,
    patron_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_branches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_branches_id_seq OWNED BY nimbos_branches.id;


--
-- Name: nimbos_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_text text NOT NULL,
    commentable_type character varying(40),
    commentable_id integer,
    commenter character varying(1) DEFAULT 'U'::character varying,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_comments_id_seq OWNED BY nimbos_comments.id;


--
-- Name: nimbos_counters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_counters (
    id integer NOT NULL,
    counter_type character varying(255),
    count integer,
    prefix character varying(255),
    suffix character varying(255),
    period integer,
    confirmed boolean,
    patron_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_counters_id_seq OWNED BY nimbos_counters.id;


--
-- Name: nimbos_countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_countries (
    code character varying(2) NOT NULL,
    name character varying(40) NOT NULL,
    telcode character varying(10),
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    locale character varying(20),
    language character varying(10),
    time_zone character varying(255),
    mail_encoding character varying(20),
    domain character varying(10),
    code3 character varying(3),
    currency character varying(20),
    region character varying(100),
    subregion character varying(100),
    listable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_currencies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_currencies (
    code character varying(5) NOT NULL,
    name character varying(40) NOT NULL,
    symbol character varying(1),
    multiplier numeric(5,0) DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_discussions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_discussions (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    target_type character varying(50),
    target_id integer,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_discussions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_discussions_id_seq OWNED BY nimbos_discussions.id;


--
-- Name: nimbos_listheaders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_listheaders (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    i18n_code character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_listheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_listheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_listheaders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_listheaders_id_seq OWNED BY nimbos_listheaders.id;


--
-- Name: nimbos_listitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_listitems (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(50),
    list_code character varying(255),
    i18n_code character varying(255),
    listheader_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_listitems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_listitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_listitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_listitems_id_seq OWNED BY nimbos_listitems.id;


--
-- Name: nimbos_patrons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_patrons (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    title character varying(60),
    email character varying(60) NOT NULL,
    website character varying(60),
    tel character varying(20),
    fax character varying(20),
    gsm character varying(20),
    postcode character varying(5),
    address character varying(60),
    contact_name character varying(40),
    contact_surname character varying(40),
    city character varying(100),
    state character varying(100),
    country_id character varying(2),
    patron_type character varying(20),
    employees character varying(10),
    language character varying(2),
    status character varying(10) DEFAULT 'active'::character varying,
    logo character varying(255),
    patron_token character varying(40),
    time_zone character varying(30),
    district character varying(40),
    currency character varying(10),
    locale character varying(20),
    mail_encoding character varying(20),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_patrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_patrons_id_seq OWNED BY nimbos_patrons.id;


--
-- Name: nimbos_posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL,
    target_type character varying(40),
    target_id integer,
    target_title character varying(255),
    target_url character varying(255),
    is_private boolean DEFAULT false,
    is_syspost boolean DEFAULT false,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_type character varying(40),
    parent_id integer,
    parent_title character varying(255),
    parent_url character varying(255),
    post_action character varying(50),
    channel character varying(50),
    trashed boolean DEFAULT false,
    comments_count integer DEFAULT 0,
    likes_count integer DEFAULT 0
);


--
-- Name: nimbos_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_posts_id_seq OWNED BY nimbos_posts.id;


--
-- Name: nimbos_reminders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_reminders (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    start_date date NOT NULL,
    start_hour character varying(5),
    finish_date date,
    calendar_scope character varying(40),
    description text,
    remindfor_type character varying(100),
    remindfor_id integer,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_reminders_id_seq OWNED BY nimbos_reminders.id;


--
-- Name: nimbos_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_roles_id_seq OWNED BY nimbos_roles.id;


--
-- Name: nimbos_tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_tasks (
    id integer NOT NULL,
    todolist_id integer NOT NULL,
    user_id integer NOT NULL,
    task_text character varying(255) NOT NULL,
    task_code character varying(50),
    i18n_code character varying(50),
    cruser_id integer,
    status character varying(10) DEFAULT 'active'::character varying,
    due_date date,
    closed_date date,
    close_text character varying(255),
    system_task boolean DEFAULT false,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_tasks_id_seq OWNED BY nimbos_tasks.id;


--
-- Name: nimbos_todolists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_todolists (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    todop_type character varying(100),
    todop_id integer,
    patron_id integer NOT NULL,
    tasks_count integer DEFAULT 0,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_todolists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_todolists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_todolists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_todolists_id_seq OWNED BY nimbos_todolists.id;


--
-- Name: nimbos_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_users (
    id integer NOT NULL,
    email character varying(40) NOT NULL,
    password_digest character varying(255),
    salt character varying(255),
    name character varying(40),
    surname character varying(40),
    patron_id integer,
    patron_key character varying(20),
    language character varying(255) DEFAULT 'en'::character varying,
    time_zone character varying(255) DEFAULT 'Eastern Time (US & Canada)'::character varying,
    locale character varying(8),
    region character varying(2),
    user_type character varying(2),
    mail_encoding character varying(20),
    last_login_at timestamp without time zone,
    last_logout_at timestamp without time zone,
    last_activity_at timestamp without time zone,
    activation_state character varying(255),
    activation_token character varying(255),
    activation_token_expires_at timestamp without time zone,
    password_reset_token character varying(255),
    password_reset_email_time timestamp without time zone,
    password_reset_token_expires_at timestamp without time zone,
    failed_logins_count integer,
    lock_expires_at integer,
    role character varying(255),
    avatar character varying(255),
    branch_id integer DEFAULT 0 NOT NULL,
    remember_me_token character varying(255),
    remember_me_token_expires_at character varying(255),
    datetime character varying(255),
    firstuser boolean DEFAULT false,
    user_status character varying(10) DEFAULT 'active'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nimbos_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nimbos_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nimbos_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nimbos_users_id_seq OWNED BY nimbos_users.id;


--
-- Name: nimbos_users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nimbos_users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: operations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operations (
    code character varying(20) NOT NULL,
    name character varying(40) NOT NULL,
    operation_type character varying(20) NOT NULL
);


--
-- Name: packages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE packages (
    id integer NOT NULL,
    pack_type character varying(255) NOT NULL,
    total integer DEFAULT 0,
    dimension1 integer,
    dimension2 integer,
    dimension3 integer,
    brutwg double precision DEFAULT 0,
    netwg double precision DEFAULT 0,
    volume double precision DEFAULT 0,
    lada double precision DEFAULT 0,
    imo character varying(20),
    gtip character varying(20),
    po character varying(20),
    description character varying(200),
    loading_notes character varying(200),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    packed_id integer,
    packed_type character varying(255),
    container_no character varying(40),
    patron_id integer NOT NULL
);


--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE packages_id_seq OWNED BY packages.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE partners (
    id integer NOT NULL,
    company_id integer NOT NULL,
    partner_id integer NOT NULL,
    user_id integer NOT NULL,
    partner_type character varying(20) NOT NULL,
    notes character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patron_id integer
);


--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE partners_id_seq OWNED BY partners.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE patrons (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    title character varying(60),
    email character varying(60) NOT NULL,
    website character varying(60),
    tel character varying(20),
    fax character varying(20),
    gsm character varying(20),
    postcode character varying(5),
    address character varying(60),
    contact_name character varying(40),
    contact_surname character varying(40),
    city_id integer,
    state_id integer,
    country_id character varying(2),
    patron_type character varying(20),
    employees character varying(10),
    language character varying(2),
    status character varying(1) DEFAULT 'A'::character varying,
    logo character varying(255),
    token character varying(40),
    slug character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    time_zone character varying(30),
    district character varying(40),
    currency character varying(10),
    operations character varying(100),
    vehicle_owner boolean DEFAULT false,
    depot_owner boolean DEFAULT false,
    iata_code character varying(30),
    fmc_code character varying(30),
    locale character varying(20),
    mail_encoding character varying(20),
    city character varying(100),
    state character varying(100)
);


--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE patrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE patrons_id_seq OWNED BY patrons.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    staff_id integer NOT NULL,
    payment_date date NOT NULL,
    payment_docno character varying(20),
    payment_price numeric DEFAULT 0,
    price_curr character varying(255) NOT NULL,
    confirmed boolean DEFAULT false,
    confirmer_id integer,
    confirm_date date,
    notes text,
    finunit_id integer,
    payoff_id integer NOT NULL,
    branch_id integer NOT NULL,
    patron_id integer NOT NULL,
    creater_id integer NOT NULL,
    updater_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: payoffs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payoffs (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    payoff_date date NOT NULL,
    staff_id integer NOT NULL,
    payoff_type character varying(20) NOT NULL,
    transport_id integer,
    truck character varying(30),
    vehicle character varying(30),
    voyage character varying(30),
    departure_date date,
    departure_km integer DEFAULT 0,
    departure_place character varying(100),
    arrival_date date,
    arrival_km integer DEFAULT 0,
    arrival_place character varying(100),
    return_date date,
    return_km integer DEFAULT 0,
    return_place character varying(100),
    notes text,
    approved boolean DEFAULT false,
    approved_date date,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    payoff_price numeric DEFAULT 0,
    price_curr numeric DEFAULT 0,
    credit_debit character varying(10),
    slug character varying(30) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: payoffs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payoffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payoffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payoffs_id_seq OWNED BY payoffs.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    user_id integer NOT NULL,
    socialname character varying(30),
    salutation character varying(20),
    gender character varying(1),
    jobtitle character varying(40),
    department character varying(40),
    hometel character varying(15),
    busitel character varying(15),
    exttel character varying(15),
    fax character varying(15),
    gsm character varying(15),
    voip character varying(15),
    website character varying(30),
    postcode character varying(5),
    address character varying(80),
    district character varying(40),
    city_id integer,
    state_id integer,
    country_id character varying(2),
    status character varying(1) DEFAULT 'A'::character varying,
    branch_id integer,
    patron_id integer NOT NULL,
    twitter character varying(30),
    facebook character varying(50),
    linkedin character varying(50),
    manager_id integer,
    person_no integer,
    start_date date,
    citizen_no character varying(20),
    birth_date date,
    nation character varying(2),
    avatar character varying(100),
    slug character varying(60),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city character varying(60),
    state character varying(60)
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: personal_people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE personal_people (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    user_id integer NOT NULL,
    socialname character varying(30),
    salutation character varying(20),
    gender character varying(1),
    jobtitle character varying(40),
    department character varying(40),
    hometel character varying(15),
    busitel character varying(15),
    exttel character varying(15),
    fax character varying(15),
    gsm character varying(15),
    voip character varying(15),
    website character varying(30),
    postcode character varying(5),
    address character varying(80),
    district character varying(40),
    city integer,
    state integer,
    country_id character varying(2),
    status character varying(10) DEFAULT 'active'::character varying,
    branch_id integer,
    patron_id integer NOT NULL,
    twitter character varying(30),
    facebook character varying(50),
    linkedin character varying(50),
    manager_id integer,
    person_no integer,
    start_date date,
    citizen_no character varying(20),
    birth_date date,
    nation character varying(2),
    avatar character varying(100),
    slug character varying(60),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: personal_people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE personal_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE personal_people_id_seq OWNED BY personal_people.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    name character varying(50),
    code character varying(20),
    place_type character varying(4),
    district character varying(30),
    postcode character varying(5),
    address character varying(100),
    city_id integer,
    country_id character varying(2),
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    description character varying(250),
    slug character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    reference character varying(30) NOT NULL,
    operation character varying(255),
    direction character varying(255),
    incoterm character varying(20),
    paid_at character varying(20),
    load_type character varying(1),
    branch_id integer NOT NULL,
    agent_id integer,
    user_id integer NOT NULL,
    load_place_id integer,
    load_date timestamp without time zone,
    unload_place_id integer,
    unload_date timestamp without time zone,
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    agent_price numeric DEFAULT 0.0,
    agent_curr character varying(3),
    waybill_no character varying(30),
    waybill_date date,
    status character varying(4) DEFAULT 'A'::character varying,
    report_date date,
    stage character varying(4),
    stage_date timestamp without time zone,
    ref_no1 character varying(20),
    ref_type1 character varying(2),
    ref_no2 character varying(20),
    ref_type2 character varying(2),
    ref_no3 character varying(20),
    ref_type3 character varying(2),
    ref_no4 character varying(20),
    ref_type4 character varying(2),
    slug character varying(40),
    notes character varying(500),
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    loadings_count integer DEFAULT 0,
    transports_count integer DEFAULT 0,
    documents_count integer DEFAULT 0,
    description character varying(255)
);


--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message character varying(300),
    target_type character varying(40),
    target_id integer,
    target_name character varying(40),
    post_type character varying(2),
    is_private boolean DEFAULT false,
    is_syspost boolean DEFAULT false,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: queue_classic_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE queue_classic_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: queue_classic_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE queue_classic_jobs_id_seq OWNED BY queue_classic_jobs.id;


--
-- Name: reminders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reminders (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    start_date date NOT NULL,
    start_hour character varying(5),
    finish_date date,
    calendar_scope character varying(40),
    description text,
    remindfor_type character varying(100),
    remindfor_id integer,
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reminders_id_seq OWNED BY reminders.id;


--
-- Name: rentals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rentals (
    id integer NOT NULL,
    referans character varying(20) NOT NULL,
    rent_direction character varying(1),
    vehicle character varying(50),
    vehicle_class character varying(20),
    vehicle_type character varying(20),
    vehicle_brand character varying(50),
    vehicle_model character varying(20),
    vehicle_firstkm integer DEFAULT 0,
    vehicle_lastkm integer DEFAULT 0,
    operator character varying(50),
    fuel_flag boolean DEFAULT false,
    start_date date NOT NULL,
    finish_date date NOT NULL,
    rent_status character varying(1),
    company_id integer NOT NULL,
    rent_price numeric,
    price_curr character varying(1),
    patron_id integer NOT NULL,
    user_id integer,
    notes character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rentals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rentals_id_seq OWNED BY rentals.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roster_searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roster_searches (
    id integer NOT NULL,
    model character varying(30) NOT NULL,
    reference character varying(40),
    user_id integer NOT NULL,
    patron_id integer NOT NULL,
    search_type character varying(10) DEFAULT 'detailed'::character varying,
    filter hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roster_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roster_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roster_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roster_searches_id_seq OWNED BY roster_searches.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    model character varying(60),
    reference character varying(40),
    operation character varying(20),
    direction character varying(1),
    paid_at character varying(20),
    load_type character varying(1),
    agent_id integer,
    user_id integer NOT NULL,
    branch_id integer,
    docdate1 date,
    docdate2 date,
    saler_id integer,
    driver_id integer,
    company_id integer,
    transporter_id integer,
    status character varying(4),
    report_date1 date,
    report_date2 date,
    country_id character varying(2),
    city_id integer,
    searched boolean DEFAULT true,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    filter hstore
);


--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


--
-- Name: ships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ships (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    owner_id integer,
    country character varying(15),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ships_id_seq OWNED BY ships.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    code character varying(10),
    telcode character varying(10),
    country_id character varying(2),
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    slug character varying(40)
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: surveyor_betausers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE surveyor_betausers (
    id integer NOT NULL,
    email character varying(255),
    name character varying(100),
    company character varying(100),
    phone character varying(30),
    country character varying(20),
    ipaddr character varying(20),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: surveyor_betausers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE surveyor_betausers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveyor_betausers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE surveyor_betausers_id_seq OWNED BY surveyor_betausers.id;


--
-- Name: surveyor_feedbacks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE surveyor_feedbacks (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(100),
    msg character varying(500),
    user_id integer,
    patron_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: surveyor_feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE surveyor_feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveyor_feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE surveyor_feedbacks_id_seq OWNED BY surveyor_feedbacks.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    task_text character varying(1000) NOT NULL,
    task_code character varying(50),
    i18n_code character varying(50),
    cruser_id integer,
    status character varying(1) DEFAULT 'A'::character varying,
    due_date date,
    closed_date date,
    close_text character varying(255),
    system_task boolean DEFAULT false,
    patron_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    todolist_id integer NOT NULL
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    name character varying(40),
    patron_id integer NOT NULL,
    slug character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: todolists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE todolists (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    todop_type character varying(100),
    todop_id integer,
    patron_id integer NOT NULL,
    tasks_count integer DEFAULT 0,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: todolists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE todolists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: todolists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE todolists_id_seq OWNED BY todolists.id;


--
-- Name: transnodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transnodes (
    id integer NOT NULL,
    position_id integer NOT NULL,
    trans_method character varying(20) NOT NULL,
    voyage character varying(20),
    vessel character varying(20),
    truck character varying(20),
    driver character varying(50),
    transporter_id integer,
    forwarder_id integer,
    supplier_id integer,
    departure_place character varying(50),
    departure_date timestamp without time zone,
    departured_date date,
    arrival_place character varying(50),
    arrival_date timestamp without time zone,
    arrived_date date,
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    ticket_no character varying(20),
    ticket_date date,
    doc1_no character varying(20),
    doc2_no character varying(20),
    doc3_no character varying(20),
    doc4_no character varying(20),
    notes character varying(500),
    departure_coun character varying(2),
    arrival_coun character varying(2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    patron_id integer NOT NULL,
    transport_id integer NOT NULL
);


--
-- Name: transnodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transnodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transnodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transnodes_id_seq OWNED BY transnodes.id;


--
-- Name: transports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transports (
    id integer NOT NULL,
    position_id integer,
    trans_method character varying(20),
    vessel character varying(20),
    truck character varying(20),
    voyage character varying(20),
    vagon character varying(255),
    waybill_no character varying(40),
    waybill_date date,
    driver_name character varying(60),
    driver_id integer,
    owner_id integer,
    supplier_id integer,
    dep_place_id integer,
    dep_city_id integer,
    dep_country_id character varying(2),
    arv_place_id integer,
    arv_city_id integer,
    arv_country_id character varying(2),
    departure_date date NOT NULL,
    departure_hour character varying(5),
    arrival_date date NOT NULL,
    arrival_hour character varying(5),
    freight_price numeric DEFAULT 0,
    freight_curr character varying(5),
    notes character varying(1000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    waybill_flag boolean DEFAULT false,
    user_id integer NOT NULL,
    dep_place_type character varying(1),
    arv_place_type character varying(1),
    patron_id integer NOT NULL,
    dep_place character varying(60),
    arv_place character varying(60),
    dep_city character varying(100),
    arv_city character varying(100),
    status character varying(1) DEFAULT 'A'::character varying,
    branch_id integer
);


--
-- Name: transports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transports_id_seq OWNED BY transports.id;


--
-- Name: transroutes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transroutes (
    id integer NOT NULL,
    route_type character varying(20) NOT NULL,
    route_name character varying(60) NOT NULL,
    route_city character varying(50),
    route_country character varying(2) NOT NULL,
    arrival_date date,
    departure_date date,
    route_id integer,
    longitude double precision,
    latitude double precision,
    gmaps boolean,
    transport_id integer NOT NULL,
    patron_id integer NOT NULL,
    notes character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transroutes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transroutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transroutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transroutes_id_seq OWNED BY transroutes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(40) NOT NULL,
    crypted_password character varying(255),
    salt character varying(255),
    name character varying(40),
    surname character varying(40),
    patron_id integer,
    patron_key character varying(20),
    language character varying(255) DEFAULT 'en'::character varying,
    time_zone character varying(255) DEFAULT 'Eastern Time (US & Canada)'::character varying,
    locale character varying(8),
    region character varying(2),
    user_type character varying(2),
    mail_encoding character varying(20),
    last_login_at timestamp without time zone,
    last_logout_at timestamp without time zone,
    last_activity_at timestamp without time zone,
    activation_state character varying(255),
    activation_token character varying(255),
    activation_token_expires_at timestamp without time zone,
    password_reset_token character varying(255),
    password_reset_email_time timestamp without time zone,
    password_reset_token_expires_at timestamp without time zone,
    failed_logins_count integer,
    lock_expires_at integer,
    role character varying(255),
    avatar character varying(255),
    slug character varying(255),
    branch_id integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    remember_me_token character varying(255) DEFAULT NULL::character varying,
    remember_me_token_expires_at timestamp without time zone,
    user_status character varying(1) DEFAULT 'A'::character varying,
    firstuser boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vehicles (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    vehicle_class character varying(20),
    vehicle_type character varying(20),
    brand character varying(20),
    model character varying(50),
    model_year integer,
    patron_id integer NOT NULL,
    owner character varying(50),
    vehicle_price numeric DEFAULT 0,
    price_curr character varying(5),
    buying_date date,
    fuel_capacity integer,
    fuel_capacity2 integer,
    fuel_type character varying(10),
    tire_size character varying(2),
    link_type character varying(2),
    sat_no character varying(20),
    longitude double precision,
    latitude double precision,
    slug character varying(20),
    notes character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    vehicle_status character varying(20),
    motor_number character varying(50)
);


--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vehicles_id_seq OWNED BY vehicles.id;


--
-- Name: vessels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vessels (
    id integer NOT NULL,
    name character varying(40),
    vesseltype character varying(40),
    owner character varying(60),
    vesselflag character varying(2),
    teu integer,
    imo character varying(30),
    bodytype character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vessels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vessels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vessels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vessels_id_seq OWNED BY vessels.id;


--
-- Name: waybills; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE waybills (
    id integer NOT NULL,
    reference character varying(40),
    waybill_type character varying(1),
    copy_flag character varying(1),
    waybill_page character varying(4),
    waybillable_type character varying(40),
    waybillable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: waybills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE waybills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: waybills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE waybills_id_seq OWNED BY waybills.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY arrivals ALTER COLUMN id SET DEFAULT nextval('arrivals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY arsiv_documents ALTER COLUMN id SET DEFAULT nextval('arsiv_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY arsiv_junks ALTER COLUMN id SET DEFAULT nextval('arsiv_junks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY assetim_ware_actions ALTER COLUMN id SET DEFAULT nextval('assetim_ware_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY assetim_wares ALTER COLUMN id SET DEFAULT nextval('assetim_wares_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY banks ALTER COLUMN id SET DEFAULT nextval('banks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY betausers ALTER COLUMN id SET DEFAULT nextval('betausers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blogger_articles ALTER COLUMN id SET DEFAULT nextval('blogger_articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cases ALTER COLUMN id SET DEFAULT nextval('cases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY containers ALTER COLUMN id SET DEFAULT nextval('containers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY costs ALTER COLUMN id SET DEFAULT nextval('costs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currates ALTER COLUMN id SET DEFAULT nextval('currates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY departures ALTER COLUMN id SET DEFAULT nextval('departures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY findocs ALTER COLUMN id SET DEFAULT nextval('findocs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY finunits ALTER COLUMN id SET DEFAULT nextval('finunits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fleet_vehicles ALTER COLUMN id SET DEFAULT nextval('fleet_vehicles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY follows ALTER COLUMN id SET DEFAULT nextval('follows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fuels ALTER COLUMN id SET DEFAULT nextval('fuels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY helpdesk_ticket_actions ALTER COLUMN id SET DEFAULT nextval('helpdesk_ticket_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY helpdesk_tickets ALTER COLUMN id SET DEFAULT nextval('helpdesk_tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invoitems ALTER COLUMN id SET DEFAULT nextval('invoitems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY journals ALTER COLUMN id SET DEFAULT nextval('journals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY junks ALTER COLUMN id SET DEFAULT nextval('junks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listheaders ALTER COLUMN id SET DEFAULT nextval('listheaders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listitems ALTER COLUMN id SET DEFAULT nextval('listitems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY loadings ALTER COLUMN id SET DEFAULT nextval('loadings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_arrivals ALTER COLUMN id SET DEFAULT nextval('logistics_arrivals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_containers ALTER COLUMN id SET DEFAULT nextval('logistics_containers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_departures ALTER COLUMN id SET DEFAULT nextval('logistics_departures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_loadings ALTER COLUMN id SET DEFAULT nextval('logistics_loadings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_packages ALTER COLUMN id SET DEFAULT nextval('logistics_packages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_positions ALTER COLUMN id SET DEFAULT nextval('logistics_positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_transports ALTER COLUMN id SET DEFAULT nextval('logistics_transports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logistics_transroutes ALTER COLUMN id SET DEFAULT nextval('logistics_transroutes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mentions ALTER COLUMN id SET DEFAULT nextval('mentions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY messenger_message_users ALTER COLUMN id SET DEFAULT nextval('messenger_message_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY messenger_messages ALTER COLUMN id SET DEFAULT nextval('messenger_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY network_companies ALTER COLUMN id SET DEFAULT nextval('network_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY network_contacts ALTER COLUMN id SET DEFAULT nextval('network_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nicks ALTER COLUMN id SET DEFAULT nextval('nicks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_activities ALTER COLUMN id SET DEFAULT nextval('nimbos_activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_branches ALTER COLUMN id SET DEFAULT nextval('nimbos_branches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_comments ALTER COLUMN id SET DEFAULT nextval('nimbos_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_counters ALTER COLUMN id SET DEFAULT nextval('nimbos_counters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_discussions ALTER COLUMN id SET DEFAULT nextval('nimbos_discussions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_listheaders ALTER COLUMN id SET DEFAULT nextval('nimbos_listheaders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_listitems ALTER COLUMN id SET DEFAULT nextval('nimbos_listitems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_patrons ALTER COLUMN id SET DEFAULT nextval('nimbos_patrons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_posts ALTER COLUMN id SET DEFAULT nextval('nimbos_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_reminders ALTER COLUMN id SET DEFAULT nextval('nimbos_reminders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_roles ALTER COLUMN id SET DEFAULT nextval('nimbos_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_tasks ALTER COLUMN id SET DEFAULT nextval('nimbos_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_todolists ALTER COLUMN id SET DEFAULT nextval('nimbos_todolists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nimbos_users ALTER COLUMN id SET DEFAULT nextval('nimbos_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY packages ALTER COLUMN id SET DEFAULT nextval('packages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY partners ALTER COLUMN id SET DEFAULT nextval('partners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY patrons ALTER COLUMN id SET DEFAULT nextval('patrons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY payoffs ALTER COLUMN id SET DEFAULT nextval('payoffs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY personal_people ALTER COLUMN id SET DEFAULT nextval('personal_people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY queue_classic_jobs ALTER COLUMN id SET DEFAULT nextval('queue_classic_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reminders ALTER COLUMN id SET DEFAULT nextval('reminders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rentals ALTER COLUMN id SET DEFAULT nextval('rentals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roster_searches ALTER COLUMN id SET DEFAULT nextval('roster_searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ships ALTER COLUMN id SET DEFAULT nextval('ships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY surveyor_betausers ALTER COLUMN id SET DEFAULT nextval('surveyor_betausers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY surveyor_feedbacks ALTER COLUMN id SET DEFAULT nextval('surveyor_feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY todolists ALTER COLUMN id SET DEFAULT nextval('todolists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transnodes ALTER COLUMN id SET DEFAULT nextval('transnodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transports ALTER COLUMN id SET DEFAULT nextval('transports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transroutes ALTER COLUMN id SET DEFAULT nextval('transroutes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vehicles ALTER COLUMN id SET DEFAULT nextval('vehicles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vessels ALTER COLUMN id SET DEFAULT nextval('vessels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY waybills ALTER COLUMN id SET DEFAULT nextval('waybills_id_seq'::regclass);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: arrivals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY arrivals
    ADD CONSTRAINT arrivals_pkey PRIMARY KEY (id);


--
-- Name: arsiv_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY arsiv_documents
    ADD CONSTRAINT arsiv_documents_pkey PRIMARY KEY (id);


--
-- Name: arsiv_junks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY arsiv_junks
    ADD CONSTRAINT arsiv_junks_pkey PRIMARY KEY (id);


--
-- Name: assetim_ware_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assetim_ware_actions
    ADD CONSTRAINT assetim_ware_actions_pkey PRIMARY KEY (id);


--
-- Name: assetim_wares_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assetim_wares
    ADD CONSTRAINT assetim_wares_pkey PRIMARY KEY (id);


--
-- Name: banks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: betausers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY betausers
    ADD CONSTRAINT betausers_pkey PRIMARY KEY (id);


--
-- Name: blogger_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blogger_articles
    ADD CONSTRAINT blogger_articles_pkey PRIMARY KEY (id);


--
-- Name: branches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: cases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: containers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY containers
    ADD CONSTRAINT containers_pkey PRIMARY KEY (id);


--
-- Name: costs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY costs
    ADD CONSTRAINT costs_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (code);


--
-- Name: currates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY currates
    ADD CONSTRAINT currates_pkey PRIMARY KEY (id);


--
-- Name: currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (code);


--
-- Name: departures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY departures
    ADD CONSTRAINT departures_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: findocs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY findocs
    ADD CONSTRAINT findocs_pkey PRIMARY KEY (id);


--
-- Name: finunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY finunits
    ADD CONSTRAINT finunits_pkey PRIMARY KEY (id);


--
-- Name: fleet_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fleet_vehicles
    ADD CONSTRAINT fleet_vehicles_pkey PRIMARY KEY (id);


--
-- Name: follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: fuels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fuels
    ADD CONSTRAINT fuels_pkey PRIMARY KEY (id);


--
-- Name: helpdesk_ticket_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY helpdesk_ticket_actions
    ADD CONSTRAINT helpdesk_ticket_actions_pkey PRIMARY KEY (id);


--
-- Name: helpdesk_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY helpdesk_tickets
    ADD CONSTRAINT helpdesk_tickets_pkey PRIMARY KEY (id);


--
-- Name: invoitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invoitems
    ADD CONSTRAINT invoitems_pkey PRIMARY KEY (id);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: junks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY junks
    ADD CONSTRAINT junks_pkey PRIMARY KEY (id);


--
-- Name: likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: listheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listheaders
    ADD CONSTRAINT listheaders_pkey PRIMARY KEY (id);


--
-- Name: listitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listitems
    ADD CONSTRAINT listitems_pkey PRIMARY KEY (id);


--
-- Name: loadings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY loadings
    ADD CONSTRAINT loadings_pkey PRIMARY KEY (id);


--
-- Name: logistics_arrivals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_arrivals
    ADD CONSTRAINT logistics_arrivals_pkey PRIMARY KEY (id);


--
-- Name: logistics_containers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_containers
    ADD CONSTRAINT logistics_containers_pkey PRIMARY KEY (id);


--
-- Name: logistics_departures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_departures
    ADD CONSTRAINT logistics_departures_pkey PRIMARY KEY (id);


--
-- Name: logistics_loadings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_loadings
    ADD CONSTRAINT logistics_loadings_pkey PRIMARY KEY (id);


--
-- Name: logistics_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_packages
    ADD CONSTRAINT logistics_packages_pkey PRIMARY KEY (id);


--
-- Name: logistics_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_positions
    ADD CONSTRAINT logistics_positions_pkey PRIMARY KEY (id);


--
-- Name: logistics_transports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_transports
    ADD CONSTRAINT logistics_transports_pkey PRIMARY KEY (id);


--
-- Name: logistics_transroutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics_transroutes
    ADD CONSTRAINT logistics_transroutes_pkey PRIMARY KEY (id);


--
-- Name: mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mentions
    ADD CONSTRAINT mentions_pkey PRIMARY KEY (id);


--
-- Name: messenger_message_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messenger_message_users
    ADD CONSTRAINT messenger_message_users_pkey PRIMARY KEY (id);


--
-- Name: messenger_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);


--
-- Name: network_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY network_companies
    ADD CONSTRAINT network_companies_pkey PRIMARY KEY (id);


--
-- Name: network_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY network_contacts
    ADD CONSTRAINT network_contacts_pkey PRIMARY KEY (id);


--
-- Name: nicks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nicks
    ADD CONSTRAINT nicks_pkey PRIMARY KEY (id);


--
-- Name: nimbos_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_activities
    ADD CONSTRAINT nimbos_activities_pkey PRIMARY KEY (id);


--
-- Name: nimbos_branches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_branches
    ADD CONSTRAINT nimbos_branches_pkey PRIMARY KEY (id);


--
-- Name: nimbos_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_comments
    ADD CONSTRAINT nimbos_comments_pkey PRIMARY KEY (id);


--
-- Name: nimbos_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_counters
    ADD CONSTRAINT nimbos_counters_pkey PRIMARY KEY (id);


--
-- Name: nimbos_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_countries
    ADD CONSTRAINT nimbos_countries_pkey PRIMARY KEY (code);


--
-- Name: nimbos_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_currencies
    ADD CONSTRAINT nimbos_currencies_pkey PRIMARY KEY (code);


--
-- Name: nimbos_discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_discussions
    ADD CONSTRAINT nimbos_discussions_pkey PRIMARY KEY (id);


--
-- Name: nimbos_listheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_listheaders
    ADD CONSTRAINT nimbos_listheaders_pkey PRIMARY KEY (id);


--
-- Name: nimbos_listitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_listitems
    ADD CONSTRAINT nimbos_listitems_pkey PRIMARY KEY (id);


--
-- Name: nimbos_patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_patrons
    ADD CONSTRAINT nimbos_patrons_pkey PRIMARY KEY (id);


--
-- Name: nimbos_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_posts
    ADD CONSTRAINT nimbos_posts_pkey PRIMARY KEY (id);


--
-- Name: nimbos_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_reminders
    ADD CONSTRAINT nimbos_reminders_pkey PRIMARY KEY (id);


--
-- Name: nimbos_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_roles
    ADD CONSTRAINT nimbos_roles_pkey PRIMARY KEY (id);


--
-- Name: nimbos_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_tasks
    ADD CONSTRAINT nimbos_tasks_pkey PRIMARY KEY (id);


--
-- Name: nimbos_todolists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_todolists
    ADD CONSTRAINT nimbos_todolists_pkey PRIMARY KEY (id);


--
-- Name: nimbos_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nimbos_users
    ADD CONSTRAINT nimbos_users_pkey PRIMARY KEY (id);


--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payoffs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payoffs
    ADD CONSTRAINT payoffs_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: personal_people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personal_people
    ADD CONSTRAINT personal_people_pkey PRIMARY KEY (id);


--
-- Name: pk_operations; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT pk_operations PRIMARY KEY (code);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: queue_classic_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY queue_classic_jobs
    ADD CONSTRAINT queue_classic_jobs_pkey PRIMARY KEY (id);


--
-- Name: reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reminders
    ADD CONSTRAINT reminders_pkey PRIMARY KEY (id);


--
-- Name: rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roster_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roster_searches
    ADD CONSTRAINT roster_searches_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: ships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ships
    ADD CONSTRAINT ships_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: surveyor_betausers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY surveyor_betausers
    ADD CONSTRAINT surveyor_betausers_pkey PRIMARY KEY (id);


--
-- Name: surveyor_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY surveyor_feedbacks
    ADD CONSTRAINT surveyor_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: todolists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY todolists
    ADD CONSTRAINT todolists_pkey PRIMARY KEY (id);


--
-- Name: transnodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transnodes
    ADD CONSTRAINT transnodes_pkey PRIMARY KEY (id);


--
-- Name: transports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transports
    ADD CONSTRAINT transports_pkey PRIMARY KEY (id);


--
-- Name: transroutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transroutes
    ADD CONSTRAINT transroutes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: vessels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vessels
    ADD CONSTRAINT vessels_pkey PRIMARY KEY (id);


--
-- Name: waybills_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY waybills
    ADD CONSTRAINT waybills_pkey PRIMARY KEY (id);


--
-- Name: fk_followables; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_followables ON follows USING btree (followable_id, followable_type);


--
-- Name: fk_follows; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_follows ON follows USING btree (follower_id, follower_type);


--
-- Name: fk_likeables; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_likeables ON likes USING btree (likeable_id, likeable_type);


--
-- Name: fk_likes; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_likes ON likes USING btree (liker_id, liker_type);


--
-- Name: fk_mentionables; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_mentionables ON mentions USING btree (mentionable_id, mentionable_type);


--
-- Name: fk_mentions; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_mentions ON mentions USING btree (mentioner_id, mentioner_type);


--
-- Name: idx_qc_on_name_only_unlocked; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_qc_on_name_only_unlocked ON queue_classic_jobs USING btree (q_name, id) WHERE (locked_at IS NULL);


--
-- Name: index_activities_on_branch_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_branch_id_and_patron_id ON activities USING btree (branch_id, patron_id);


--
-- Name: index_activities_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_user_id_and_patron_id ON activities USING btree (user_id, patron_id);


--
-- Name: index_arrivals_on_city_id_and_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arrivals_on_city_id_and_country_id ON arrivals USING btree (city_id, country_id);


--
-- Name: index_arrivals_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arrivals_on_loading_id ON arrivals USING btree (loading_id);


--
-- Name: index_arrivals_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arrivals_on_patron_id ON arrivals USING btree (patron_id);


--
-- Name: index_arsiv_documents_on_documented_type_and_documented_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arsiv_documents_on_documented_type_and_documented_id ON arsiv_documents USING btree (documented_type, documented_id);


--
-- Name: index_arsiv_documents_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arsiv_documents_on_patron_id ON arsiv_documents USING btree (patron_id);


--
-- Name: index_arsiv_junks_on_junked_type_and_junked_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arsiv_junks_on_junked_type_and_junked_id ON arsiv_junks USING btree (junked_type, junked_id);


--
-- Name: index_arsiv_junks_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_arsiv_junks_on_user_id_and_patron_id ON arsiv_junks USING btree (user_id, patron_id);


--
-- Name: index_branches_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_branches_on_patron_id ON branches USING btree (patron_id);


--
-- Name: index_cities_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cities_on_country_id ON cities USING btree (country_id);


--
-- Name: index_comments_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id_and_patron_id ON comments USING btree (user_id, patron_id);


--
-- Name: index_companies_on_lower_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_companies_on_lower_name ON network_companies USING btree (patron_id, lower((name)::text));


--
-- Name: index_companies_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_companies_on_patron_id ON companies USING btree (patron_id);


--
-- Name: index_company_partner_unique; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_company_partner_unique ON partners USING btree (company_id, partner_id, partner_type);


--
-- Name: index_contacts_on_company_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contacts_on_company_id_and_user_id ON contacts USING btree (company_id, user_id);


--
-- Name: index_contacts_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contacts_on_patron_id ON contacts USING btree (patron_id);


--
-- Name: index_containers_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_containers_on_loading_id ON containers USING btree (loading_id);


--
-- Name: index_containers_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_containers_on_patron_id ON containers USING btree (patron_id);


--
-- Name: index_costable_costs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_costable_costs ON costs USING btree (costable_type, costable_id);


--
-- Name: index_costs_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_costs_on_patron_id ON costs USING btree (patron_id);


--
-- Name: index_countries_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_countries_on_slug ON countries USING btree (slug);


--
-- Name: index_departures_on_city_id_and_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_departures_on_city_id_and_country_id ON departures USING btree (city_id, country_id);


--
-- Name: index_departures_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_departures_on_loading_id ON departures USING btree (loading_id);


--
-- Name: index_departures_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_departures_on_patron_id ON departures USING btree (patron_id);


--
-- Name: index_eventable_patron; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_eventable_patron ON events USING btree (patron_id, eventable_type, eventable_id);


--
-- Name: index_findocs_of_patron_branch; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_findocs_of_patron_branch ON findocs USING btree (patron_id, branch_id, docdate, doctype);


--
-- Name: index_finunits_on_patron_id_and_branch_id_and_unit_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_finunits_on_patron_id_and_branch_id_and_unit_type ON finunits USING btree (patron_id, branch_id, unit_type);


--
-- Name: index_fleet_vehicles_on_code_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_fleet_vehicles_on_code_and_patron_id ON fleet_vehicles USING btree (code, patron_id);


--
-- Name: index_fleet_vehicles_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_fleet_vehicles_on_patron_id ON fleet_vehicles USING btree (patron_id);


--
-- Name: index_helpdesk_ticket_actions_on_ticket_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_helpdesk_ticket_actions_on_ticket_id ON helpdesk_ticket_actions USING btree (ticket_id);


--
-- Name: index_invoitems_on_company_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invoitems_on_company_id_and_patron_id ON invoitems USING btree (company_id, patron_id);


--
-- Name: index_invoitems_on_invoice_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invoitems_on_invoice_id_and_patron_id ON invoitems USING btree (invoice_id, patron_id);


--
-- Name: index_journals_on_patron_id_and_journaled_type_and_journaled_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_journals_on_patron_id_and_journaled_type_and_journaled_id ON journals USING btree (patron_id, journaled_type, journaled_id);


--
-- Name: index_junks_on_junked_type_and_junked_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_junks_on_junked_type_and_junked_id ON junks USING btree (junked_type, junked_id);


--
-- Name: index_junks_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_junks_on_user_id_and_patron_id ON junks USING btree (user_id, patron_id);


--
-- Name: index_loadings_on_branch_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_branch_id_and_patron_id ON loadings USING btree (branch_id, patron_id);


--
-- Name: index_loadings_on_company_id_and_load_coun_and_unload_coun; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_company_id_and_load_coun_and_unload_coun ON loadings USING btree (company_id, load_coun, unload_coun);


--
-- Name: index_loadings_on_operation_and_direction; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_operation_and_direction ON loadings USING btree (operation, direction);


--
-- Name: index_loadings_on_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_position_id ON loadings USING btree (position_id);


--
-- Name: index_loadings_on_reference_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_reference_and_patron_id ON loadings USING btree (reference, patron_id);


--
-- Name: index_loadings_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_loadings_on_user_id_and_patron_id ON loadings USING btree (user_id, patron_id);


--
-- Name: index_logistics_arrivals_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_arrivals_on_loading_id ON logistics_arrivals USING btree (loading_id);


--
-- Name: index_logistics_arrivals_on_patron_id_and_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_arrivals_on_patron_id_and_country_id ON logistics_arrivals USING btree (patron_id, country_id);


--
-- Name: index_logistics_containers_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_containers_on_loading_id ON logistics_containers USING btree (loading_id);


--
-- Name: index_logistics_containers_on_name_and_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_logistics_containers_on_name_and_loading_id ON logistics_containers USING btree (name, loading_id);


--
-- Name: index_logistics_departures_on_loading_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_departures_on_loading_id ON logistics_departures USING btree (loading_id);


--
-- Name: index_logistics_departures_on_patron_id_and_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_departures_on_patron_id_and_country_id ON logistics_departures USING btree (patron_id, country_id);


--
-- Name: index_logistics_loadings_on_patron_id_and_branch_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_loadings_on_patron_id_and_branch_id ON logistics_loadings USING btree (patron_id, branch_id);


--
-- Name: index_logistics_loadings_on_patron_id_and_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_loadings_on_patron_id_and_company_id ON logistics_loadings USING btree (patron_id, company_id);


--
-- Name: index_logistics_loadings_on_patron_id_and_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_loadings_on_patron_id_and_position_id ON logistics_loadings USING btree (patron_id, position_id);


--
-- Name: index_logistics_loadings_on_reference_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_logistics_loadings_on_reference_and_patron_id ON logistics_loadings USING btree (reference, patron_id);


--
-- Name: index_logistics_packages_on_loading_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_packages_on_loading_id_and_patron_id ON logistics_packages USING btree (loading_id, patron_id);


--
-- Name: index_logistics_positions_on_patron_id_and_branch_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_positions_on_patron_id_and_branch_id ON logistics_positions USING btree (patron_id, branch_id);


--
-- Name: index_logistics_positions_on_patron_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_positions_on_patron_id_and_user_id ON logistics_positions USING btree (patron_id, user_id);


--
-- Name: index_logistics_positions_on_reference_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_logistics_positions_on_reference_and_patron_id ON logistics_positions USING btree (reference, patron_id);


--
-- Name: index_logistics_transports_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_transports_on_patron_id ON logistics_transports USING btree (patron_id);


--
-- Name: index_logistics_transports_on_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_transports_on_position_id ON logistics_transports USING btree (position_id);


--
-- Name: index_logistics_transports_on_trans_method; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_transports_on_trans_method ON logistics_transports USING btree (trans_method);


--
-- Name: index_logistics_transroutes_on_patron_id_and_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_transroutes_on_patron_id_and_route_id ON logistics_transroutes USING btree (patron_id, route_id);


--
-- Name: index_logistics_transroutes_on_transport_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_logistics_transroutes_on_transport_id ON logistics_transroutes USING btree (transport_id);


--
-- Name: index_network_companies_on_name_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_network_companies_on_name_and_patron_id ON network_companies USING btree (name, patron_id);


--
-- Name: index_network_companies_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_network_companies_on_patron_id ON network_companies USING btree (patron_id);


--
-- Name: index_network_contacts_on_company_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_network_contacts_on_company_id_and_user_id ON network_contacts USING btree (company_id, user_id);


--
-- Name: index_network_contacts_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_network_contacts_on_patron_id ON network_contacts USING btree (patron_id);


--
-- Name: index_nicks_on_nicknamed_type_and_nicknamed_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nicks_on_nicknamed_type_and_nicknamed_id_and_patron_id ON nicks USING btree (nicknamed_type, nicknamed_id, patron_id);


--
-- Name: index_nimbos_activities_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_activities_on_user_id_and_patron_id ON nimbos_activities USING btree (user_id, patron_id);


--
-- Name: index_nimbos_branches_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_branches_on_patron_id ON nimbos_branches USING btree (patron_id);


--
-- Name: index_nimbos_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_roles_on_name ON nimbos_roles USING btree (name);


--
-- Name: index_nimbos_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_roles_on_name_and_resource_type_and_resource_id ON nimbos_roles USING btree (name, resource_type, resource_id);


--
-- Name: index_nimbos_todolists_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_todolists_on_user_id ON nimbos_todolists USING btree (user_id);


--
-- Name: index_nimbos_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_nimbos_users_on_email ON nimbos_users USING btree (email);


--
-- Name: index_nimbos_users_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_users_on_patron_id ON nimbos_users USING btree (patron_id);


--
-- Name: index_nimbos_users_on_remember_me_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_users_on_remember_me_token ON nimbos_users USING btree (remember_me_token);


--
-- Name: index_nimbos_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nimbos_users_roles_on_user_id_and_role_id ON nimbos_users_roles USING btree (user_id, role_id);


--
-- Name: index_on_commentable_patron; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_on_commentable_patron ON comments USING btree (commentable_type, commentable_id, patron_id);


--
-- Name: index_owners_costs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_owners_costs ON costs USING btree (owner_id);


--
-- Name: index_packages_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_packages_on_patron_id ON packages USING btree (patron_id);


--
-- Name: index_packages_parent; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_packages_parent ON packages USING btree (packed_type, packed_id);


--
-- Name: index_partners_on_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_partners_on_company_id ON partners USING btree (company_id);


--
-- Name: index_patrons_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_patrons_on_slug ON patrons USING btree (slug);


--
-- Name: index_payoffs_costs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_payoffs_costs ON costs USING btree (payoff_id);


--
-- Name: index_people_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_people_on_user_id ON people USING btree (user_id);


--
-- Name: index_personal_people_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_personal_people_on_user_id_and_patron_id ON personal_people USING btree (user_id, patron_id);


--
-- Name: index_places_on_city_id_and_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_places_on_city_id_and_country_id ON places USING btree (city_id, country_id);


--
-- Name: index_positions_on_branch_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_positions_on_branch_id_and_patron_id ON positions USING btree (branch_id, patron_id);


--
-- Name: index_positions_on_operation_and_direction; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_positions_on_operation_and_direction ON positions USING btree (operation, direction);


--
-- Name: index_positions_on_reference_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_positions_on_reference_and_patron_id ON positions USING btree (reference, patron_id);


--
-- Name: index_positions_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_positions_on_user_id_and_patron_id ON positions USING btree (user_id, patron_id);


--
-- Name: index_posts_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_posts_on_patron_id ON posts USING btree (patron_id);


--
-- Name: index_posts_on_target_type_and_target_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_posts_on_target_type_and_target_id_and_patron_id ON posts USING btree (target_type, target_id, patron_id);


--
-- Name: index_posts_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_posts_on_user_id_and_patron_id ON posts USING btree (user_id, patron_id);


--
-- Name: index_reminders_on_remindfor_type_and_remindfor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reminders_on_remindfor_type_and_remindfor_id ON reminders USING btree (remindfor_type, remindfor_id);


--
-- Name: index_reminders_on_user_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reminders_on_user_id_and_patron_id ON reminders USING btree (user_id, patron_id);


--
-- Name: index_rentals_on_vehicle_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rentals_on_vehicle_and_patron_id ON rentals USING btree (vehicle, patron_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_roster_searches_on_patron_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roster_searches_on_patron_id_and_user_id ON roster_searches USING btree (patron_id, user_id);


--
-- Name: index_searches_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_searches_on_patron_id ON searches USING btree (patron_id);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_states_on_country_id ON states USING btree (country_id);


--
-- Name: index_teams_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_teams_on_patron_id ON teams USING btree (patron_id);


--
-- Name: index_transnodes_on_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transnodes_on_position_id ON transnodes USING btree (position_id);


--
-- Name: index_transports_on_position_id_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transports_on_position_id_and_patron_id ON transports USING btree (position_id, patron_id);


--
-- Name: index_transports_on_vessel_and_voyage_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transports_on_vessel_and_voyage_and_patron_id ON transports USING btree (vessel, voyage, patron_id);


--
-- Name: index_trucks_costs; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_trucks_costs ON costs USING btree (truck, vehicle);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_patron_id_and_patron_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_patron_id_and_patron_key ON users USING btree (patron_id, patron_key);


--
-- Name: index_users_on_patron_id_and_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_patron_id_and_slug ON users USING btree (patron_id, slug);


--
-- Name: index_users_on_remember_me_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_me_token ON users USING btree (remember_me_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_vehicles_on_code_and_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_vehicles_on_code_and_patron_id ON vehicles USING btree (code, patron_id);


--
-- Name: index_vehicles_on_patron_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vehicles_on_patron_id ON vehicles USING btree (patron_id);


--
-- Name: index_vessels_on_owner; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vessels_on_owner ON vessels USING btree (owner);


--
-- Name: ixdex_on_invoitem_owner_patron; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ixdex_on_invoitem_owner_patron ON invoitems USING btree (invoitem_owner_type, invoitem_owner_id, patron_id);


--
-- Name: unique_nick_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_nick_name ON nicks USING btree (patron_id, name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_tasks; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_tasks ON tasks USING btree (user_id, status, patron_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20120225101201');

INSERT INTO schema_migrations (version) VALUES ('20120225123837');

INSERT INTO schema_migrations (version) VALUES ('20120225182511');

INSERT INTO schema_migrations (version) VALUES ('20120225201316');

INSERT INTO schema_migrations (version) VALUES ('20120225202324');

INSERT INTO schema_migrations (version) VALUES ('20120225205130');

INSERT INTO schema_migrations (version) VALUES ('20120225205608');

INSERT INTO schema_migrations (version) VALUES ('20120225210604');

INSERT INTO schema_migrations (version) VALUES ('20120225212637');

INSERT INTO schema_migrations (version) VALUES ('20120225214006');

INSERT INTO schema_migrations (version) VALUES ('20120225214648');

INSERT INTO schema_migrations (version) VALUES ('20120225215201');

INSERT INTO schema_migrations (version) VALUES ('20120225220023');

INSERT INTO schema_migrations (version) VALUES ('20120225220039');

INSERT INTO schema_migrations (version) VALUES ('20120226093012');

INSERT INTO schema_migrations (version) VALUES ('20120226123611');

INSERT INTO schema_migrations (version) VALUES ('20120226123631');

INSERT INTO schema_migrations (version) VALUES ('20120226132126');

INSERT INTO schema_migrations (version) VALUES ('20120226135453');

INSERT INTO schema_migrations (version) VALUES ('20120226140148');

INSERT INTO schema_migrations (version) VALUES ('20120226140646');

INSERT INTO schema_migrations (version) VALUES ('20120226142249');

INSERT INTO schema_migrations (version) VALUES ('20120226142733');

INSERT INTO schema_migrations (version) VALUES ('20120226142930');

INSERT INTO schema_migrations (version) VALUES ('20120226143249');

INSERT INTO schema_migrations (version) VALUES ('20120226151403');

INSERT INTO schema_migrations (version) VALUES ('20120228100927');

INSERT INTO schema_migrations (version) VALUES ('20120228100928');

INSERT INTO schema_migrations (version) VALUES ('20120228100929');

INSERT INTO schema_migrations (version) VALUES ('20120228110936');

INSERT INTO schema_migrations (version) VALUES ('20120228212313');

INSERT INTO schema_migrations (version) VALUES ('20120303224742');

INSERT INTO schema_migrations (version) VALUES ('20120312195900');

INSERT INTO schema_migrations (version) VALUES ('20120325205527');

INSERT INTO schema_migrations (version) VALUES ('20120328161901');

INSERT INTO schema_migrations (version) VALUES ('20120329203240');

INSERT INTO schema_migrations (version) VALUES ('20120402154746');

INSERT INTO schema_migrations (version) VALUES ('20120412204227');

INSERT INTO schema_migrations (version) VALUES ('20120428212443');

INSERT INTO schema_migrations (version) VALUES ('20120509193506');

INSERT INTO schema_migrations (version) VALUES ('20120510192031');

INSERT INTO schema_migrations (version) VALUES ('20120517220209');

INSERT INTO schema_migrations (version) VALUES ('20120520153126');

INSERT INTO schema_migrations (version) VALUES ('20120531092713');

INSERT INTO schema_migrations (version) VALUES ('20120609134319');

INSERT INTO schema_migrations (version) VALUES ('20120609134822');

INSERT INTO schema_migrations (version) VALUES ('20120627175232');

INSERT INTO schema_migrations (version) VALUES ('20120628164611');

INSERT INTO schema_migrations (version) VALUES ('20120630234350');

INSERT INTO schema_migrations (version) VALUES ('20120713090115');

INSERT INTO schema_migrations (version) VALUES ('20120713112622');

INSERT INTO schema_migrations (version) VALUES ('20120716121303');

INSERT INTO schema_migrations (version) VALUES ('20120718211443');

INSERT INTO schema_migrations (version) VALUES ('20120726093138');

INSERT INTO schema_migrations (version) VALUES ('20120726094605');

INSERT INTO schema_migrations (version) VALUES ('20120726144501');

INSERT INTO schema_migrations (version) VALUES ('20120726144553');

INSERT INTO schema_migrations (version) VALUES ('20120730142055');

INSERT INTO schema_migrations (version) VALUES ('20120731130458');

INSERT INTO schema_migrations (version) VALUES ('20120801103954');

INSERT INTO schema_migrations (version) VALUES ('20120804234154');

INSERT INTO schema_migrations (version) VALUES ('20120814131841');

INSERT INTO schema_migrations (version) VALUES ('20120816125354');

INSERT INTO schema_migrations (version) VALUES ('20120817101059');

INSERT INTO schema_migrations (version) VALUES ('20120817131525');

INSERT INTO schema_migrations (version) VALUES ('20120902114734');

INSERT INTO schema_migrations (version) VALUES ('20120908110934');

INSERT INTO schema_migrations (version) VALUES ('20120908203248');

INSERT INTO schema_migrations (version) VALUES ('20120908203446');

INSERT INTO schema_migrations (version) VALUES ('20120914200123');

INSERT INTO schema_migrations (version) VALUES ('20120914200202');

INSERT INTO schema_migrations (version) VALUES ('20120921205053');

INSERT INTO schema_migrations (version) VALUES ('20120930124227');

INSERT INTO schema_migrations (version) VALUES ('20120930185032');

INSERT INTO schema_migrations (version) VALUES ('20121013102650');

INSERT INTO schema_migrations (version) VALUES ('20121013110915');

INSERT INTO schema_migrations (version) VALUES ('20121020211955');

INSERT INTO schema_migrations (version) VALUES ('20121020213159');

INSERT INTO schema_migrations (version) VALUES ('20121020221210');

INSERT INTO schema_migrations (version) VALUES ('20121021191541');

INSERT INTO schema_migrations (version) VALUES ('20121023135117');

INSERT INTO schema_migrations (version) VALUES ('20121023135601');

INSERT INTO schema_migrations (version) VALUES ('20121023140354');

INSERT INTO schema_migrations (version) VALUES ('20121023143513');

INSERT INTO schema_migrations (version) VALUES ('20121023144156');

INSERT INTO schema_migrations (version) VALUES ('20121023144750');

INSERT INTO schema_migrations (version) VALUES ('20121023192941');

INSERT INTO schema_migrations (version) VALUES ('20121023193216');

INSERT INTO schema_migrations (version) VALUES ('20121023193402');

INSERT INTO schema_migrations (version) VALUES ('20121023193946');

INSERT INTO schema_migrations (version) VALUES ('20121023194728');

INSERT INTO schema_migrations (version) VALUES ('20121023194755');

INSERT INTO schema_migrations (version) VALUES ('20121023195417');

INSERT INTO schema_migrations (version) VALUES ('20121023195913');

INSERT INTO schema_migrations (version) VALUES ('20121023200322');

INSERT INTO schema_migrations (version) VALUES ('20121023200534');

INSERT INTO schema_migrations (version) VALUES ('20121023200928');

INSERT INTO schema_migrations (version) VALUES ('20121023201551');

INSERT INTO schema_migrations (version) VALUES ('20121023202452');

INSERT INTO schema_migrations (version) VALUES ('20121023202640');

INSERT INTO schema_migrations (version) VALUES ('20121023203059');

INSERT INTO schema_migrations (version) VALUES ('20121023203447');

INSERT INTO schema_migrations (version) VALUES ('20121023203844');

INSERT INTO schema_migrations (version) VALUES ('20121024082549');

INSERT INTO schema_migrations (version) VALUES ('20121024083408');

INSERT INTO schema_migrations (version) VALUES ('20121104143430');

INSERT INTO schema_migrations (version) VALUES ('20121108163417');

INSERT INTO schema_migrations (version) VALUES ('20121111183749');

INSERT INTO schema_migrations (version) VALUES ('20121118134232');

INSERT INTO schema_migrations (version) VALUES ('20121120210612');

INSERT INTO schema_migrations (version) VALUES ('20121120211554');

INSERT INTO schema_migrations (version) VALUES ('20121124193614');

INSERT INTO schema_migrations (version) VALUES ('20121130065024');

INSERT INTO schema_migrations (version) VALUES ('20121130142958');

INSERT INTO schema_migrations (version) VALUES ('20121201123124');

INSERT INTO schema_migrations (version) VALUES ('20121201124002');

INSERT INTO schema_migrations (version) VALUES ('20121202115715');

INSERT INTO schema_migrations (version) VALUES ('20121220140543');

INSERT INTO schema_migrations (version) VALUES ('20121220144348');

INSERT INTO schema_migrations (version) VALUES ('20121222224511');

INSERT INTO schema_migrations (version) VALUES ('20121222232813');

INSERT INTO schema_migrations (version) VALUES ('20121224101802');

INSERT INTO schema_migrations (version) VALUES ('20121227163358');

INSERT INTO schema_migrations (version) VALUES ('20121227163741');

INSERT INTO schema_migrations (version) VALUES ('20121228140903');

INSERT INTO schema_migrations (version) VALUES ('20121230102244');

INSERT INTO schema_migrations (version) VALUES ('20121230182247');

INSERT INTO schema_migrations (version) VALUES ('20130122180801');

INSERT INTO schema_migrations (version) VALUES ('20130122203836');

INSERT INTO schema_migrations (version) VALUES ('20130205050943');

INSERT INTO schema_migrations (version) VALUES ('20130212224715');

INSERT INTO schema_migrations (version) VALUES ('20130224114544');

INSERT INTO schema_migrations (version) VALUES ('20130301215731');

INSERT INTO schema_migrations (version) VALUES ('20130316214803');

INSERT INTO schema_migrations (version) VALUES ('20130316215348');

INSERT INTO schema_migrations (version) VALUES ('20130405193444');

INSERT INTO schema_migrations (version) VALUES ('20130622115207');

INSERT INTO schema_migrations (version) VALUES ('20130622115208');

INSERT INTO schema_migrations (version) VALUES ('20130628182417');

INSERT INTO schema_migrations (version) VALUES ('20130629140333');

INSERT INTO schema_migrations (version) VALUES ('20130629140334');

INSERT INTO schema_migrations (version) VALUES ('20130629164002');

INSERT INTO schema_migrations (version) VALUES ('20130709142307');

INSERT INTO schema_migrations (version) VALUES ('20130711113607');

INSERT INTO schema_migrations (version) VALUES ('20130717075413');

INSERT INTO schema_migrations (version) VALUES ('20130723091712');

INSERT INTO schema_migrations (version) VALUES ('20130723091757');

INSERT INTO schema_migrations (version) VALUES ('20130723165205');

INSERT INTO schema_migrations (version) VALUES ('20130818121643');

INSERT INTO schema_migrations (version) VALUES ('20130818121644');

INSERT INTO schema_migrations (version) VALUES ('20130818121645');

INSERT INTO schema_migrations (version) VALUES ('20130818121646');

INSERT INTO schema_migrations (version) VALUES ('20130818121647');

INSERT INTO schema_migrations (version) VALUES ('20130818121648');

INSERT INTO schema_migrations (version) VALUES ('20130818121649');

INSERT INTO schema_migrations (version) VALUES ('20130818121650');

INSERT INTO schema_migrations (version) VALUES ('20130818121651');

INSERT INTO schema_migrations (version) VALUES ('20130818121652');

INSERT INTO schema_migrations (version) VALUES ('20130818121653');

INSERT INTO schema_migrations (version) VALUES ('20130818121654');

INSERT INTO schema_migrations (version) VALUES ('20130818121655');

INSERT INTO schema_migrations (version) VALUES ('20130818121656');

INSERT INTO schema_migrations (version) VALUES ('20130825172553');

INSERT INTO schema_migrations (version) VALUES ('20130825201031');

INSERT INTO schema_migrations (version) VALUES ('20130903173447');

INSERT INTO schema_migrations (version) VALUES ('20130908203352');

INSERT INTO schema_migrations (version) VALUES ('20130912194335');

INSERT INTO schema_migrations (version) VALUES ('20130912194336');

INSERT INTO schema_migrations (version) VALUES ('20130912194337');

INSERT INTO schema_migrations (version) VALUES ('20130912194338');

INSERT INTO schema_migrations (version) VALUES ('20130912194339');

INSERT INTO schema_migrations (version) VALUES ('20130912194340');

INSERT INTO schema_migrations (version) VALUES ('20130912194341');

INSERT INTO schema_migrations (version) VALUES ('20130912194342');

INSERT INTO schema_migrations (version) VALUES ('20130915104207');

INSERT INTO schema_migrations (version) VALUES ('20130915114218');

INSERT INTO schema_migrations (version) VALUES ('20130917035850');

INSERT INTO schema_migrations (version) VALUES ('20130917035851');

INSERT INTO schema_migrations (version) VALUES ('20130921152034');

INSERT INTO schema_migrations (version) VALUES ('20130921152035');

INSERT INTO schema_migrations (version) VALUES ('20130921152051');

INSERT INTO schema_migrations (version) VALUES ('20130921152110');

INSERT INTO schema_migrations (version) VALUES ('20130921152111');

INSERT INTO schema_migrations (version) VALUES ('20130921152112');

INSERT INTO schema_migrations (version) VALUES ('20130921152130');

INSERT INTO schema_migrations (version) VALUES ('20130921152151');

INSERT INTO schema_migrations (version) VALUES ('20130921152152');

INSERT INTO schema_migrations (version) VALUES ('20131011123214');

INSERT INTO schema_migrations (version) VALUES ('20131011123215');