/*
 * Copyright (c) 2019 Junde Yhi <lmy441900@aosc.xyz>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

[CCode (cheader_filename = "yaml.h")]
namespace Yaml {
	/**
	 * Get the library version as a string.
	 *
	 * @return The function return the pointer to a static string of the form
	 * ``"X.Y.Z"``, where ```X`` is the major version number, ``Y`` is a minor
	 * version number, and ``Z`` is the patch version number.
	 */
	public static unowned string get_version_string();

	/**
	 * Get the library version numbers.
	 *
	 * @param major Major version number.
	 * @param minor Minor version number.
	 * @param patch Patch version number.
	 */
	public static void get_version(out int major, out int minor, out int patch);

	/*
	 * Not bound: The character type (UTF-8 octet).
	 *
	 * This should be equivalent to Vala's ``string`` type.
	 */

	/** The version directive data. */
	[CCode (cname = "yaml_version_directive_t", has_destroy_function = false, has_type_id = false)]
	public struct VersionDirective {
		/** The major version number. */
		int major;
		/** The minor version number. */
		int minor;
	}

	/** The tag directive data. */
	[CCode (cname = "yaml_tag_directive_t", has_destroy_function = false, has_type_id = false)]
	public struct TagDirective {
		/** The tag handle. */
		string? handle;
		/** The tag prefix. */
		string? prefix;
	}

	/** The stream encoding. */
	[CCode (cname = "yaml_encoding_t", has_type_id = false)]
	public enum Encoding {
		/** Let the parser choose the encoding. */
		[CCode (cname = "YAML_ANY_ENCODING")]
		ANY,
		/** The default UTF-8 encoding. */
		[CCode (cname = "YAML_UTF8_ENCODING")]
		UTF8,
		/** The UTF-16-LE encoding with BOM. */
		[CCode (cname = "YAML_UTF16LE_ENCODING")]
		UTF16LE,
		/** The UTF-16-BE encoding with BOM. */
		[CCode (cname = "YAML_UTF16BE_ENCODING")]
		UTF16BE,
	}

	/** Line break types. */
	[CCode (cname = "yaml_break_t", has_type_id = false)]
	public enum Break {
		/** Let the parser choose the break type. */
		[CCode (cname = "YAML_ANY_BREAK")]
		ANY,
		/** Use CR for line breaks (Mac style). */
		[CCode (cname = "YAML_CR_BREAK")]
		CR,
		/** Use LN for line breaks (Unix style). */
		[CCode (cname = "YAML_LN_BREAK")]
		LN,
		/** Use CR LN for line breaks (DOS style). */
		[CCode (cname = "YAML_CRLN_BREAK")]
		CRLN,
	}

	/** Many bad things could happen with the parser and emitter. */
	[CCode (cname = "yaml_error_type_t", has_type_id = false)]
	public enum ErrorType {
		/** No error is produced. */
		[CCode (cname = "YAML_NO_ERROR")]
		NO,

		/** Cannot allocate or reallocate a block of memory. */
		[CCode (cname = "YAML_MEMORY_ERROR")]
		MEMORY,

		/** Cannot read or decode the input stream. */
		[CCode (cname = "YAML_READER_ERROR")]
		READER,
		/** Cannot scan the input stream. */
		[CCode (cname = "YAML_SCANNER_ERROR")]
		SCANNER,
		/** Cannot parse the input stream. */
		[CCode (cname = "YAML_PARSER_ERROR")]
		PARSER,
		/** Cannot compose a YAML document. */
		[CCode (cname = "YAML_COMPOSER_ERROR")]
		COMPOSER,

		/** Cannot write to the output stream. */
		[CCode (cname = "YAML_WRITER_ERROR")]
		WRITER,
		/** Cannot emit a YAML stream. */
		[CCode (cname = "YAML_EMITTER_ERROR")]
		EMITTER,
	}

	/** The pointer position. */
	[CCode (cname = "yaml_mark_t", has_type_id = false)]
	public struct Mark {
		/** The position index. */
		size_t index;
		/** The position line. */
		size_t line;
		/** The position column. */
		size_t column;
	}

	/** Scalar styles. */
	[CCode (cname = "yaml_scalar_style_t", has_type_id = false)]
	public enum ScalarStyle {
		/** Let the emitter choose the style. */
		[CCode (cname = "YAML_ANY_SCALAR_STYLE")]
		ANY,

		/** The plain scalar style. */
		[CCode (cname = "YAML_PLAIN_SCALAR_STYLE")]
		PLAIN,

		/** The single-quoted scalar style. */
		[CCode (cname = "YAML_SINGLE_QUOTED_SCALAR_STYLE")]
		SINGLE_QUOTED,
		/** The double-quoted scalar style. */
		[CCode (cname = "YAML_DOUBLE_QUOTED_SCALAR_STYLE")]
		DOUBLE_QUOTED,

		/** The literal scalar style. */
		[CCode (cname = "YAML_LITERAL_SCALAR_STYLE")]
		LITERAL,
		/** The folded scalar style. */
		[CCode (cname = "YAML_FOLDED_SCALAR_STYLE")]
		FOLDED,
	}

	/** Sequence styles. */
	[CCode (cname = "yaml_sequence_style_t", has_type_id = false)]
	public enum SequenceStyle {
		/** Let the emitter choose the style. */
		[CCode (cname = "YAML_ANY_SEQUENCE_STYLE")]
		ANY,

		/** The block sequence style. */
		[CCode (cname = "YAML_BLOCK_SEQUENCE_STYLE")]
		BLOCK,
		/** The flow sequence style. */
		[CCode (cname = "YAML_FLOW_SEQUENCE_STYLE")]
		FLOW,
	}

	/** Mapping styles. */
	[CCode (cname = "yaml_mapping_style_t", has_type_id = false)]
	public enum MappingStyle {
		/** Let the emitter choose the style. */
		[CCode (cname = "YAML_ANY_MAPPING_STYLE")]
		ANY,

		/** The block mapping style. */
		[CCode (cname = "YAML_BLOCK_MAPPING_STYLE")]
		BLOCK,
		/** The flow mapping style. */
		[CCode (cname = "YAML_FLOW_MAPPING_STYLE")]
		FLOW,
	}

	/** Token types. */
	[CCode (cname = "yaml_token_type_t", has_type_id = false)]
	public enum TokenType {
		/** An empty token. */
		[CCode (cname = "YAML_NO_TOKEN")]
		NO,

		/** A STREAM-START token. */
		[CCode (cname = "YAML_STREAM_START_TOKEN")]
		STREAM_START,
		/** A STREAM-END token. */
		[CCode (cname = "YAML_STREAM_END_TOKEN")]
		STREAM_END,

		/** A VERSION-DIRECTIVE token. */
		[CCode (cname = "YAML_VERSION_DIRECTIVE_TOKEN")]
		VERSION_DIRECTIVE,
		/** A TAG-DIRECTIVE token. */
		[CCode (cname = "YAML_TAG_DIRECTIVE_TOKEN")]
		TAG_DIRECTIVE,
		/** A DOCUMENT-START token. */
		[CCode (cname = "YAML_DOCUMENT_START_TOKEN")]
		DOCUMENT_START,
		/** A DOCUMENT-END token. */
		[CCode (cname = "YAML_DOCUMENT_END_TOKEN")]
		DOCUMENT_END,

		/** A BLOCK-SEQUENCE-START token. */
		[CCode (cname = "YAML_BLOCK_SEQUENCE_START_TOKEN")]
		BLOCK_SEQUENCE_START,
		/** A BLOCK-SEQUENCE-END token. */
		[CCode (cname = "YAML_BLOCK_MAPPING_START_TOKEN")]
		BLOCK_MAPPING_START,
		/** A BLOCK-END token. */
		[CCode (cname = "YAML_BLOCK_END_TOKEN")]
		BLOCK_END,

		/** A FLOW-SEQUENCE-START token. */
		[CCode (cname = "YAML_FLOW_SEQUENCE_START_TOKEN")]
		FLOW_SEQUENCE_START,
		/** A FLOW-SEQUENCE-END token. */
		[CCode (cname = "YAML_FLOW_SEQUENCE_END_TOKEN")]
		FLOW_SEQUENCE_END,
		/** A FLOW-MAPPING-START token. */
		[CCode (cname = "YAML_FLOW_MAPPING_START_TOKEN")]
		FLOW_MAPPING_START,
		/** A FLOW-MAPPING-END token. */
		[CCode (cname = "YAML_FLOW_MAPPING_END_TOKEN")]
		FLOW_MAPPING_END,

		/** A BLOCK-ENTRY token. */
		[CCode (cname = "YAML_BLOCK_ENTRY_TOKEN")]
		BLOCK_ENTRY,
		/** A FLOW-ENTRY token. */
		[CCode (cname = "YAML_FLOW_ENTRY_TOKEN")]
		FLOW_ENTRY,
		/** A KEY token. */
		[CCode (cname = "YAML_KEY_TOKEN")]
		KEY,
		/** A VALUE token. */
		[CCode (cname = "YAML_VALUE_TOKEN")]
		VALUE,

		/** An ALIAS token. */
		[CCode (cname = "YAML_ALIAS_TOKEN")]
		ALIAS,
		/** An ANCHOR token. */
		[CCode (cname = "YAML_ANCHOR_TOKEN")]
		ANCHOR,
		/** A TAG token. */
		[CCode (cname = "YAML_TAG_TOKEN")]
		TAG,
		/** A SCALAR token. */
		[CCode (cname = "YAML_SCALAR_TOKEN")]
		SCALAR
	}

	/** The token structure. */
	[CCode (cname = "yaml_token_t", destroy_function = "yaml_token_delete", has_type_id = false)]
	public struct Token {
		/** The token type. */
		TokenType type;

		/* The token data. */

		/* The stream start (for TokenType.STREAM_START). */

		/** The stream encoding. */
		[CCode (cname = "data.stream_start.encoding")]
		Encoding data_stream_start_encoding;

		/* The alias (for TokenType.ALIAS). */

		/** The alias value. */
		[CCode (cname = "data.alias.value")]
		string? data_alias_value;

		/* The anchor (for TokenType.ANCHOR). */

		/** The anchor value. */
		[CCode (cname = "data.anchor.value")]
		string? data_anchor_value;

		/* The tag (for TokenType.TAG). */

		/** The tag handle. */
		[CCode (cname = "data.tag.handle")]
		string? data_tag_handle;
		/** The tag suffix. */
		[CCode (cname = "data.tag.suffix")]
		string? data_tag_suffix;

		/* The scalar value (for TokenType.SCALAR). */

		/** The scalar value. */
		[CCode (cname = "data.scalar.value")]
		string? data_scalar_value;
		/** The length of the scalar value. */
		[CCode (cname = "data.scalar.length")]
		size_t data_scalar_length;
		/** The scalar style. */
		[CCode (cname = "data.scalar.style")]
		ScalarStyle data_scalar_style;

		/* The version directive (for TokenType.VERSION_DIRECTIVE). */

		/** The major version number. */
		[CCode (cname = "data.version_directive.major")]
		int data_version_directive_major;
		/** The minor version number. */
		[CCode (cname = "data.version_directive.minor")]
		int data_version_directive_minor;

		/** The tag directive (for TokenType.TAG_DIRECTIVE). */

		/** The tag handle. */
		[CCode (cname = "data.tag_directive.handle")]
		string? data_tag_directive_handle;
		/** The tag prefix. */
		[CCode (cname = "data.tag_directive.prefix")]
		string? data_tag_directive_prefix;

		/** The beginning of the token. */
		Mark start_mark;
		/** The end of the token. */
		Mark end_mark;
	}

	/** Event types. */
	[CCode (cname = "yaml_event_type_t", has_type_id = false)]
	public enum EventType {
		/** An empty event. */
		[CCode (cname = "YAML_NO_EVENT")]
		NO,

		/** A STREAM-START event. */
		[CCode (cname = "YAML_STREAM_START_EVENT")]
		STREAM_START,
		/** A STREAM-END event. */
		[CCode (cname = "YAML_STREAM_END_EVENT")]
		STREAM_END,

		/** A DOCUMENT-START event. */
		[CCode (cname = "YAML_DOCUMENT_START_EVENT")]
		DOCUMENT_START,
		/** A DOCUMENT-END event. */
		[CCode (cname = "YAML_DOCUMENT_END_EVENT")]
		DOCUMENT_END,

		/** An ALIAS event. */
		[CCode (cname = "YAML_ALIAS_EVENT")]
		ALIAS,
		/** A SCALAR event. */
		[CCode (cname = "YAML_SCALAR_EVENT")]
		SCALAR,

		/** A SEQUENCE-START event. */
		[CCode (cname = "YAML_SEQUENCE_START_EVENT")]
		SEQUENCE_START,
		/** A SEQUENCE-END event. */
		[CCode (cname = "YAML_SEQUENCE_END_EVENT")]
		SEQUENCE_END,

		/** A MAPPING-START event. */
		[CCode (cname = "YAML_MAPPING_START_EVENT")]
		MAPPING_START,
		/** A MAPPING-END event. */
		[CCode (cname = "YAML_MAPPING_END_EVENT")]
		MAPPING_END,
	}

	/** The event structure. */
	[CCode (cname = "yaml_event_t", destroy_function = "yaml_event_delete", has_type_id = false)]
	public struct Event {
		/** The event type. */
		EventType type;

		/* The event data. */

		/* The stream parameters (for EventType.STREAM_START). */

		/** The document encoding. */
		[CCode (cname = "data.stream_start.encoding", has_type_id = false)]
		Encoding data_stream_start_encoding;

		/* The document parameters (for EventType.DOCUMENT_START). */

		/** The version directive. */
		[CCode (cname = "data.document_start.version_directive", has_type_id = false)]
		VersionDirective? data_document_start_version_directive;

		/* The list of tag directives. */

		/** The beginning of the tag directives list. */
		[CCode (cname = "data.document_start.tag_directives.start", has_type_id = false)]
		TagDirective? data_document_start_tag_directives_start;
		/** The end of the tag directives list. */
		[CCode (cname = "data.document_start.tag_directives.end", has_type_id = false)]
		TagDirective? data_document_start_tag_directives_end;

		/** Is the document indicator implicit? */
		[CCode (cname = "data.document_start.implicit", has_type_id = false)]
		int data_document_start_implicit;

		/* The document end parameters (for EventType.DOCUMENT_END). */

		/** Is the document end indicator implicit? */
		[CCode (cname = "data.document_end.implicit", has_type_id = false)]
		int data_document_end_implicit;

		/* The alias parameters (for EventType.ALIAS). */

		/** The anchor. */
		[CCode (cname = "data.alias.anchor", has_type_id = false)]
		string? data_alias_anchor;

		/* The scalar parameters (for EventType.SCALAR). */

		/** The anchor. */
		[CCode (cname = "data.scalar.anchor", has_type_id = false)]
		string? data_scalar_anchor;
		/** The tag. */
		[CCode (cname = "data.scalar.tag", has_type_id = false)]
		string? data_scalar_tag;
		/** The scalar value. */
		[CCode (cname = "data.scalar.value", has_type_id = false)]
		string? data_scalar_value;
		/** The length of the scalar value. */
		[CCode (cname = "data.scalar.length", has_type_id = false)]
		size_t data_scalar_length;
		/** Is the tag optional for the plain style? */
		[CCode (cname = "data.scalar.plain_implicit", has_type_id = false)]
		int data_scalar_plain_implicit;
		/** Is the tag optional for any non-plain style? */
		[CCode (cname = "data.scalar.quoted_implicit", has_type_id = false)]
		int data_scalar_quoted_implicit;
		/** The scalar style. */
		[CCode (cname = "data.scalar.style", has_type_id = false)]
		ScalarStyle data_scalar_style;

		/* The sequence parameters (for EventType.SEQUENCE_START). */

		/** The anchor. */
		[CCode (cname = "data.sequence_start.anchor", has_type_id = false)]
		string? data_sequence_start_anchor;
		/** The tag. */
		[CCode (cname = "data.sequence_start.tag", has_type_id = false)]
		string? data_sequence_start_tag;
		/** Is the tag optional? */
		[CCode (cname = "data.sequence_start.implicit", has_type_id = false)]
		int data_sequence_start_implicit;
		/** The sequence style. */
		[CCode (cname = "data.sequence_start.style", has_type_id = false)]
		SequenceStyle data_sequence_start_style;

		/* The mapping parameters (for EventType.MAPPING_START). */

		/** The anchor. */
		[CCode (cname = "data.mapping_start.anchor", has_type_id = false)]
		string? data_mapping_start_anchor;
		/** The tag. */
		[CCode (cname = "data.mapping_start.tag", has_type_id = false)]
		string? data_mapping_start_tag;
		/** Is the tag optional? */
		[CCode (cname = "data.mapping_start.implicit", has_type_id = false)]
		int data_mapping_start_implicit;
		/** The mapping style. */
		[CCode (cname = "data.mapping_start.style", has_type_id = false)]
		SequenceStyle data_mapping_start_style;

		/** The beginning of the event. */
		Mark start_mark;
		/** The end of the event. */
		Mark end_mark;

		/**
		 * Create the STREAM-START event.
		 *
		 * @param event    An empty event object.
		 * @param encoding The stream encoding.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_stream_start_event_initialize")]
		public int stream_start_initialize(Encoding encoding);

		/**
		 * Create the STREAM-END event.
		 *
		 * @param event An empty event object.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_stream_end_event_initialize")]
		public int stream_end_initialize();

		/**
		 * Create the DOCUMENT-START event.
		 *
		 * The implicit argument is considered as a stylistic parameter and may be
		 * ignored by the emitter.
		 *
		 * @param event                An empty event object.
		 * @param version_directive    The %YAML directive value or ``NULL``.
		 * @param tag_directives_start The beginning of the %TAG directives list.
		 * @param tag_directives_end   The end of the %TAG directives list.
		 * @param implicit             If the document start indicator is implicit.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_document_start_event_initialize")]
		public int document_start_initialize(VersionDirective? version_directive, TagDirective tag_directive_start, TagDirective tag_directive_end, int implicit);

		/**
		 * Create the DOCUMENT-END event.
		 *
		 * The implicit argument is considered as a stylistic parameter and may be
		 * ignored by the emitter.
		 *
		 * @param event    An empty event object.
		 * @param implicit If the document end indicator is implicit.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_document_end_event_initialize")]
		public int document_end_initialize(int implicit);

		/**
		 * Create an ALIAS event.
		 *
		 * @param event  An empty event object.
		 * @param anchor The anchor value.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_alias_event_initialize")]
		public int alias_initialize(string anchor);

		/**
		 * Create a SCALAR event.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * Either the tag attribute or one of the plain_implicit and quoted_implicit
		 * flags must be set.
		 *
		 * @param event           An empty event object.
		 * @param anchor          The scalar anchor or ``NULL``.
		 * @param tag             The scalar tag or ``NULL``.
		 * @param value           The scalar value.
		 * @param length          The length of the scalar value.
		 * @param plain_implicit  If the tag may be omitted for the plain style.
		 * @param quoted_implicit If the tag may be omitted for any non-plain style.
		 * @param style           The scalar style.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_scalar_event_initialize")]
		public int scalar_initialize(string? anchor, string? tag, string value, int length, int plain_implicit, int quoted_implicit, ScalarStyle style);

		/**
		 * Create a SEQUENCE-START event.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * Either the tag attribute or the implicit flag must be set.
		 *
		 * @param event    An empty event object.
		 * @param anchor   The sequence anchor or ``NULL``.
		 * @param tag      The sequence tag or ``NULL``.
		 * @param implicit If the tag may be omitted.
		 * @param style    The sequence style.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_sequence_start_event_initialize")]
		public int sequence_start_initialize(string? anchor, string? tag, int implicit, SequenceStyle style);

		/**
		 * Create a SEQUENCE-END event.
		 *
		 * @param event An empty event object.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_sequence_end_event_initialize")]
		public int sequence_end_initialize();

		/**
		 * Create a MAPPING-START event.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * Either the tag attribute or the implicit flag must be set.
		 *
		 * @param event    An empty event object.
		 * @param anchor   The mapping anchor or ``NULL``.
		 * @param tag      The mapping tag or ``NULL``.
		 * @param implicit If the tag may be omitted.
		 * @param style    The mapping style.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_mapping_start_event_initialize")]
		public int mapping_start_initialize(string? anchor, string? tag, int implicit, MappingStyle style);

		/**
		 * Create a MAPPING-END event.
		 *
		 * @param event An empty event object.
		 */
		[CCode (cname = "yaml_mapping_end_event_initialize")]
		public int mapping_end_initialize();
	}

	namespace Tag {

		/** The tag ``!!null`` with the only possible value: ``null``. */
		[CCode (cname = "YAML_NULL_TAG")]
		public const string NULL;
		/** The tag ``!!bool`` with the values: ``true`` and ``false``. */
		[CCode (cname = "YAML_BOOL_TAG")]
		public const string BOOL;
		/** The tag ``!!str`` for string values. */
		[CCode (cname = "YAML_STR_TAG")]
		public const string STR;
		/** The tag ``!!int`` for integer values. */
		[CCode (cname = "YAML_INT_TAG")]
		public const string INT;
		/** The tag ``!!float`` for float values. */
		[CCode (cname = "YAML_FLOAT_TAG")]
		public const string FLOAT;
		/** The tag ``!!timestamp`` for date and time values. */
		[CCode (cname = "YAML_TIMESTAMP_TAG")]
		public const string TIMESTAMP;

		/** The tag ``!!seq`` is used to denote sequences. */
		[CCode (cname = "YAML_SEQ_TAG")]
		public const string SEQ;
		/** The tag ``!!map`` is used to denote mapping. */
		[CCode (cname = "YAML_MAP_TAG")]
		public const string MAP;

		/** The default scalar tag is ``!!str``. */
		[CCode (cname = "YAML_DEFAULT_SCALAR_TAG")]
		public const string DEFAULT_SCALAR;
		/** The default sequence tag is ``!!seq``. */
		[CCode (cname = "YAML_DEFAULT_SEQUENCE_TAG")]
		public const string DEFAULT_SEQUENCE;
		/** The default mapping tag is ``!!map``. */
		[CCode (cname = "YAML_DEFAULT_MAPPING_TAG")]
		public const string DEFAULT_MAPPING;

	}

	/** Node types. */
	[CCode (cname = "yaml_node_type_t", has_type_id = false)]
	public enum NodeType {
		/** An empty node. */
		[CCode (cname = "YAML_NO_NODE")]
		NO,

		/** A scalar node. */
		[CCode (cname = "YAML_SCALAR_NODE")]
		SCALAR,
		/** A sequence node. */
		[CCode (cname = "YAML_SEQUENCE_NODE")]
		SEQUENCE,
		/** A mapping node. */
		[CCode (cname = "YAML_MAPPING_NODE")]
		MAPPING,
	}

	/** The forward definition of a document node structure. */
	[SimpleType]
	[CCode (cname = "yaml_node_item_t", has_type_id = false)]
	public struct NodeItem : int {}

	/** An element of a sequence node. */
	[CCode (cname = "yaml_node_pair_t", has_type_id = false)]
	public struct NodePair {
		/** The key of the element. */
		int key;
		/** The value of the element. */
		int value;
	}

	/** The node structure. */
	[CCode (cname = "yaml_node_t", has_destroy_function = false, has_type_id = false)]
	public struct Node {
		/** The node type. */
		NodeType type;
		/** The node tag. */
		string tag;

		/* The node data. */

		/* The scalar parameters (for NodeType.SCALAR). */

		/** The scalar value. */
		[CCode (cname = "data.scalar.value")]
		string data_scalar_value;
		/** The length of the scalar value. */
		[CCode (cname = "data.scalar.length")]
		size_t data_scalar_length;
		/** The scalar style. */
		[CCode (cname = "data.scalar.style")]
		ScalarStyle data_scalar_style;

		/** The sequence parameters (for NodeType.SEQUENCE). */

		/** The beginning of the stack of sequence items. */
		[CCode (cname = "data.sequence.items.start")]
		NodeItem? data_sequence_items_start;
		/** The end of the stack of sequence items. */
		[CCode (cname = "data.sequence.items.end")]
		NodeItem? data_sequence_items_end;
		/** The top of the stack of sequence items. */
		[CCode (cname = "data.sequence.items.top")]
		NodeItem? data_sequence_items_top;
		/** The sequence style. */
		[CCode (cname = "data.sequence.style")]
		SequenceStyle style;

		/* The mapping parameters (for NodeType.MAPPING). */

		/** The beginning of the stack of mapping pairs (key, value). */
		[CCode (cname = "data.mapping.pairs.start")]
		NodePair? data_mapping_pairs_start;
		/** The end of the stack of mapping pairs (key, value). */
		[CCode (cname = "data.mapping.pairs.end")]
		NodePair? data_mapping_pairs_end;
		/** The top of the stack of mapping pairs (key, value). */
		[CCode (cname = "data.mapping.pairs.top")]
		NodePair? data_mapping_pairs_top;
		/** The mapping style. */
		[CCode (cname = "data.mapping.style")]
		MappingStyle data_mapping_style;

		/** The beginning of the node. */
		Mark start_mark;
		/** The end of the node. */
		Mark end_mark;
	}

	/** The document structure. */
	[CCode (cname = "yaml_document_t", destroy_function = "yaml_document_delete", has_type_id = false)]
	public struct Document {
		/* The document nodes. */

		/** The beginning of the stack. */
		[CCode (cname = "nodes.start")]
		Node? node_start;
		/** The end of the stack. */
		[CCode (cname = "nodes.end")]
		Node? node_end;
		/** The top of the stack. */
		[CCode (cname = "nodes.top")]
		Node? node_top;

		/** The version directive. */
		VersionDirective? version_directive;

		/* The list of tag directives. */

		/** The beginning of the tag directives list. */
		[CCode (cname = "tag_directives.start")]
		TagDirective? tag_directives_start;
		/** The end of the tag directives list. */
		[CCode (cname = "tag_directives.end")]
		TagDirective? tag_directives_end;

		/** Is the document start indicator implicit? */
		int start_implicit;
		/** Is the document end indicator implicit? */
		int end_implicit;

		/** The beginning of the document. */
		Mark start_mark;
		/** The end of the document. */
		Mark end_mark;

		/**
		 * Create a YAML document.
		 *
		 * @param document             An empty document object.
		 * @param version_directive    The %YAML directive value or ``NULL``.
		 * @param tag_directives_start The beginning of the %TAG directives list.
		 * @param tag_directives_end   The end of the %TAG directives list.
		 * @param start_implicit       If the document start indicator is implicit.
		 * @param end_implicit         If the document end indicator is implicit.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_document_initialize")]
		public Document(VersionDirective? version_directive, TagDirective tag_directives_start, TagDirective tag_directives_end, int start_implicit, int end_implicit);

		/**
		 * Get a node of a YAML document.
		 *
		 * The pointer returned by this function is valid until any of the functions
		 * modifying the documents are called.
		 *
		 * @param document A document object.
		 * @param index    The node id.
		 *
		 * @return the node objct or ``NULL`` if ``node_id`` is out of range.
		 */
		public Node? get_node(int index);

		/**
		 * Get the root of a YAML document node.
		 *
		 * The root object is the first object added to the document.
		 *
		 * The pointer returned by this function is valid until any of the functions
		 * modifying the documents are called.
		 *
		 * An empty document produced by the parser signifies the end of a YAML
		 * stream.
		 *
		 * @param document A document object.
		 *
		 * @return the node object or ``NULL`` if the document is empty.
		 */
		public Node? get_root_node();

		/**
		 * Create a SCALAR node and attach it to the document.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * @param document A document object.
		 * @param tag      The scalar tag.
		 * @param value    The scalar value.
		 * @param length   The length of the scalar value.
		 * @param style    The scalar style.
		 *
		 * @return the node id or ``0`` on error.
		 */
		public int add_scalar(string tag, string value, int length, ScalarStyle style);

		/**
		 * Create a SEQUENCE node and attach it to the document.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * @param document A document object.
		 * @param tag      The sequence tag.
		 * @param style    The sequence style.
		 *
		 * @return the node id or ``0`` on error.
		 */
		public int add_sequence(string tag, SequenceStyle style);

		/**
		 * Create a MAPPING node and attach it to the document.
		 *
		 * The style argument may be ignored by the emitter.
		 *
		 * @param document A document object.
		 * @param tag      The sequence tag.
		 * @param style    The sequence style.
		 *
		 * @return the node id or ``0`` on error.
		 */
		public int add_mapping(string tag, MappingStyle style);

		/**
		 * Add an item to a SEQUENCE node.
		 *
		 * @param document A document object.
		 * @param sequence The sequence node id.
		 * @param item     The item node id.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		public int append_sequence_item(int sequence, int item);

		/**
		 * Add a pair of a key and a value to a MAPPING node.
		 *
		 * @param document A document object.
		 * @param mapping  The mapping node id.
		 * @param key      The key node id.
		 * @param value    The value node id.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		public int append_mapping_pair(int mapping, int key, int value);
	}

	/**
	 * The prototype of a read handler.
	 *
	 * The read handler is called when the parser needs to read more bytes from the
	 * source. The handler should write not more than size bytes to the buffer. The
	 * number of written bytes should be set to the length variable.
	 *
	 * @param data      A pointer to an application data specified by
	 *                  ``yaml_parser_set_input()``.
	 * @param buffer    The buffer to write the data from the source.
	 * @param size      The size of the buffer.
	 * @param size_read The actual number of bytes read from the source.
	 *
	 * @return On success, the handler should return ``1``. If the handler failed,
	 * the returned value should be ``0``. On EOF, the handler should set the
	 * size_read to ``0`` and return ``1``.
	 */
	[CCode (cname = "yaml_read_handler_t", instance_pos = 0.1)]
	public delegate int ReadHandler(
		[CCode (array_length_type = "size_t")] uint8[] buffer,
		ref size_t size_read
	);

	/**
	 * This structure holds information about a potential simple key.
	 */
	[CCode (cname = "yaml_simple_key_t", has_destroy_function = false, has_type_id = false)]
	public struct SimpleKey {
		/** Is a simple key possible? */
		int possible;
		/** Is a simple key required? */
		int required;
		/** The number of the token. */
		size_t token_number;
		/** The position mark. */
		Mark mark;
	}

	/**
	 * The states of the parser.
	 */
	[CCode (cname = "yaml_parser_state_t", has_type_id = false)]
	public enum ParserState {
		/** Expect STREAM-START. */
		[CCode (cname = "YAML_PARSE_STREAM_START_STATE")]
		STREAM_START,
		/** Expect the beginning of an implicit document. */
		[CCode (cname = "YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE")]
		IMPLICIT_DOCUMENT_START,
		/** Expect DOCUMENT-START. */
		[CCode (cname = "YAML_PARSE_DOCUMENT_START_STATE")]
		DOCUMENT_START,
		/** Expect the content of a document. */
		[CCode (cname = "YAML_PARSE_DOCUMENT_CONTENT_STATE")]
		DOCUMENT_CONTENT,
		/** Expect DOCUMENT-END. */
		[CCode (cname = "YAML_PARSE_DOCUMENT_END_STATE")]
		DOCUMENT_END,
		/** Expect a block node. */
		[CCode (cname = "YAML_PARSE_BLOCK_NODE_STATE")]
		BLOCK_NODE,
		/** Expect a block node or indentless sequence. */
		[CCode (cname = "YAML_PARSE_BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE")]
		BLOCK_NODE_OR_INDENTLESS_SEQUENCE,
		/** Expect a flow node. */
		[CCode (cname = "YAML_PARSE_FLOW_NODE_STATE")]
		FLOW_NODE,
		/** Expect the first entry of a block sequence. */
		[CCode (cname = "YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE")]
		BLOCK_SEQUENCE_FIRST_ENTRY,
		/** Expect an entry of a block sequence. */
		[CCode (cname = "YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE")]
		BLOCK_SEQUENCE_ENTRY,
		/** Expect an entry of an indentless sequence. */
		[CCode (cname = "YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE")]
		INDENTLESS_SEQUENCE_ENTRY,
		/** Expect the first key of a block mapping. */
		[CCode (cname = "YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE")]
		BLOCK_MAPPING_FIRST_KEY,
		/** Expect a block mapping key. */
		[CCode (cname = "YAML_PARSE_BLOCK_MAPPING_KEY_STATE")]
		BLOCK_MAPPING_KEY,
		/** Expect a block mapping value. */
		[CCode (cname = "YAML_PARSE_BLOCK_MAPPING_VALUE_STATE")]
		BLOCK_MAPPING_VALUE,
		/** Expect the first entry of a flow sequence. */
		[CCode (cname = "YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE")]
		FLOW_SEQUENCE_FIRST_ENTRY,
		/** Expect an entry of a flow sequence. */
		[CCode (cname = "YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE")]
		FLOW_SEQUENCE_ENTRY,
		/** Expect a key of an ordered mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE")]
		FLOW_SEQUENCE_ENTRY_MAPPING_KEY,
		/** Expect a value of an ordered mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE")]
		FLOW_SEQUENCE_ENTRY_MAPPING_VALUE,
		/** Expect the and of an ordered mapping entry. */
		[CCode (cname = "YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE")]
		FLOW_SEQUENCE_ENTRY_MAPPING_END,
		/** Expect the first key of a flow mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE")]
		FLOW_MAPPING_FIRST_KEY,
		/** Expect a key of a flow mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_MAPPING_KEY_STATE")]
		FLOW_MAPPING_KEY,
		/** Expect a value of a flow mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_MAPPING_VALUE_STATE")]
		FLOW_MAPPING_VALUE,
		/** Expect an empty value of a flow mapping. */
		[CCode (cname = "YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE")]
		FLOW_MAPPING_EMPTY_VALUE,
		/** Expect nothing. */
		[CCode (cname = "YAML_PARSE_END_STATE")]
		END,
	}

	/**
	 * This structure holds aliases data.
	 */
	[CCode (cname = "yaml_alias_data_t", has_destroy_function = false, has_type_id = false)]
	public struct AliasData {
		/** The anchor. */
		string anchor;
		/** The node id. */
		int index;
		/** The anchor mark. */
		Mark mark;
	}

	/**
	 * The parser structure.
	 *
	 * All members are internal. Manage the structure using the ``yaml_parser_``
	 * family of functions.
	 */
	[CCode (cname = "yaml_parser_t", destroy_function = "yaml_parser_delete", has_type_id = false)]
	public struct Parser {
		/* Error handling */

		/** Error type. */
		ErrorType error;
		/** Error description. */
		unowned string? problem;
		/** The byte about which the problem occured. */
		size_t problem_offset;
		/** The problematic value (``-1`` is none). */
		int problem_value;
		/** The problem position. */
		Mark problem_mark;
		/** The error context. */
		unowned string? context;
		/** The context position. */
		Mark context_mark;

		/* Reader stuff */

		/** Read handler. */
		ReadHandler read_handler;
		/** A pointer for passing to the read handler. */
		void *read_handler_data;

		/* Standard (string or file) input data. */

		/** The string start pointer. */
		[CCode (cname = "input.string.start")]
		unowned string? input_string_start;
		/** The string end pointer. */
		[CCode (cname = "input.string.end")]
		unowned string? input_string_end;
		/** The string current position. */
		[CCode (cname = "input.string.current")]
		unowned string? input_string_current;
		/** File input data. */
		[CCode (cname = "input.file")]
		GLib.FileStream? input_file;

		/** EOF flag */
		int eof;

		/* The working buffer. */

		/** The beginning of the working buffer. */
		[CCode (cname = "buffer.start")]
		string buffer_start;
		/** The end of the working buffer. */
		[CCode (cname = "buffer.end")]
		string buffer_end;
		/** The current position of the working buffer. */
		[CCode (cname = "buffer.pointer")]
		string buffer_pointer;
		/** The last filled position of the working buffer. */
		[CCode (cname = "buffer.last")]
		string buffer_last;

		/* The number of unread characters in the working buffer. */
		size_t unread;

		/* The raw buffer. */

		/** The beginning of the raw buffer. */
		[CCode (cname = "raw_buffer.start")]
		string raw_buffer_start;
		/** The end of the raw buffer. */
		[CCode (cname = "raw_buffer.end")]
		string raw_buffer_end;
		/** The current position of the raw buffer. */
		[CCode (cname = "raw_buffer.pointer")]
		string raw_buffer_pointer;
		/** The last filled position of the raw buffer. */
		[CCode (cname = "raw_buffer.last")]
		string raw_buffer_last;

		/** The input encoding. */
		Encoding encoding;
		/** The offset of the current position (in bytes). */
		size_t offset;
		/** The mark of the current position. */
		Mark mark;

		/* Scanner stuff */

		/** Have we started to scan the input stream? */
		int stream_start_produced;
		/** Have we reached the end of the input stream? */
		int stream_end_produced;
		/** The number of unclosed '[' and '{' indicators. */
		int flow_level;

		/* The tokens queue. */

		/** The beginning of the tokens queue. */
		[CCode (cname = "tokens.start")]
		Token? tokens_start;
		/** The end of the tokens queue. */
		[CCode (cname = "tokens.end")]
		Token? tokens_end;
		/** The head of the tokens queue. */
		[CCode (cname = "tokens.head")]
		Token? tokens_head;
		/** The tail of the tokens queue. */
		[CCode (cname = "tokens.tail")]
		Token? tokens_tail;

		/** The number of tokens fetched from the queue. */
		size_t token_parsed;
		/** Does the tokens queue contain a token ready for dequeueing. */
		int token_available;

		/* The indentation levels stack. */

		/** The beginning of the indentation levels stack. */
		[CCode (cname = "indents.start")]
		int? indents_start;
		/** The end of the indentation levels stack. */
		[CCode (cname = "indents.end")]
		int? indents_end;
		/** The top of the indentation levels stack. */
		[CCode (cname = "indents.top")]
		int? indents_top;

		/** The current indentation level. */
		int indent;
		/** May a simple key occur at the current position? */
		int simple_key_allowed;

		/* The stack of simple keys. */

		/** The beginning of the stack of simple keys. */
		[CCode (cname = "simple_keys.start")]
		SimpleKey? simple_keys_start;
		/** The end of the stack of simple keys. */
		[CCode (cname = "simple_keys.end")]
		SimpleKey? simple_keys_end;
		/** The top of the stack of simple keys. */
		[CCode (cname = "simple_keys.top")]
		SimpleKey? simple_keys_top;

		/* Parser stuff */

		/* The parser states stack. */

		/** The beginning of the parser states stack. */
		[CCode (cname = "states.start")]
		ParserState? states_start;
		/** The end of the parser states stack. */
		[CCode (cname = "states.end")]
		ParserState? states_end;
		/** The top of the parser states stack. */
		[CCode (cname = "states.top")]
		ParserState? states_top;

		/** The current parser state. */
		ParserState state;

		/* The stack of marks. */

		/** The beginning of the stack of marks. */
		[CCode (cname = "marks.start")]
		Mark? marks_start;
		/** The end of the stack of marks. */
		[CCode (cname = "marks.end")]
		Mark? marks_end;
		/** The top of the stack of marks. */
		[CCode (cname = "marks.top")]
		Mark? marks_top;

		/* The list of TAG directives. */

		/** The beginning of the list of TAG directives. */
		[CCode (cname = "tag_directives.start")]
		TagDirective? tag_directives_start;
		/** The end of the list of TAG directives. */
		[CCode (cname = "tag_directives.end")]
		TagDirective? tag_directives_end;
		/** The top of the list of TAG directives. */
		[CCode (cname = "tag_directives.top")]
		TagDirective? tag_directives_top;

		/* Dumper stuff */

		/* The alias data. */

		/** The beginning of the list of alias data. */
		[CCode (cname = "aliases.start")]
		AliasData? aliases_start;
		/** The end of the list of alias data. */
		[CCode (cname = "aliases.end")]
		AliasData? aliases_end;
		/** The top of the list of alias data. */
		[CCode (cname = "aliases.top")]
		AliasData? aliases_top;

		/** The currently parsed document. */
		Document? document;

		/**
		 * Initialize a parser.
		 *
		 * This function creates a new parser object.
		 *
		 * @return 1 if the function succeeded, 0 on error.
		 */
		[CCode (cname = "yaml_parser_initialize")]
		public Parser();

		/**
		 * Set a string input.
		 *
		 * Note that the input pointer must be valid while the parser object exists.
		 * The application is responsible for destroing input after destroying the
		 * parser.
		 *
		 * @param input  A source data.
		 * @param size   The length of the source data in bytes.
		 */
		public void set_input_string(
			[CCode (array_length_type = "size_t")] uint8[] input
		);

		/**
		 * Set a file input.
		 *
		 * file should be a file object open for reading. The application is
		 * responsible for closing the file.
		 *
		 * @param file An open file.
		 */
		public void set_input_file(GLib.FileStream file);

		/**
		 * Set a generic input handler.
		 *
		 * @param handler A read handler.
		 * @param data    Any application data for passing to the read handler.
		 */
		public void set_input(ReadHandler handler);

		/**
		 * Set the source encoding.
		 *
		 * @param encoding The source encoding.
		 */
		public void set_encoding(Encoding encoding);

		/**
		 * Scan the input stream and produce the next token.
		 *
		 * Call the function subsequently to produce a sequence of tokens
		 * corresponding to the input stream. The initial token has the type
		 * ``YAML_STREAM_START_TOKEN`` while the ending token has the type
		 * ``YAML_STREAM_END_TOKEN``.
		 *
		 * An application must not alternate the calls of yaml_parser_scan() with the
		 * calls of yaml_parser_parse() or yaml_parser_load(). Doing this will break
		 * the parser.
		 *
		 * @param token  An empty token object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int scan(out Token token);

		/**
		 * Parse the input stream and produce the next parsing event.
		 *
		 * Call the function subsequently to produce a sequence of events
		 * corresponding to the input stream.  The initial event has the type
		 * ``YAML_STREAM_START_EVENT`` while the ending event has the type
		 * ``YAML_STREAM_END_EVENT``.
		 *
		 * An application must not alternate the calls of yaml_parser_parse() with the
		 * calls of yaml_parser_scan() or yaml_parser_load(). Doing this will break the
		 * parser.
		 *
		 * @param event  An empty event object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int parse(out Event event);

		/**
		 * Parse the input stream and produce the next YAML document.
		 *
		 * Call this function subsequently to produce a sequence of documents
		 * constituting the input stream.
		 *
		 * If the produced document has no root node, it means that the document
		 * end has been reached.
		 *
		 * An application must not alternate the calls of yaml_parser_load() with the
		 * calls of yaml_parser_scan() or yaml_parser_parse(). Doing this will break
		 * the parser.
		 *
		 * @param document An empty document object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int load(out Document document);
	}

	/**
	 * The prototype of a write handler.
	 *
	 * The write handler is called when the emitter needs to flush the accumulated
	 * characters to the output. The handler should write ``size`` bytes of the
	 * ``buffer`` to the output.
	 *
	 * @param data   A pointer to an application data specified by
	 *               ``yaml_emitter_set_output()``.
	 * @param buffer The buffer with bytes to be written.
	 * @param size   The size of the buffer.
	 *
	 * @return On success, the handler should return ``1``.  If the handler failed,
	 * the returned value should be ``0``.
	 */
	[CCode (cname = "yaml_write_handler_t", instance_pos = 0.1)]
	public delegate int WriteHandler(
		[CCode (array_length_type = "size_t")] uint8[] buffer
	);

	/** The emitter states. */
	[CCode (cname = "yaml_emitter_state_t", has_type_id = false)]
	public enum EmitterState {
		/** Expect STREAM-START. */
		STREAM_START,
		/** Expect the first DOCUMENT-START or STREAM-END. */
		FIRST_DOCUMENT_START,
		/** Expect DOCUMENT-START or STREAM-END. */
		DOCUMENT_START,
		/** Expect the content of a document. */
		DOCUMENT_CONTENT,
		/** Expect DOCUMENT-END. */
		DOCUMENT_END,
		/** Expect the first item of a flow sequence. */
		FLOW_SEQUENCE_FIRST_ITEM,
		/** Expect an item of a flow sequence. */
		FLOW_SEQUENCE_ITEM,
		/** Expect the first key of a flow mapping. */
		FLOW_MAPPING_FIRST_KEY,
		/** Expect a key of a flow mapping. */
		FLOW_MAPPING_KEY,
		/** Expect a value for a simple key of a flow mapping. */
		FLOW_MAPPING_SIMPLE_VALUE,
		/** Expect a value of a flow mapping. */
		FLOW_MAPPING_VALUE,
		/** Expect the first item of a block sequence. */
		BLOCK_SEQUENCE_FIRST_ITEM,
		/** Expect an item of a block sequence. */
		BLOCK_SEQUENCE_ITEM,
		/** Expect the first key of a block mapping. */
		BLOCK_MAPPING_FIRST_KEY,
		/** Expect the key of a block mapping. */
		BLOCK_MAPPING_KEY,
		/** Expect a value for a simple key of a block mapping. */
		BLOCK_MAPPING_SIMPLE_VALUE,
		/** Expect a value of a block mapping. */
		BLOCK_MAPPING_VALUE,
		/** Expect nothing. */
		END,
	}

	/**
	 * The information associated with the document nodes, used in ``Emitter``.
	 */
	public struct EmitterDocumentAssociatedInfo {
		/** The number of references. */
		int references;
		/** The anchor id. */
		int anchor;
		/** If the node has been emitted? */
		int serialized;
	}

	/**
	 * The emitter structure.
	 *
	 * All members are internal.  Manage the structure using the ``yaml_emitter_``
	 * family of functions.
	 */
	[CCode (cname = "yaml_emitter_t", destroy_function = "yaml_emitter_delete", has_type_id = false)]
	public struct Emitter {
		/* Error handling */

		/** Error type. */
		ErrorType error;
		/** Error description. */
		unowned string? problem;

		/* Writer stuff */

		/** Write handler. */
		WriteHandler write_handler;

		/** A pointer for passing to the write handler. */
		void *write_handler_data;

		/* Standard (string or file) output data. */

		/* String output data. */

		/** The buffer pointer. */
		[CCode (cname = "output.string.buffer")]
		string? output_string_buffer;
		/** The buffer size. */
		[CCode (cname = "output.string.size")]
		size_t output_string_size;
		/** The number of written bytes. */
		[CCode (cname = "output.string.size_written")]
		size_t? output_string_size_written;

		/** File output data. */
		GLib.FileStream? output_file;

		/* The working buffer. */

		/** The beginning of the working buffer. */
		string? buffer_start;
		/** The end of the working buffer. */
		string? buffer_end;
		/** The current position of the working buffer. */
		string? buffer_pointer;
		/** The last filled position of the working buffer. */
		string? buffer_last;

		/* The raw buffer. */

		/** The beginning of the buffer. */
		[CCode (cname = "raw_buffer.start")]
		string? raw_buffer_start;
		/** The end of the buffer. */
		[CCode (cname = "raw_buffer.end")]
		string? raw_buffer_end;
		/** The current position of the buffer. */
		[CCode (cname = "raw_buffer.pointer")]
		string? raw_buffer_pointer;
		/** The last filled position of the buffer. */
		[CCode (cname = "raw_buffer.last")]
		string? raw_buffer_last;

		/** The stream encoding. */
		Encoding encoding;

		/* Emitter stuff */

		/** If the output is in the canonical style? */
		int canonical;
		/** The number of indentation spaces. */
		int best_indent;
		/** The preferred width of the output lines. */
		int best_width;
		/** Allow unescaped non-ASCII characters? */
		int unicode;
		/** The preferred line break. */
		Break line_break;

		/* The stack of states. */

		/** The beginning of the stack of states. */
		[CCode (cname = "states.start")]
		EmitterState? states_start;
		/** The end of the stack of states. */
		[CCode (cname = "states.end")]
		EmitterState? states_end;
		/** The top of the stack of states. */
		[CCode (cname = "states.top")]
		EmitterState? states_top;

		/** The current emitter state. */
		EmitterState state;

		/* The event queue. */

		/** The beginning of the event queue. */
		[CCode (cname = "events.start")]
		Event? events_start;
		/** The end of the event queue. */
		[CCode (cname = "events.end")]
		Event? events_end;
		/** The head of the event queue. */
		[CCode (cname = "events.head")]
		Event? events_head;
		/** The tail of the event queue. */
		[CCode (cname = "events.tail")]
		Event? events_tail;

		/* The stack of indentation levels. */

		/** The beginning of the stack of indentation levels. */
		[CCode (cname = "indents.start")]
		int? indents_start;
		/** The end of the stack of indentation levels. */
		[CCode (cname = "indents.end")]
		int? indents_end;
		/** The top of the stack of indentation levels. */
		[CCode (cname = "indents.top")]
		int? indents_top;

		/* The list of tag directives. */

		/** The beginning of the list. */
		[CCode (cname = "tag_directives.start")]
		TagDirective? tag_directives_start;
		/** The end of the list. */
		[CCode (cname = "tag_directives.end")]
		TagDirective? tag_directives_end;
		/** The top of the list. */
		[CCode (cname = "tag_directives.top")]
		TagDirective? tag_directives_top;

		/** The current indentation level. */
		int indent;

		/** The current flow level. */
		int flow_level;

		/** Is it the document root context? */
		int root_context;
		/** Is it a sequence context? */
		int sequence_context;
		/** Is it a mapping context? */
		int mapping_context;
		/** Is it a simple mapping key context? */
		int simple_key_context;

		/** The current line. */
		int line;
		/** The current column. */
		int column;
		/** If the last character was a whitespace? */
		int whitespace;
		/** If the last character was an indentation character (' ', '-', '?', ':')? */
		int indention;
		/** If an explicit document end is required? */
		int open_ended;

		/* Anchor analysis. */

		/** The anchor value. */
		string? anchor_data_anchor;
		/** The anchor length. */
		size_t anchor_data_anchor_length;
		/** Is it an alias? */
		int anchor_data_alias;

		/* Tag analysis. */

		/** The tag handle. */
		[CCode (cname = "tag_data.handle")]
		string? tag_data_handle;
		/** The tag handle length. */
		[CCode (cname = "tag_data.handle_length")]
		size_t tag_data_handle_length;
		/** The tag suffix. */
		[CCode (cname = "tag_data.suffix")]
		string? tag_data_suffix;
		/** The tag suffix length. */
		[CCode (cname = "tag_data.suffix_length")]
		size_t tag_data_suffix_length;

		/* Scalar analysis. */

		/** The scalar value. */
		[CCode (cname = "scalar_data.value")]
		string? scalar_data_value;
		/** The scalar length. */
		[CCode (cname = "scalar_data.length")]
		size_t scalar_data_length;
		/** Does the scalar contain line breaks? */
		[CCode (cname = "scalar_data.multiline")]
		int scalar_data_multiline;
		/** Can the scalar be expessed in the flow plain style? */
		[CCode (cname = "scalar_data.flow_plain_allowed")]
		int scalar_data_flow_plain_allowed;
		/** Can the scalar be expressed in the block plain style? */
		[CCode (cname = "scalar_data.block_plain_allowed")]
		int scalar_data_block_plain_allowed;
		/** Can the scalar be expressed in the single quoted style? */
		[CCode (cname = "scalar_data.single_quoted_allowed")]
		int scalar_data_single_quoted_allowed;
		/** Can the scalar be expressed in the literal or folded styles? */
		[CCode (cname = "scalar_data.block_allowed")]
		int scalar_data_block_allowed;
		/** The output style. */
		[CCode (cname = "scalar_data.style")]
		ScalarStyle scalar_data_style;


		/** If the stream was already opened? */
		int opened;
		/** If the stream was already closed? */
		int closed;

		/* The information associated with the document nodes. */
		EmitterDocumentAssociatedInfo? anchors;

		/** The last assigned anchor id. */
		int last_anchor_id;

		/** The currently emitted document. */
		Document? document;

		/**
		 * Initialize an emitter.
		 *
		 * This function creates a new emitter object.
		 */
		[CCode (cname = "yaml_emitter_initialize")]
		public Emitter();

		/**
		 * Set a string output.
		 *
		 * The emitter will write the output characters to the ``output`` buffer of
		 * the size ``size``.  The emitter will set ``size_written`` to the number of
		 * written bytes.  If the buffer is smaller than required, the emitter
		 * produces the ``ErrorType.WRITE`` error.
		 *
		 * @param emitter      An emitter object.
		 * @param output       An output buffer.
		 * @param size         The buffer size.
		 * @param size_written he pointer to save the number of written
		 *                                  bytes.
		 */
		public void set_output_string(
			[CCode (array_length_type = "size_t")] ref uint8[] output,
			out size_t size_written
		);

		/**
		 * Set a file output.
		 *
		 * ``file`` should be a file object open for writing.
		 *
		 * @param emitter An emitter object.
		 * @param file    An open file.
		 */
		public void set_output_file(GLib.FileStream file);

		/**
		 * Set a generic output handler.
		 *
		 * @param emitter An emitter object.
		 * @param handler A write handler.
		 * @param data    Any application data for passing to the write
		 *                              handler.
		 */
		public void set_output(WriteHandler handler);

		/**
		 * Set the output encoding.
		 *
		 * @param emitter  An emitter object.
		 * @param encoding he output encoding.
		 */
		public void set_encoding(Encoding encoding);

		/**
		 * Set if the output should be in the "canonical" format as in the YAML
		 * specification.
		 *
		 * @param emitter    An emitter object.
		 * @param canonical  If the output is canonical.
		 */
		public void set_canonical(int canonical);

		/**
		 * Set the intendation increment.
		 *
		 * @param emitter An emitter object.
		 * @param indent  The indentation increment (1 < . < 10).
		 */
		public void set_indent(int indent);

		/**
		 * Set the preferred line width. ``-1`` means unlimited.
		 *
		 * @param emitter An emitter object.
		 * @param width   The preferred line width.
		 */
		public void set_width(int width);

		/**
		 * Set if unescaped non-ASCII characters are allowed.
		 *
		 * @param emitter An emitter object.
		 * @param unicode If unescaped Unicode characters are allowed.
		 */
		public void set_unicode(int unicode);

		/**
		 * Set the preferred line break.
		 *
		 * @param emitter An emitter object.
		 * @param line_break  preferred line break.
		 */
		public void set_break(Break line_break);

		/**
		 * Emit an event.
		 *
		 * The event object may be generated using the ``Parser.parse()`` function.
		 * The event object is destroyed even if the function fails.
		 *
		 * @param emitter An emitter object.
		 * @param event   An event object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int emit(ref Event event);

		/**
		 * Start a YAML stream.
		 *
		 * This function should be used before ``Emitter.dump()`` is called.
		 *
		 * @param emitter An emitter object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int open();

		/**
		 * Finish a YAML stream.
		 *
		 * This function should be used after ``Emitter.dump()`` is called.
		 *
		 * @param emitter An emitter object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int close();

		/**
		 * Emit a YAML document.
		 *
		 * The documen object may be generated using the ``Parser.load()`` function
		 * or the ``Document.Document()`` function. The emitter takes the
		 * responsibility for the document object and destroys its content after
		 * it is emitted. The document object is destroyed even if the function fails.
		 *
		 * @param emitter An emitter object.
		 * @param document  document object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int dump(ref Document document);

		/**
		 * Flush the accumulated characters to the output.
		 *
		 * @param emitter An emitter object.
		 *
		 * @return ``1`` if the function succeeded, ``0`` on error.
		 */
		public int flush();
	}
}
