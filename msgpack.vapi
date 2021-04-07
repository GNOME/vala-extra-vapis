/* MessagePack Vala Bindings
 * Copyright 2016 Guillaume Poirier-Morency <guillaumepoiriermorency@gmail.com>
 *
 * Boost Software License - Version 1.0 - August 17th, 2003
 *
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 *
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

[CCode (cheader_filename = "msgpack.h", cprefix = "MSGPACK_", lower_case_cprefix = "msgpack_")]
namespace MessagePack
{
	[CCode (cname = "msgpack_object_type", cprefix = "MSGPACK_OBJECT_")]
	public enum Type
	{
		NIL,
		BOOLEAN,
		POSITIVE_INTEGER,
		NEGATIVE_INTEGER,
		[Version (deprecated = true, deprecated_since = "1.0")]
		DOUBLE,
		[Version (since = "1.0")]
		FLOAT,
		[Version (deprecated = true, deprecated_since = "1.0")]
		RAW,
		[Version (since = "1.0")]
		STR,
		ARRAY,
		MAP,
		[Version (since = "1.0")]
		BIN,
		[Version (since = "1.0")]
		EXT
	}

	[SimpleType]
	[CCode (cname = "msgpack_object_array", has_destroy_function = false, has_type_id = false)]
	public struct Array
	{
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned MessagePack.Object[] objects;
	}

	[SimpleType]
	[CCode (cname = "msgpack_map", has_destroy_function = false, has_type_id = false)]
	public struct Map
	{
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned MessagePack.MapEntry[] entries;
	}

	[Version (deprecated = true, deprecated_since = "1.0")]
	[SimpleType]
	[CCode (cname = "msgpack_object_raw", has_destroy_function = false, has_type_id = false)]
	public struct Raw
	{
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned uint8[] raw;
	}

	[SimpleType]
	[CCode (cname = "msgpack_object_str", has_destroy_function = false, has_type_id = false)]
	public struct String
	{
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned uint8[] str;
	}

	[SimpleType]
	[CCode (cname = "msgpack_object_bin", has_destroy_function = false, has_type_id = false)]
	public struct Binary
	{
		uint8 type;
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned uint8[] ext;
	}

	[SimpleType]
	[CCode (cname = "msgpack_object_ext", has_destroy_function = false, has_type_id = false)]
	public struct Extension
	{
		uint8 type;
		[CCode (cname = "ptr", array_length_cname = "size", array_length_type = "uint32_t")]
		unowned uint8[] ext;
	}

	[SimpleType]
	[CCode (cname = "msgpack_object", has_destroy_function = false, has_type_id = false)]
	public struct Object
	{
		MessagePack.Type type;

		[CCode (cname = "via.boolean")]
		bool boolean;

		[CCode (cname = "via.u64")]
		uint64 u64;

		[CCode (cname = "via.i64")]
		int64 i64;

		[CCode (cname = "via.f64")]
		double f64;

		[CCode (cname = "via.array")]
		MessagePack.Array array;

		[Version (since = "1.0")]
		[CCode (cname = "via.map")]
		MessagePack.Map map;

		[Version (deprecated = true, deprecated_since = "1.0")]
		[CCode (cname = "via.raw")]
		MessagePack.Raw raw;

		[Version (since = "1.0")]
		[CCode (cname = "via.str")]
		MessagePack.String str;

		[Version (since = "1.0")]
		[CCode (cname = "via.bin")]
		MessagePack.Binary bin;

		[Version (since = "1.0")]
		[CCode (cname = "via.ext")]
		MessagePack.Extension ext;

		[CCode (instance_pos = 2)]
		public void print (GLib.FileStream @out);
		public bool equal (MessagePack.Object y);
	}

	[CCode (cname = "msgpack_object_kv", has_destroy_function = false, has_type_id = false)]
	public struct MapEntry
	{
		MessagePack.Object key;
		[CCode (cname = "val")]
		MessagePack.Object @value;
	}

	[CCode (cname = "msgpack_packer_write", instance_pos = 0.9)]
	public delegate int PackerWriteCallback ([CCode (array_length_type = "size_t")] uint8[] buf);

	[Compact]
	[CCode (cname = "msgpack_packer", cprefix = "msgpack_", free_function = "msgpack_packer_free", has_type_id = false)]
	public class Packer
	{
		[CCode (cname = "msgpack_packer_new")]
		public Packer ([CCode (delegate_target_pos = 0.9)] MessagePack.PackerWriteCallback callback);

		public int pack_char (char d);

		public int pack_signed_char (uint8 d);
		public int pack_short (short d);
		public int pack_int (int d);
		public int pack_long (long d);
		public int pack_long_long (long d);
		public int pack_unsigned_char (uchar d);
		public int pack_unsigned_short (ushort d);
		public int pack_unsigned_int (uint d);
		public int pack_unsigned_long (ulong d);
		public int pack_unsigned_long_long (ulong d);

		public int pack_uint8 (uint8 d);
		public int pack_uint16 (uint16 d);
		public int pack_uint32 (uint32 d);
		public int pack_uint64 (uint64 d);
		public int pack_int8 (int8 d);
		public int pack_int16 (int16 d);
		public int pack_int32 (int32 d);
		public int pack_int64 (int64 d);

		public int pack_fix_uint8 (uint8 d);
		public int pack_fix_uint16 (uint16 d);
		public int pack_fix_uint32 (uint32 d);
		public int pack_fix_uint64 (uint64 d);
		public int pack_fix_int8 (int8 d);
		public int pack_fix_int16 (int16 d);
		public int pack_fix_int32 (int32 d);
		public int pack_fix_int64 (int64 d);

		public int pack_float (float d);
		public int pack_double (double d);

		public int pack_nil ();
		public int pack_true ();
		public int pack_false ();

		public int pack_array (size_t n);

		public int pack_map (size_t n);

		[Version (since = "1.0")]
		public int pack_str (size_t l);
		[Version (since = "1.0")]
		public int pack_str_body ([CCode (array_length_type = "size_t")] uint8[] b);

		[Version (deprecated = true, deprecated_since = "1.0")]
		public int pack_raw (size_t l);
		[Version (deprecated = true, deprecated_since = "1.0")]
		public int pack_raw_body ([CCode (array_length_type = "size_t")] uint8[] b);

		[Version (since = "1.0")]
		public int pack_v4raw (size_t l);
		[Version (since = "1.0")]
		public int pack_v4raw_body ([CCode (array_length_type = "size_t")] uint8[] b);

		[Version (since = "1.0")]
		public int pack_bin (size_t l);
		[Version (since = "1.0")]
		public int pack_bin_body ([CCode (array_length_type = "size_t")] uint8[] b);

		[Version (since = "1.0")]
		public int pack_ext (size_t l, int8 type);
		[Version (since = "1.0")]
		public int pack_ext_body ([CCode (array_length_type = "size_t")] uint8[] b);

		public int pack_object (MessagePack.Object d);
	}

	public const size_t ZONE_CHUNK_SIZE;

	[Compact]
	[CCode (cname = "msgpack_zone", has_type_id = false)]
	public class Zone
	{
		public Zone (size_t chunk_size = MessagePack.ZONE_CHUNK_SIZE);
		public bool is_empty ();
		public void clear ();
		public void* malloc_expand (size_t size);
	}

	[CCode (cname = "msgpack_unpack_return", cprefix = "MSGPACK_UNPACK_")]
	public enum UnpackReturn
	{
		SUCCESS,
		EXTRA_BYTES,
		CONTINUE,
		PARSE_ERROR,
		NOMEM_ERROR
	}

	[CCode (cname = "msgpack_unpacked", has_type_id = false)]
	public struct Unpacked
	{
		MessagePack.Object data;
		[CCode (cname = "msgpack_unpacked_init")]
		public Unpacked ();
		public MessagePack.Zone release_zone ();
		[CCode (cname = "msgpack_unpack_next")]
		public MessagePack.UnpackReturn next ([CCode (array_length_type = "size_t")] uint8[] data, out size_t? off = null);
	}

	public const size_t UNPACKER_INIT_BUFFER_SIZE;
	public const size_t UNPACKER_RESERVE_SIZE;

	[Compact]
	[CCode (cname = "msgpack_unpacker", has_type_id = false)]
	public class Unpacker
	{
		public Unpacker (size_t initial_buffer_size = MessagePack.UNPACKER_INIT_BUFFER_SIZE);
		public bool reserve_buffer (size_t size = MessagePack.UNPACKER_RESERVE_SIZE);
		[CCode (cname = "msgpack_unpacker_buffer", array_length = false)]
		private unowned uint8[] _buffer ();
		[CCode (cname = "vala_buffer")]
		public unowned uint8[] buffer ()
		{
			unowned uint8[] buf = _buffer ();
			buf.length = (int) buffer_capacity ();
			return buf;
		}
		public size_t buffer_capacity ();
		public void buffer_consumed (size_t size);
		public UnpackReturn next (out MessagePack.Unpacked pac);
		public int execute ();
		public unowned MessagePack.Object data ();
		public MessagePack.Zone release_zone ();
		public void reset_zone ();
		public void reset ();
		public size_t message_size ();
		public size_t parsed_size ();
		public bool flush_zone ();
		public bool expand_buffer (size_t size);
	}
}
