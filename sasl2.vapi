/* Cyrus SASL2 Vala Bindings
 * Copyright 2019 Jelmer Vernooij <jelmer@jelmer.uk>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

[CCode (cheader_filename = "sasl/sasl.h", cprefix="", lower_case_cprefix=""), Compact]
namespace Sasl2 {
	[Compact, CCode(cname="sasl_conn_t", lower_case_cprefix="sasl_", free_function="sasl_dispose")]
	public class Connection {
		public Result client_step(
		    [CCode (array_length_type = "uint")] uint8[] serverin,
		    out Interact prompt_need,
		    [CCode (array_length_type = "uint")] out uint8[] clientout);

		public Result client_start(
			string mechlist, out Interact prompt_need,
			[CCode (array_length_type = "uint")] out uint8[] clientout, out string mech);

		public Result listmech(
		    string user, string prefix, string sep, string suffix,
		    out string result, out uint plen, out uint pcount);

		public Result setprop(Property propnum, void *value);
		public Result getprop(Property propnum, out void *value);

		public Result encode(
		    [CCode (array_length_type = "uint")] uint8[] input,
		    [CCode (array_length_type = "uint")] out uint8[] output);

		public Result decode(
		    [CCode (array_length_type = "uint")] uint8[] input,
		    [CCode (array_length_type = "uint")] out uint8[] output);

		public string errdetail();

		[PrintfFormat]
		public void seterror(uint flags, string format, ...);

		public int idle();
	}

	[CCode (cname = "sasl_errstring")]
	public string errstring(int saslerr, string? langlist, out string outlang);

	[CCode (cname = "sasl_version")]
	public void version(out string implementation, out int version);

	[CCode (cname = "sasl_version_info")]
	public void version_info(
		out string implementation,
		out string version_string,
		out int version_major,
		out int version_minor,
		out int version_step,
		out int version_patch);

	[CCode (cname = "sasl_client_init")]
	public Result client_init([CCode(array_length=false)] Callback[]? callback);

	[CCode (cname = "sasl_client_done")]
	public void client_done();

	[CCode (cname = "sasl_client_new")]
	public Result client_new(
		string service, string serverFQDN,
		string? iplocalport, string? ipremoteport,
		[CCode(array_length=false)] Callback[]? prompt_supp, uint flags,
		out Connection pconn);

	[CCode (cname = "sasl_callback_t", destroy_function = "")]
	public struct Callback<T> {
		public CallbackId id;
		[CCode (delegate_target_cname = "context")]
		public unowned T proc;
		void *context;
	}

	[CCode (cname = "sasl_interact_t", destroy_function = "")]
	public struct Interact {
		public uint id;
		public string challenge;
		public string prompt;
		public string defresult;
		[CCode (array_length_type = "uint")] public void* result;
	}

	// Flags for sasl_server_new and sasl_client_new
	public int SASL_SUCCESS_DATA;
	public int SASL_NEED_PROXY;
	public int SASL_NEED_HTTP;

	// Errors
	[CCode (cname = "int", cprefix = "SASL_")]
	public enum Result {
	    CONTINUE,
	    OK,
	    FAIL,
	    NOMEM,
	    BUFOVER,
	    NOMECH,
	    BADPROT,
	    NOTDONE,
	    BADPARAM,
	    TRYAGAIN,
	    BADMAC,
	    NOTINIT,

	    INTERACT,
	    BADSERV,
	    WRONGMECH,

	    BADAUTH,
	    NOAUTHZ,
	    TOOWEAK,
	    ENCRYPT,
	    TRANS,

	    EXPIRED,
	    DISABLED,
	    NOUSER,
	    BADVERS,
	    UNAVAIL,
	    NOVERIFY,

	    PWLOCK,
	    NOCHANGE,
	    WEAKPASS,
	    NOUSERPASS,
	    NEED_OLD_PASSWD,

	    CONSTRAINT_VIOLAT,

	    BADBINDING,
	    CONFIGERR,

	    MECHNAMEMAX,
	}

	// Properties
	[CCode (cname="int", cprefix="SASL_")]
	public enum Property {
	    USERNAME,
	    SSF,
	    MAXOUTBUF,
	    DEFUSERREALM,
	    GETOPTCTX,
	    CALLBACK,
	    IPLOCALPORT,
	    IPREMOTEPORT,
	    PLUGERR,
	    DELEGATEDCREDS,

	    SERVICE,
	    SERVERFQDN,
	    AUTHSOURCE,
	    MECHNAME,
	    AUTHUSER,
	    APPNAME,
	    GSS_CREDS,
	    GSS_PEER_NAME,
	    GSS_LOCAL_NAME,
	    CHANNEL_BINDING,
	    HTTP_REQUEST,
	}

	// Callback ids
	[CCode (cname = "sasl_getsimple_t", has_target = false)]
	public delegate Result GetSimpleFunc(void *context, CallbackId cb, [CCode (array_length_type = "uint")] out uint8[] result);

	[CCode (cname = "int", cprefix="SASL_CB_")]
	public enum CallbackId {
	    LIST_END,
	    USER,
	    AUTHNAME,
	    LANGUAGE,
	    NONCE,
	    PASS,
	    ECHOPROMPT,
	    NOECHOPROMPT,
	    GETREALM,
	    PROXY_POLICY,
	}

	[CCode (cname = "sasl_secret_t", destroy_function="", copy_function="")]
	public struct Secret {
	    [CCode (array_length_cname = "len", array_length_type="ulong")]
	    uint8[] data;
	}
	[CCode (cname = "sasl_getsecret_t", has_target = false)]
	public delegate Result GetSecretFunc(Connection conn, void *context, CallbackId cb, out Secret? secret);
}
