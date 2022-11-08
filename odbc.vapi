/* ODBC.vapi
 *
 * Copyright:
 *   2022 taozuhong <taozuhong@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	taozuhong <taozuhong@gmail.com>
 */

#if WINDOWS
[CCode (cname = "", cheader_filename = "windows.h,sqlext.h")]
#else
[CCode (cname = "", cheader_filename = "sqlext.h")]
#endif
namespace Odbc {
    [CCode (cname = "ODBCVER")]
    public const uint16 VERSION;

    [CCode (cname = "SQL_FALSE")]
    public const uint16 FALSE;

    [CCode (cname = "SQL_TRUE")]
    public const uint16 TRUE;

    [CCode (cname = "SQLHANDLE", has_type_id = false)]
    public struct Handle : long {}

    [CCode (cname = "SQLHWND", has_type_id = false)]
    public struct Hwnd : long {}

    [CCode (cname = "SQLPOINTER", has_type_id = false)]
    public struct Pointer : long {}

    [CCode (cname = "SQL_ALL_CATALOGS")]
    public string CATALOGS;
    [CCode (cname = "SQL_ALL_SCHEMAS")]
    public string SCHEMAS;
    [CCode (cname = "SQL_ALL_TABLE_TYPES")]
    public string TABLE_TYPES;

    // There is no exact ODBC data type that is unsigned long for 32 and 64 bits
    // The constant is defined as UL, so use unsigned long as the cname
    [CCode (cname = "unsigned long", cprefix = "SQL_OV_", has_type_id = false)]
    public enum Version {
        ODBC2,
        ODBC3,
        ODBC3_80,
    }

    [CCode (cname = "SQLRETURN", cprefix = "SQL_", has_type_id = false)]
    public enum Return {
        ERROR,
        INVALID_HANDLE,
        SUCCESS,
        SUCCESS_WITH_INFO,
        STILL_EXECUTING,
        NEED_DATA,
        NO_DATA
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_HANDLE_", has_type_id = false)]
    public enum HandleType {
        ENV,
        DBC,
        STMT,
        DESC,
        SENV
    }

    [CCode (cname = "SQLINTEGER", cprefix = "SQL_ATTR_", has_type_id = false)]
    public enum Attribute {
        OUTPUT_NTS,
        AUTO_IPD,
        METADATA_ID,
        APP_ROW_DESC,
        APP_PARAM_DESC,
        IMP_ROW_DESC,
        IMP_PARAM_DESC,
        CURSOR_SCROLLABLE,
        CURSOR_SENSITIVITY,
        ODBC_VERSION,
        CONNECTION_POOLING,
        CP_MATCH,
        ACCESS_MODE,
        AUTOCOMMIT,
        CONNECTION_TIMEOUT,
        CURRENT_CATALOG,
        DISCONNECT_BEHAVIOR,
        ENLIST_IN_DTC,
        ENLIST_IN_XA,
        LOGIN_TIMEOUT,
        ODBC_CURSORS,
        PACKET_SIZE,
        QUIET_MODE,
        TRACE,
        TRACEFILE,
        TRANSLATE_LIB,
        TRANSLATE_OPTION,
        TXN_ISOLATION,
        CONNECTION_DEAD,
        ANSI_APP,
        ASYNC_ENABLE,
        CONCURRENCY,
        CURSOR_TYPE,
        ENABLE_AUTO_IPD,
        FETCH_BOOKMARK_PTR,
        KEYSET_SIZE,
        MAX_LENGTH,
        MAX_ROWS,
        NOSCAN,
        PARAM_BIND_OFFSET_PTR,
        PARAM_BIND_TYPE,
        PARAM_OPERATION_PTR,
        PARAM_STATUS_PTR,
        PARAMS_PROCESSED_PTR,
        PARAMSET_SIZE,
        QUERY_TIMEOUT,
        RETRIEVE_DATA,
        ROW_BIND_OFFSET_PTR,
        ROW_BIND_TYPE,
        ROW_NUMBER,
        ROW_OPERATION_PTR,
        ROW_STATUS_PTR,
        ROWS_FETCHED_PTR,
        ROW_ARRAY_SIZE,
        SIMULATE_CURSOR,
        USE_BOOKMARKS,
        READONLY,
        WRITE,
        READWRITE_UNKNOWN,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_IS_", has_type_id = false)]
    public enum ValueType {
        POINTER,
        UINTEGER,
        INTEGER,
        USMALLINT,
        SMALLINT,
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_API_", has_type_id = false)]
    public enum Function {
        SQLALLOCCONNECT,
        SQLALLOCENV,
        SQLALLOCHANDLE,
        SQLALLOCSTMT,
        SQLBINDCOL,
        SQLBINDPARAM,
        SQLCANCEL,
        SQLCLOSECURSOR,
        SQLCOLATTRIBUTE,
        SQLCOLUMNS,
        SQLCONNECT,
        SQLCOPYDESC,
        SQLDATASOURCES,
        SQLDESCRIBECOL,
        SQLDISCONNECT,
        SQLENDTRAN,
        SQLERROR,
        SQLEXECDIRECT,
        SQLEXECUTE,
        SQLFETCH,
        SQLFETCHSCROLL,
        SQLFREECONNECT,
        SQLFREEENV,
        SQLFREEHANDLE,
        SQLFREESTMT,
        SQLGETCONNECTATTR,
        SQLGETCONNECTOPTION,
        SQLGETCURSORNAME,
        SQLGETDATA,
        SQLGETDESCFIELD,
        SQLGETDESCREC,
        SQLGETDIAGFIELD,
        SQLGETDIAGREC,
        SQLGETENVATTR,
        SQLGETFUNCTIONS,
        SQLGETINFO,
        SQLGETSTMTATTR,
        SQLGETSTMTOPTION,
        SQLGETTYPEINFO,
        SQLNUMRESULTCOLS,
        SQLPARAMDATA,
        SQLPREPARE,
        SQLPUTDATA,
        SQLROWCOUNT,
        SQLSETCONNECTATTR,
        SQLSETCONNECTOPTION,
        SQLSETCURSORNAME,
        SQLSETDESCFIELD,
        SQLSETDESCREC,
        SQLSETENVATTR,
        SQLSETPARAM,
        SQLSETSTMTATTR,
        SQLSETSTMTOPTION,
        SQLSPECIALCOLUMNS,
        SQLSTATISTICS,
        SQLTABLES,
        SQLTRANSACT,
        SQLALLOCHANDLESTD,
        SQLBULKOPERATIONS,
        SQLBINDPARAMETER,
        SQLBROWSECONNECT,
        SQLCOLATTRIBUTES,
        SQLCOLUMNPRIVILEGES,
        SQLDESCRIBEPARAM,
        SQLDRIVERCONNECT,
        SQLDRIVERS,
        SQLEXTENDEDFETCH,
        SQLFOREIGNKEYS,
        SQLMORERESULTS,
        SQLNATIVESQL,
        SQLNUMPARAMS,
        SQLPARAMOPTIONS,
        SQLPRIMARYKEYS,
        SQLPROCEDURECOLUMNS,
        SQLPROCEDURES,
        SQLSETPOS,
        SQLSETSCROLLOPTIONS,
        SQLTABLEPRIVILEGES,
        ALL_FUNCTIONS,
        LOADBYORDINAL,
        ODBC3_ALL_FUNCTIONS,
        ODBC3_ALL_FUNCTIONS_SIZE,
    }

    [CCode (cname = "SQLINTEGER", cprefix = "SQL_", has_type_id = false)]
    public enum InfoType {
        INFO_FIRST,
        ACTIVE_CONNECTIONS,
        ACTIVE_STATEMENTS,
        DRIVER_HDBC,
        DRIVER_HENV,
        DRIVER_HSTMT,
        DRIVER_NAME,
        DRIVER_VER,
        ODBC_API_CONFORMANCE,
        ODBC_VER,
        ROW_UPDATES,
        ODBC_SAG_CLI_CONFORMANCE,
        ODBC_SQL_CONFORMANCE,
        SERVER_NAME,
        PROCEDURES,
        CONCAT_NULL_BEHAVIOR,
        CURSOR_ROLLBACK_BEHAVIOR,
        EXPRESSIONS_IN_ORDERBY,
        MAX_OWNER_NAME_LEN,
        MAX_PROCEDURE_NAME_LEN,
        MAX_QUALIFIER_NAME_LEN,
        MULT_RESULT_SETS,
        MULTIPLE_ACTIVE_TXN,
        OUTER_JOINS,
        OWNER_TERM,
        PROCEDURE_TERM,
        QUALIFIER_NAME_SEPARATOR,
        QUALIFIER_TERM,
        SCROLL_OPTIONS,
        TABLE_TERM,
        CONVERT_FUNCTIONS,
        NUMERIC_FUNCTIONS,
        STRING_FUNCTIONS,
        SYSTEM_FUNCTIONS,
        TIMEDATE_FUNCTIONS,
        CONVERT_BIGINT,
        CONVERT_BINARY,
        CONVERT_BIT,
        CONVERT_CHAR,
        CONVERT_DATE,
        CONVERT_DECIMAL,
        CONVERT_DOUBLE,
        CONVERT_FLOAT,
        CONVERT_INTEGER,
        CONVERT_LONGVARCHAR,
        CONVERT_NUMERIC,
        CONVERT_REAL,
        CONVERT_SMALLINT,
        CONVERT_TIME,
        CONVERT_TIMESTAMP,
        CONVERT_TINYINT,
        CONVERT_VARBINARY,
        CONVERT_VARCHAR,
        CONVERT_LONGVARBINARY,
        ODBC_SQL_OPT_IEF,
        CORRELATION_NAME,
        NON_NULLABLE_COLUMNS,
        DRIVER_HLIB,
        DRIVER_ODBC_VER,
        LOCK_TYPES,
        POS_OPERATIONS,
        POSITIONED_STATEMENTS,
        BOOKMARK_PERSISTENCE,
        STATIC_SENSITIVITY,
        FILE_USAGE,
        COLUMN_ALIAS,
        GROUP_BY,
        KEYWORDS,
        OWNER_USAGE,
        QUALIFIER_USAGE,
        QUOTED_IDENTIFIER_CASE,
        SUBQUERIES,
        UNION,
        MAX_ROW_SIZE_INCLUDES_LONG,
        MAX_CHAR_LITERAL_LEN,
        TIMEDATE_ADD_INTERVALS,
        TIMEDATE_DIFF_INTERVALS,
        NEED_LONG_DATA_LEN,
        MAX_BINARY_LITERAL_LEN,
        LIKE_ESCAPE_CLAUSE,
        QUALIFIER_LOCATION,
        ACTIVE_ENVIRONMENTS,
        ALTER_DOMAIN,
        SQL_CONFORMANCE,
        DATETIME_LITERALS,
        ASYNC_MODE,
        BATCH_ROW_COUNT,
        BATCH_SUPPORT,
        CATALOG_LOCATION,
        CATALOG_NAME_SEPARATOR,
        CATALOG_TERM,
        CATALOG_USAGE,
        CONVERT_WCHAR,
        CONVERT_INTERVAL_DAY_TIME,
        CONVERT_INTERVAL_YEAR_MONTH,
        CONVERT_WLONGVARCHAR,
        CONVERT_WVARCHAR,
        CREATE_ASSERTION,
        CREATE_CHARACTER_SET,
        CREATE_COLLATION,
        CREATE_DOMAIN,
        CREATE_SCHEMA,
        CREATE_TABLE,
        CREATE_TRANSLATION,
        CREATE_VIEW,
        DRIVER_HDESC,
        DROP_ASSERTION,
        DROP_CHARACTER_SET,
        DROP_COLLATION,
        DROP_DOMAIN,
        DROP_SCHEMA,
        DROP_TABLE,
        DROP_TRANSLATION,
        DROP_VIEW,
        DYNAMIC_CURSOR_ATTRIBUTES1,
        DYNAMIC_CURSOR_ATTRIBUTES2,
        FORWARD_ONLY_CURSOR_ATTRIBUTES1,
        FORWARD_ONLY_CURSOR_ATTRIBUTES2,
        INDEX_KEYWORDS,
        INFO_SCHEMA_VIEWS,
        KEYSET_CURSOR_ATTRIBUTES1,
        KEYSET_CURSOR_ATTRIBUTES2,
        MAX_ASYNC_CONCURRENT_STATEMENTS,
        ODBC_INTERFACE_CONFORMANCE,
        PARAM_ARRAY_ROW_COUNTS,
        PARAM_ARRAY_SELECTS,
        SCHEMA_TERM,
        SCHEMA_USAGE,
        SQL92_DATETIME_FUNCTIONS,
        SQL92_FOREIGN_KEY_DELETE_RULE,
        SQL92_FOREIGN_KEY_UPDATE_RULE,
        SQL92_GRANT,
        SQL92_NUMERIC_VALUE_FUNCTIONS,
        SQL92_PREDICATES,
        SQL92_RELATIONAL_JOIN_OPERATORS,
        SQL92_REVOKE,
        SQL92_ROW_VALUE_CONSTRUCTOR,
        SQL92_STRING_FUNCTIONS,
        SQL92_VALUE_EXPRESSIONS,
        STANDARD_CLI_CONFORMANCE,
        STATIC_CURSOR_ATTRIBUTES1,
        STATIC_CURSOR_ATTRIBUTES2,
        AGGREGATE_FUNCTIONS,
        DDL_INDEX,
        DM_VER,
        INSERT_STATEMENT,
        CONVERT_GUID,
        UNION_STATEMENT,
        INFO_DRIVER_START,
        DTC_TRANSITION_COST,
        OJ_CAPABILITIES,
        INFO_LAST        
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_FETCH_", has_type_id = false)]
    public enum FetchDirection {
        NEXT,
        FIRST,
        LAST,
        PRIOR,
        ABSOLUTE,
        RELATIVE
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum CompletionType {
        COMMIT,
        ROLLBACK
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_DESC_", has_type_id = false)]
    public enum ColumnDescriptor {
        AUTO_UNIQUE_VALUE, // ODBC 1.0
        CASE_SENSITIVE, // ODBC 1.0
        CONCISE_TYPE,   // ODBC 1.0
        COUNT,          // ODBC 1.0
        DISPLAY_SIZE,   // ODBC 1.0
        FIXED_PREC_SCALE,// ODBC 1.0
        LENGTH,         // ODBC 3.0
        NULLABLE,       // ODBC 3.0
        NUM_PREC_RADIX, // ODBC 3.0
        OCTET_LENGTH,   // ODBC 3.0
        PRECISION,      // ODBC 3.0
        SCALE,          // ODBC 3.0
        SEARCHABLE,     // ODBC 1.0
        TYPE,           // ODBC 3.0
        UNNAMED,        // ODBC 3.0
        UNSIGNED,       // ODBC 1.0
        UPDATABLE,      // ODBC 1.0

        BASE_COLUMN_NAME,// ODBC 3.0
        BASE_TABLE_NAME,// ODBC 3.0
        CATALOG_NAME,   // ODBC 3.0
        LABEL,          // ODBC 2.0
        LITERAL_PREFIX, // ODBC 3.0
        LITERAL_SUFFIX, // ODBC 3.0
        LOCAL_TYPE_NAME,// ODBC 3.0
        NAME,           // ODBC 3.0
        SCHEMA_NAME,    // ODBC 2.0
        TABLE_NAME,     // ODBC 2.0
        TYPE_NAME,      // ODBC 1.0
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_C_", has_type_id = false)]
    public enum CDataType {
        BIT,
        CHAR,
        WCHAR,
        STINYINT,
        SSHORT,
        SLONG,
        SBIGINT,
        UTINYINT,
        USHORT,
        ULONG,
        UBIGINT,
        FLOAT,
        DOUBLE,
        NUMERIC,
        DEFAULT,
        DATE,
        TIME,
        TIMESTAMP,
        TYPE_DATE,
        TYPE_TIME,
        TYPE_TIMESTAMP,
        INTERVAL_YEAR,
        INTERVAL_MONTH,
        INTERVAL_DAY,
        INTERVAL_HOUR,
        INTERVAL_MINUTE,
        INTERVAL_SECOND,
        INTERVAL_YEAR_TO_MONTH,
        INTERVAL_DAY_TO_HOUR,
        INTERVAL_DAY_TO_MINUTE,
        INTERVAL_DAY_TO_SECOND,
        INTERVAL_HOUR_TO_MINUTE,
        INTERVAL_HOUR_TO_SECOND,
        INTERVAL_MINUTE_TO_SECOND,
        BINARY,
        BOOKMARK,
        VARBOOKMARK,
        GUID
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum SqlDataType {
        CHAR,
        VARCHAR,
        LONGVARCHAR,
        WCHAR,
        WVARCHAR,
        WLONGVARCHAR,
        DECIMAL,
        NUMERIC,
        SMALLINT,
        INTEGER,
        REAL,
        FLOAT,
        DOUBLE,
        BIT,
        TINYINT,
        BIGINT,
        BINARY,
        VARBINARY,
        LONGVARBINARY,
        DATE,
        TIME,
        DATETIME,
        TIMESTAMP,
        TYPE_DATE,
        TYPE_TIME,
        TYPE_TIMESTAMP,
        INTERVAL_MONTH,
        INTERVAL_YEAR,
        INTERVAL_YEAR_TO_MONTH,
        INTERVAL_DAY,
        INTERVAL_HOUR,
        INTERVAL_MINUTE,
        INTERVAL_SECOND,
        INTERVAL_DAY_TO_HOUR,
        INTERVAL_DAY_TO_MINUTE,
        INTERVAL_DAY_TO_SECOND,
        INTERVAL_HOUR_TO_MINUTE,
        INTERVAL_HOUR_TO_SECOND,
        INTERVAL_MINUTE_TO_SECOND,
        GUID
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_IS_", has_type_id = false)]
    public enum Interval {
        YEAR,
        MONTH,
        DAY,
        HOUR,
        MINUTE,
        SECOND,
        YEAR_TO_MONTH,
        DAY_TO_HOUR,
        DAY_TO_MINUTE,
        DAY_TO_SECOND,
        HOUR_TO_MINUTE,
        HOUR_TO_SECOND,
        MINUTE_TO_SECOND
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_PARAM_", has_type_id = false)]
    public enum InputOutputType {
        TYPE_UNKNOWN,
        INPUT,
        INPUT_OUTPUT,
        OUTPUT,
        INPUT_OUTPUT_STREAM,
        OUTPUT_STREAM
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_DRIVER_", has_type_id = false)]
    public enum DriverCompletion {
        NOPROMPT,
        COMPLETE,
        PROMPT,
        COMPLETE_REQUIRED
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_DIAG_", has_type_id = false)]
    public enum DiagIdentifier {
        RETURNCODE,
        NUMBER,
        ROW_COUNT,
        SQLSTATE,
        NATIVE,
        MESSAGE_TEXT,
        DYNAMIC_FUNCTION,
        CLASS_ORIGIN,
        SUBCLASS_ORIGIN,
        CONNECTION_NAME,
        SERVER_NAME,
        DYNAMIC_FUNCTION_CODE,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_DIAG_", has_type_id = false)]
    public enum DiagDynamicFuncCode {
        DROP_INDEX,
        CREATE_INDEX,
        UNKNOWN_STATEMENT,
        ALTER_DOMAIN,
        ALTER_TABLE,
        CREATE_ASSERTION,
        CALL,
        CREATE_CHARACTER_SET,
        CREATE_COLLATION,
        CREATE_DOMAIN,
        CREATE_SCHEMA,
        CREATE_TABLE,
        CREATE_TRANSLATION,
        CREATE_VIEW,
        DELETE_WHERE,
        DROP_ASSERTION,
        DROP_CHARACTER_SET,
        DROP_COLLATION,
        DROP_DOMAIN,
        DROP_SCHEMA,
        DROP_TABLE,
        DROP_TRANSLATION,
        DROP_VIEW,
        DYNAMIC_DELETE_CURSOR,
        DYNAMIC_UPDATE_CURSOR,
        GRANT,
        INSERT,
        REVOKE,
        SELECT_CURSOR,
        UPDATE_WHERE,        
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_CP_", has_type_id = false)]
    public enum ConnectionPooling {
        DEFAULT,
        OFF,
        ONE_PER_DRIVER,
        ONE_PER_HENV,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_CP_", has_type_id = false)]
    public enum ConnectionPoolingMatch {
        MATCH_DEFAULT,
        STRICT_MATCH,
        RELAXED_MATCH,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_TRANSACTION_", has_type_id = false)]
    public enum IsolationLevel {
        READ_UNCOMMITTED,
        READ_COMMITTED,
        REPEATABLE_READ,
        SERIALIZABLE,
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_CURSOR_", has_type_id = false)]
    public enum CursorType {
        FORWARD_ONLY,
        KEYSET_DRIVEN,
        DYNAMIC,
        STATIC
    }

    [CCode (cname = "SQLUSMALLINT", cprefix = "SQL_CONCUR_", has_type_id = false)]
    public enum ConcurrencyType {
        READ_ONLY,
        LOCK,
        ROWVER,
        VALUES
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum Indicator {
        NULL_DATA,
        DATA_AT_EXEC,
        NTS,
        NO_TOTAL,
        DEFAULT_PARAM,
        COLUMN_IGNORE,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum IndexIndicator
    {
        QUICK,
        ENSURE
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_INDEX_", has_type_id = false)]
    public enum IndexRows
    {
        UNIQUE,
        ALL
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_INDEX_", has_type_id = false)]
    public enum IndexType
    {
        CLUSTERED,
        HASHED,
        OTHER,
        //  BTREE,
        //  CONTENT
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_AM_", has_type_id = false)]
    public enum AsyncMode {
        NONE,
        CONNECTION,
        STATEMENT
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_ASYNC_ENABLE_", has_type_id = false)]
    public enum AsyncEnable {
        OFF,
        ON,
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum FreeOption {
        CLOSE,
        DROP,
        UNBIND,
        RESET_PARAMS
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_PT_", has_type_id = false)]
    public enum RoutineType {
        UNKNOWN,
        PROCEDURE,
        FUNCTION
    }

    [CCode (cname = "SQLSMALLINT", cprefix = "SQL_", has_type_id = false)]
    public enum ForeignAction {
        CASCADE,
        RESTRICT,
        SET_NULL,
        NO_ACTION,
        SET_DEFAULT,
        INITIALLY_DEFERRED,
        INITIALLY_IMMEDIATE,
        NOT_DEFERRABLE
    }

    [CCode (cname = "SQLGUID", has_type_id = false)]
    public struct Guid {
        uint32 Data1;
        uint16 Data2;
        uint16 Data3;
        uint8 Data4[8];
    }

    [CCode (cname = "SQL_NUMERIC_STRUCT", has_type_id = false)]
    public struct NumericStruct {
        uint8 precision;
        int8 scale;
        uint8 sign;
        uint8 val[16];
    }

    [CCode (cname = "SQL_DATE_STRUCT", has_type_id = false)]
    public struct DateStruct {
        int16 year;
        uint16 month;
        uint16 day;
    }

    [CCode (cname = "SQL_TIME_STRUCT", has_type_id = false)]
    struct TimeStruct {
        uint16 hour;
        uint16 minute;
        uint16 second;
    }

    [CCode (cname = "SQL_TIMESTAMP_STRUCT", has_type_id = false)]
    struct TimeStampStruct {
        int16 year;
        uint16 month;
        uint16 day;
        uint16 hour;
        uint16 minute;
        uint16 second;
        uint32 fraction;
    }

    [CCode (cname = "SQL_YEAR_MONTH_STRUCT", has_type_id = false)]
    public struct YearMonthStruct  
    {  
        public uint32 year;
        public uint32 month;
    }
    
    [CCode (cname = "SQL_DAY_SECOND_STRUCT", has_type_id = false)]
    public struct DaySecondStruct  
    {  
        public uint32 day;
        public uint32 hour;
        public uint32 minute;
        public uint32 second;
        public uint32 fraction;
    }

    [CCode (cname = "SQL_INTERVAL_STRUCT", has_type_id = false)]
    public struct IntervalStruct  
    {  
       public Interval interval_type;   
       public int16    interval_sign;  
       [CCode (cname = "intval.year_month")]
       public YearMonthStruct year_month;
       [CCode (cname = "intval.day_second")]
       public DaySecondStruct day_second;
    }

    public bool succeeded (Return ret) {
        return (ret == Return.SUCCESS || ret == Return.SUCCESS_WITH_INFO);
    }

    // Global function -------------------------------------------------------
    [CCode (cname = "SQLAllocHandle")]
    public Return alloc_env(HandleType handle_type, void* input_handle, out Environment output_handle);

    [CCode (cname = "SQLAllocHandle")]
    public Return alloc_dbc(HandleType handle_type, void* input_handle, out Connection output_handle);

    [CCode (cname = "SQLAllocHandle")]
    public Return alloc_desc(HandleType handle_type, void* input_handle, out Descriptor output_handle);

    [CCode (cname = "SQLAllocHandle")]
    public Return alloc_stmt(HandleType handle_type, void* input_handle, out Statement output_handle);

    [Version (since = "3.8")]
    [CCode (cname = "SQLCancelHandle")]
    public Return cancel_handle(HandleType handle_type, void* handle);

    [CCode (cname = "SQLFreeHandle")]
    public Return free_handle(HandleType handle_type, void* handle);

    [CCode (cname = "SQLEndTran")]
    public Return end_transact(HandleType handleType, Handle handle, CompletionType completionType);

    [CCode (cname = "SQLGetDiagRec")]
    public Return get_diag_record(HandleType handleType, Handle handle, int16 recNumber, [CCode(array_length = false)] uint8 sqlState[6], out int nativeError, uint8[] messageText, out int16 textLength);

    [CCode (cname = "SQLGetDiagField")]
    public Return get_diag_field(HandleType handleType, Handle handle, int16 recNumber, DiagIdentifier diagIdentifier, uint8[] diagInfo, out int16 stringLength);

    [CCode (cname = "void", free_function = "SQLFreeEnv", has_type_id = false)]
    [Compact]
    public class Environment {
        public static Environment @new()
        {
            Environment env;
            var retval = alloc_env(HandleType.ENV, null, out env);
            GLib.assert(succeeded(retval));

            return env;
        }

        public Return commit()
        {
            return end_transact(HandleType.ENV, (Handle)this, CompletionType.COMMIT);
        }

        public Return rollback()
        {
            return end_transact(HandleType.ENV, (Handle)this, CompletionType.ROLLBACK);
        } 

        [CCode (cname = "SQLSetEnvAttr")]
        public Return set_attribute (int attribute, void* value, int bufferLength);

        [CCode (cname = "SQLGetEnvAttr")]
        public Return get_attribute(int attribute, void* value, int bufferLength, out int stringLength);

        [CCode (cname = "SQLDrivers")]
        public Return get_drivers (FetchDirection direction, uint8[] driverDescription, out int16 descriptionLength, uint8[] driverAttributes, out int16 attributesLength);

        [CCode(cname = "SQLDataSources")]
        public Return get_data_sources(FetchDirection direction, uint8[] serverName, out int16 nameLength1, uint8[] description, out int16 nameLength2);
    }

    [CCode (cname = "void", free_function = "SQLFreeConnect", has_type_id = false)]
    [Compact]
    public class Connection {
        public static Connection @new(Environment env)
        {
            Connection connection;
            var retval = alloc_dbc(HandleType.DBC, env, out connection);
            GLib.assert(succeeded(retval));

            return connection;
        }

        [CCode (cname = "SQLBrowseConnect")]
        public Return browse_connect(uint8[] inConnectionString, uint8[] outConnectionString, out int16 stringLength); 

        [CCode (cname = "SQLDriverConnect")]
        public Return driver_connect(Hwnd? hwnd, uint8[] inConnectionString, uint8[] outConnectionString, out int16 stringLength, DriverCompletion driverCompletion);

        [CCode (cname = "SQLConnect")]
        public Return connect(uint8[] serverName, uint8[] userName, uint8[] authentication);

        [CCode (cname = "SQLDisconnect")]
        public Return disconnect ();

        [CCode (cname = "SQLGetConnectAttr")]
        public Return get_attribute(int attribute, void* value, int valueLength, out int stringLength);

        [CCode (cname = "SQLSetConnectAttr")]
        public Return set_attribute(int attribute, void* value, int valueLength);

        [CCode (cname = "SQLGetFunctions")]
        public Return get_functions(Function func, uint16* supported);

        [CCode (cname = "SQLGetInfo")]
        public Return get_info(uint16 infoType, void* infoValue, int bufferLength, out int16 stringLength);

        [CCode (cname = "SQLNativeSql")]
        public Return get_native_sql(uint8[] inStatementText, uint8[] outStatementText, out int textLength); 
      
        [CCode (cname = "SQLAllocStmt")]
        public Return alloc_stmt(out Statement statement);

        public Return commit()
        {
            return end_transact(HandleType.DBC, (Handle)this, CompletionType.COMMIT);
        }

        public Return rollback()
        {
            return end_transact(HandleType.DBC, (Handle)this, CompletionType.ROLLBACK);
        }
    }

    [Compact]
    [CCode (cname = "void", free_function="", has_type_id = false)]
    public class Statement {
        public static Statement @new(Connection connection)
        {
            Statement statement;
            var retval = alloc_stmt(HandleType.STMT, connection, out statement);
            GLib.assert(succeeded(retval));

            return statement;
        }

        [CCode (cname = "SQLTables")]
        public Return get_tables(uint8[] catalogName, uint8[] schemaName, uint8[] tableName, uint8[] tableType);
        [CCode (cname = "SQLTablePrivileges")]
        public Return get_table_privileges(uint8[] catalogName, uint8[] schemaName, uint8[] tableName);
        [CCode (cname = "SQLColumns")]
        public Return get_columns(uint8[] catalogName, uint8[] schemaName, uint8[] tableName, uint8[] columnName);    
        [CCode (cname = "SQLColumnPrivileges")]
        public Return get_column_privileges(uint8[] catalogName, uint8[] schemaName, uint8[] tableName, uint8[] columnName);
        [CCode (cname = "SQLForeignKeys")]
        public Return get_foreign_keys(uint8[] pkCatalogName, uint8[] pkSchemaName, uint8[] pkTableName, uint8[] fkCatalogName, uint8[] fkSchemaName, uint8[] fkTableName);
        [CCode (cname = "SQLPrimaryKeys")]
        public Return get_primary_keys(uint8[] catalogName, uint8[] schemaName, uint8[] tableName);
        [CCode (cname = "SQLProcedures")]
        public Return get_procedures(uint8[] catalogName, uint8[] schemaName, uint8[] procName);
        [CCode (cname = "SQLProcedureColumns")]
        public Return get_procedure_columns(uint8[] catalogName, uint8[] schemaName, uint8[] procName, uint8[] columnName);
        [CCode (cname = "SQLStatistics")]
        public Return get_statistics(uint8[] catalogName, uint8[] schemaName, uint8[] tableName, uint16 unique, uint16 reserved);
        [CCode (cname = "SQLSpecialColumns")]
        public Return get_special_columns(uint16 identifierType,uint8[] catalogName, uint8[] schemaName, uint8[] tableName, uint16 scope, uint16 nullable);

        [CCode (cname = "SQLFreeStmt")]
        public Return free(FreeOption option);

        [CCode (cname = "SQLGetStmtAttr")]
        public Return get_attribute(int attribute, void* value, int valueLength, out int stringLength);

        [CCode (cname = "SQLSetStmtAttr")]
        public Return set_attribute(int attribute, void* value, int valueLength);

        [CCode (cname = "SQLCancel")]
        public Return cancel();

        [CCode (cname = "SQLExecDirect")]
        public Return execute_direct(uint8[] statementText);

        [CCode (cname = "SQLPrepare")]
        public Return prepare(uint8[] statementText);

        [CCode (cname = "SQLExecute")]
        public Return execute();

        [CCode (cname = "SQLBulkOperations")]
        public Return bulk(int16 operation);

        [CCode (cname = "SQLFetch")]
        public Return fetch();

        [CCode (cname = "SQLFetchScroll")]
        public Return fetch_scroll(FetchDirection fetchOrientation, ssize_t fetchOffset);

        [CCode (cname = "SQLMoreResults")]
        public Return more_results();

        [CCode (cname = "SQLCloseCursor")]
        public Return close_cursor();

        [CCode (cname = "SQLGetCursorName")]
        public Return get_cursor_name(uint8[] cursorName, out int16 nameLength);

        [CCode (cname = "SQLSetCursorName")]
        public Return set_cursor_name(uint8[] cursorName);

        [CCode (cname = "SQLSetScrollOptions")]
        public Return set_scroll_options(uint16 fConcurrency, ssize_t crowKeyset, uint16 crowRowset);

        [CCode (cname = "SQLSetPos")]
        public Return set_cursor_pos(size_t irow, uint16 fOption, uint16 fLock);

        [CCode (cname = "SQLRowCount")]
        public Return get_row_count(out ssize_t row_count);

        [CCode (cname = "SQLNumResultCols")]
        public Return get_column_count(out int16 column_count);

        [CCode (cname = "SQLDescribeCol")]
        public Return describe_column(uint16 columnNumber, uint8[] columnName, out int16 nameLength, out SqlDataType dataType, out size_t columnSize, out int16 decimalDigits, out int16 nullable);

        [CCode (cname = "SQLColAttribute")]
        public Return column_attribute (uint16 columnNumber, ColumnDescriptor fieldIdentifier, void *characterAttribute, int16 bufferLength, out int16 stringLength, out ssize_t numericAttribute);

        [CCode (cname = "SQLColIntAttribute")]
        public Return column_int_attribute (int columnNumber, ColumnDescriptor fieldIdentifier, int value)
        {
            int16 stringLength;
            ssize_t numericAttribute;
            return column_attribute ((uint16) columnNumber, (uint16) fieldIdentifier,
                &value, 0, out stringLength, out numericAttribute);
        }

        [CCode (cname = "SQLColStringAttribute")]
        public Return column_string_attribute (int columnNumber, ColumnDescriptor fieldIdentifier, uint8[] value)
        {
            int16 stringLength;
            ssize_t numericAttribute;
            return column_attribute ((uint16) columnNumber, (uint16) fieldIdentifier,
                value, (int16) value.length, out stringLength, out numericAttribute);
        }

        [CCode (cname = "SQLGetData")]
        public Return get_data(uint16 columnNumber, CDataType targetType, void * targetValue, ssize_t bufferLength, out ssize_t strLengthOrIndicator);

        [CCode (cname = "SQLNumParams")]
        public Return get_params_count(out int16 pcpar);

        [CCode (cname = "SQLBindCol")]
        public Return bind_column (uint16 columnNumber, CDataType targetType, void *targetValue, ssize_t bufferLength, out ssize_t strLengthOrIndicator);

        [CCode (cname = "SQLBindStringCol")]
        public Return bind_string_column (int columnNumber, uint8[] value, out ssize_t strLengthOrIndicator)
            requires (columnNumber >= 0)
        {
            return bind_column ((uint16) columnNumber, CDataType.CHAR, value, value.length, out strLengthOrIndicator);
        }

        [CCode (cname = "SQLDescribeParam")]
        public Return describe_parameter( uint16 parameterNumber, out int16 dataType, out size_t parameterSize, out int16 decimalDigits, out int16 nullable);  

        [CCode (cname = "SQLParamData")]
        public Return ask_parameter_data(out Pointer value);

        [CCode (cname = "SQLPutData")]
        public Return put_parameter_data(Pointer data, ssize_t lengthIndicator);

        [CCode (cname = "SQLBindParameter")]
        public Return bind_parameter (uint16 parameterNumber,
            InputOutputType inputOutputType, CDataType valueType,
            SqlDataType parameterType, size_t columnSize, int16 decimalDigits,
            void *parameterValue, ssize_t bufferLength, out ssize_t strLengthOrIndicator);

        [CCode (cname = "SQLBindBytesInputParameter")]
        public Return bind_bytes_input_parameter (int number, uchar[] value, out ssize_t strLengthOrIndicator)
            requires (number >= 1)
        {
            return bind_parameter ((uint16) number, InputOutputType.INPUT,
                CDataType.BINARY, SqlDataType.BINARY, value.length, 0, value, value.length,
                out strLengthOrIndicator);
        }

        [CCode (cname = "SQLBindStringInputParameter")]
        public Return bind_string_input_parameter (int number, uint8[] value, out ssize_t strLengthOrIndicator)
            requires (number >= 1)
        {
            return bind_parameter ((uint16) number, InputOutputType.INPUT,
                CDataType.CHAR, SqlDataType.CHAR, value.length, 0, value, value.length,
                out strLengthOrIndicator);
        }

        [CCode (cname = "SQLBindIntInputParameter")]
        public Return bind_int_input_parameter (int number, int *value, out ssize_t strLengthOrIndicator)
            requires (number >= 1)
        {
            return bind_parameter ((uint16) number, InputOutputType.INPUT,
                CDataType.SLONG, SqlDataType.INTEGER, 0, 0, value, 0,
                out strLengthOrIndicator);
        }

        [CCode (cname = "SQLBindDoubleInputParameter")]
        public Return bind_double_input_parameter (int number, double *value, out ssize_t strLengthOrIndicator)
            requires (number >= 1)
        {
            return bind_parameter ((uint16) number, InputOutputType.INPUT,
                CDataType.DOUBLE, SqlDataType.FLOAT, 0, 0, value, 0,
                out strLengthOrIndicator);
        }

        [CCode (cname = "SQLBindDateTimeInputParameter")]
        public Return bind_datetime_input_parameter (int number, uint8[] value, out ssize_t strLengthOrIndicator)
            requires (number >= 1)
        {
            // Three digits for second fractions
            return bind_parameter ((uint16) number, InputOutputType.INPUT,
                CDataType.CHAR, SqlDataType.TYPE_TIMESTAMP, 0, 3, value, value.length,
                out strLengthOrIndicator);
        }

        [CCode (cname = "SQLGetTypeInfo")]
        public Return get_type_info(int16 dataType);
    }

    [CCode (cname = "void", free_function = "", has_type_id = false)]
    [Compact]
    public class Descriptor {
        public static Descriptor @new(Connection connection)
        {
            Descriptor descriptor;
            var retval = alloc_desc(HandleType.DESC, connection, out descriptor);
            GLib.assert(succeeded(retval));

            return descriptor;
        }

        [CCode (cname = "SQLCopyDesc")]
        public Return SQLCopyDesc(out Descriptor targetDesc);

        [CCode (cname = "SQLGetDescField")]
        public Return get_desc_field(int16 recNumber, ColumnDescriptor fieldIdentifier, void* Value, int bufferLength, out int stringLength);
        
        [CCode (cname = "SQLSetDescField")]
        public Return set_desc_field(int16 RecNumber, ColumnDescriptor fieldIdentifier, void* Value, int bufferLength);

        [CCode (cname = "SQLGetDescRec")]
        public Return get_desc_record(int16 recNumber, uint8[] name, out int16 stringLength, out int16 type, out int16 subType, out ssize_t length, out int16 precision, out int16 scale, out int16 nullable);
      
        [CCode (cname = "SQLSetDescRec")]
        public Return set_desc_record(int16 recNumber, int16 type, int16 subType, ssize_t length, int16 precision, int16 scale, void* data, out ssize_t stringLength, out ssize_t indicator);
    }
}