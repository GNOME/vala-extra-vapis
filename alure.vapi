/*
 * Alure1 binding for Vala
 *
 * Copyright 2020-2021 Anton "Vuvk" Shcherbatykh <vuvk69@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "AL/alure.h")]
namespace Alure
{
	[CCode (cname = "alureGetVersion")]
	public void get_version (out AL.Uint major, out AL.Uint minor);
	[CCode (cname = "alureGetErrorString")]
	public unowned string? get_error_string ();

	[CCode (cname = "alureGetDeviceNames", array_length = false)]
	public unowned string?[] get_device_names (bool all, out ALC.Sizei count);
	[CCode (cname = "alureFreeDeviceNames")]
	public void free_device_names ([CCode (array_length = false)] string?[] names);

	[CCode (cname = "alureInitDevice")]
	public bool init_device (string? name = null, [CCode (array_length = false)] ALC.Int[]? attribs = null);
	[CCode (cname = "alureShutdownDevice")]
	public bool shutdown_device ();

	[CCode (cname = "alureGetSampleFormat")]
	public AL.Enum get_sample_format (AL.Uint channels, AL.Uint bits, AL.Uint float_bits);

	[CCode (cname = "alureSleep")]
	public bool sleep (AL.Float duration);

	[CCode (cname = "alureStreamSizeIsMicroSec")]
	public bool stream_size_is_microsec (bool useus);

	[CCode (cname = "alureCreateBufferFromFile")]
	public AL.Uint create_buffer_from_file (string fname);
	[CCode (cname = "alureCreateBufferFromMemory")]
	public AL.Uint create_buffer_from_memory (AL.Ubyte[] data);
	[CCode (cname = "alureBufferDataFromFile")]
	public bool buffer_data_from_file (string fname, AL.Uint buffer);
	[CCode (cname = "alureBufferDataFromMemory")]
	public bool buffer_data_from_memory (AL.Ubyte[] fdata, AL.Uint buffer);

	[CCode (instance_pos = 0.1, has_typedef = false)]
	public delegate AL.Uint CreateStreamCallback ([CCode (array_length = false)] AL.Ubyte[] data, AL.Uint bytes);

	[Compact]
	[CCode (cname = "alureStream", has_type_id = false, free_function = "")]
	public class Stream {
		[CCode (cname = "alureCreateStreamFromFile")]
		public Stream.from_file (string fname, AL.Sizei chunk_length, AL.Sizei num_bufs = 0, [CCode (array_length = false)] AL.Uint[]? bufs = null);

		[CCode (cname = "alureCreateStreamFromMemory")]
		public Stream.from_memory (AL.Ubyte[] data, AL.Sizei chunk_length, AL.Sizei num_bufs = 0, [CCode (array_length = false)] AL.Uint[]? bufs = null);

		[CCode (cname = "alureCreateStreamFromStaticMemory")]
		public Stream.from_static_memory (AL.Ubyte[] data, AL.Sizei chunk_length, AL.Sizei num_bufs = 0, [CCode (array_length = false)] AL.Uint[]? bufs = null);

		[CCode (cname = "alureCreateStreamFromCallback")]
		public Stream.from_callback (CreateStreamCallback callback, AL.Enum format, AL.Uint samplerate, AL.Sizei chunk_length, AL.Sizei num_bufs = 0, [CCode (array_length = false)] AL.Uint[]? bufs = null);

		[CCode (cname = "alureGetStreamLength")]
		public int64 get_length ();

		[CCode (cname = "alureGetStreamFrequency")]
		public AL.Sizei get_frequency ();

		[CCode (cname = "alureBufferDataFromStream")]
		public AL.Sizei buffer_data (AL.Sizei num_bufs, [CCode (array_length = false)]AL.Uint[] bufs);

		[CCode (cname = "alureRewindStream")]
		public bool rewind ();

		[CCode (cname = "alureSetStreamOrder")]
		public bool set_order (AL.Uint order);

		[CCode (cname = "alureSetStreamPatchset")]
		public bool set_patchset (string patchset);

		/** you must destroy stream manually! */
		[CCode (cname = "alureDestroyStream")]
		public bool destroy (AL.Sizei num_bufs = 0, [CCode (array_length = false)] AL.Uint[]? bufs = null);
	}

	[CCode (cname = "alureUpdate")]
	public void update ();
	[CCode (cname = "alureUpdateInterval")]
	public bool update_interval (AL.Float interval);

	[CCode (has_target = false, has_typedef = false)]
	public delegate void Callback (void* userdata, AL.Uint source);

	[CCode (cname = "alurePlaySourceStream")]
	public bool play_source_stream (AL.Uint source, Stream stream, AL.Sizei num_bufs, AL.Sizei loopcount, Callback eos_callback, void* userdata = null);
	[CCode (cname = "alurePlaySource")]
	public bool play_source (AL.Uint source, Callback callback, void* userdata = null);
	[CCode (cname = "alureStopSource")]
	public bool stop_source (AL.Uint source, bool run_callback);
	[CCode (cname = "alurePauseSource")]
	public bool pause_source (AL.Uint source);
	[CCode (cname = "alureResumeSource")]
	public bool resume_source (AL.Uint source);

	[CCode (has_target = false, has_typedef = false)]
	public delegate void* OpenFileCallback (string name);
	[CCode (has_target = false, has_typedef = false)]
	public delegate void* OpenMemCallback ([CCode (array_length_type = "uint")] AL.Ubyte[] buffer);
	[CCode (has_target = false, has_typedef = false)]
	public delegate AL.Boolean GetFormatCallback (void* instance, out AL.Enum format, out AL.Uint samplerate, out AL.Uint blocksize);
	[CCode (has_target = false, has_typedef = false)]
	public delegate AL.Uint DecodeCallback (void* instance, [CCode (array_length = false)] AL.Ubyte[] data, AL.Uint bytes);
	[CCode (has_target = false, has_typedef = false)]
	public delegate AL.Boolean RewindCallback (void* instance);
	[CCode (has_target = false, has_typedef = false)]
	public delegate void CloseCallback (void* instance);

	[CCode (cname = "alureInstallDecodeCallbacks")]
	public bool install_decode_callbacks (
		int index,
		OpenFileCallback open_file_callback,
		OpenMemCallback open_mem_callback,
		GetFormatCallback get_format_callback,
		DecodeCallback decode_callback,
		RewindCallback rewind_callback,
		CloseCallback close_callback
	);

	[CCode (cname = "int", has_type_id = false, cheader_filename = "stdio.h")]
	public enum Seek {
		SET = 0,
		CUR = -1,
		END = -2
	}

	[CCode (has_target = false, has_typedef = false)]
	public delegate void* OpenCallback (string filename, AL.Uint mode = 0);
	[CCode (has_target = false, has_typedef = false)]
	public delegate AL.Sizei ReadCallback (void* handle, [CCode (array_length = false)] AL.Ubyte[] buf, AL.Uint bytes);
	[CCode (has_target = false, has_typedef = false)]
	public delegate AL.Sizei WriteCallback (void* handle, [CCode (array_length = false)] AL.Ubyte[] buf, AL.Uint bytes);
	[CCode (has_target = false, has_typedef = false)]
	public delegate int64 SeekCallback (void* handle, int64 offset, Seek whence);

	[CCode (cname = "alureSetIOCallbacks")]
	public bool set_io_callbacks (
		OpenCallback open_callback,
		CloseCallback close_callback,
		ReadCallback read_callback,
		WriteCallback write_callback,
		SeekCallback seek_callback
	);

	[CCode (cname = "alureGetProcAddress")]
	public void* get_proc_address (string funcname);
}
