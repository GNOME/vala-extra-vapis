/*
 * Alure1 binding for Vala
 *
 * Copyright 2020 Anton "Vuvk" Shcherbatykh <vuvk69@gmail.com>
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

using AL;
using ALC;

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/alure.h")]
namespace Alure
{
    [CCode (cname = "alureGetVersion")]
    public void get_version(out ALuint major, out ALuint minor);
    [CCode (cname = "alureGetErrorString")]
    public unowned string? get_error_string();

    [CCode (cname = "alureGetDeviceNames", array_length = false)]
    public unowned string?[] get_device_names(bool all, out ALCsizei count);
    [CCode (cname = "alureFreeDeviceNames")]
    public void free_device_names([CCode (array_length = false)]string?[] names);

    [CCode (cname = "alureInitDevice")]
    public bool init_device(string? name = null, [CCode (array_length = false)] ALCint[]? attribs = null);
    [CCode (cname = "alureShutdownDevice")]
    public bool shutdown_device();

    [CCode (cname = "alureGetSampleFormat")]
    public ALenum get_sample_format(ALuint channels, ALuint bits, ALuint floatbits);

    [CCode (cname = "alureSleep")]
    public bool sleep(ALfloat duration);

    [CCode (cname = "alureStreamSizeIsMicroSec")]
    public bool stream_size_is_microsec(bool useus);

    [CCode (cname = "alureCreateBufferFromFile")]
    public ALuint create_buffer_from_file(string fname);
    [CCode (cname = "alureCreateBufferFromMemory")]
    public ALuint create_buffer_from_memory(ALubyte[] data);
    [CCode (cname = "alureBufferDataFromFile")]
    public bool buffer_data_from_file(string fname, ALuint buffer);
    [CCode (cname = "alureBufferDataFromMemory")]
    public bool buffer_data_from_memory(ALubyte[] fdata, ALuint buffer);

    [CCode (has_target = false)]
    public delegate ALuint CallbackCreateStream(void* userdata, [CCode (array_length = false)] ALubyte[] data, ALuint bytes);

    [Compact]
    [CCode (cname = "alureStream", has_type_id = false, free_function = "")]
    public class Stream {
        [CCode (cname = "alureCreateStreamFromFile")]
        public Stream.from_file(string fname, ALsizei chunk_length, ALsizei num_bufs = 0, [CCode (array_length = false)] ALuint[]? bufs = null);

        [CCode (cname = "alureCreateStreamFromMemory")]
        public Stream.from_memory(ALubyte[] data, ALsizei chunk_length, ALsizei num_bufs = 0, [CCode (array_length = false)] ALuint[]? bufs = null);

        [CCode (cname = "alureCreateStreamFromStaticMemory")]
        public Stream.from_static_memory(ALubyte[] data, ALsizei chunk_length, ALsizei num_bufs = 0, [CCode (array_length = false)] ALuint[]? bufs = null);

        [CCode (cname = "alureCreateStreamFromCallback")]
        public Stream.from_callback(CallbackCreateStream callback,
                                    ALenum format, ALuint samplerate,
                                    ALsizei chunk_length, ALsizei num_bufs = 0,
                                    [CCode (array_length = false)] ALuint[]? bufs = null);

        [CCode (cname = "alureGetStreamLength")]
        public int64 get_length();

        [CCode (cname = "alureGetStreamFrequency")]
        public ALsizei get_frequency();

        [CCode (cname = "alureBufferDataFromStream")]
        public ALsizei buffer_data(ALsizei num_bufs, [CCode (array_length = false)]ALuint[] bufs);

        [CCode (cname = "alureRewindStream")]
        public bool rewind();

        [CCode (cname = "alureSetStreamOrder")]
        public bool set_order(ALuint order);

        [CCode (cname = "alureSetStreamPatchset")]
        public bool set_patchset(string patchset);

        /** you must destroy stream manually! */
        [CCode (cname = "alureDestroyStream")]
        public bool destroy(ALsizei num_bufs = 0, [CCode (array_length = false)] ALuint[]? bufs = null);
    }

    [CCode (cname = "alureUpdate")]
    public void update();
    [CCode (cname = "alureUpdateInterval")]
    public bool update_interval(ALfloat interval);

    [CCode (has_target = false)]
    public delegate void Callback(void* userdata, ALuint source);

    [CCode (cname = "alurePlaySourceStream")]
    public bool play_source_stream(ALuint source, Stream stream, ALsizei num_bufs, ALsizei loopcount, Callback eos_callback, void* userdata = null);
    [CCode (cname = "alurePlaySource")]
    public bool play_source(ALuint source, Callback callback, void* userdata = null);
    [CCode (cname = "alureStopSource")]
    public bool stop_source(ALuint source, bool run_callback);
    [CCode (cname = "alurePauseSource")]
    public bool pause_source(ALuint source);
    [CCode (cname = "alureResumeSource")]
    public bool resume_source(ALuint source);

    [CCode (has_target = false)]
    public delegate void*  OpenFileCallback(string name);
    [CCode (has_target = false)]
    public delegate void*  OpenMemCallback(ALubyte[] buffer);
    [CCode (has_target = false)]
    public delegate bool   GetFormatCallback(void* instance, out ALenum format, out ALuint samplerate, out ALuint blocksize);
    [CCode (has_target = false)]
    public delegate ALuint DecodeCallback(void* instance, [CCode (array_length = false)]ALubyte[] data, ALuint bytes);
    [CCode (has_target = false)]
    public delegate bool   RewindCallback(void* instance);
    [CCode (has_target = false)]
    public delegate void   CloseCallback(void* instance);

    [CCode (cname = "alureInstallDecodeCallbacks")]
    public bool install_decode_callbacks(
        int index,
        OpenFileCallback  open_file,
        OpenMemCallback   open_mem,
        GetFormatCallback get_format,
        DecodeCallback    decode,
        RewindCallback    rewind,
        CloseCallback     close
    );

    [CCode (cname = "int")]
    public enum Seek {
        SET = 0,
        CUR = -1,
        END = -2
    }

    [CCode (has_target = false)]
    public delegate void*   OpenCallback(string filename, ALuint mode = 0);
    [CCode (has_target = false)]
    public delegate ALsizei ReadCallback(void* handle, [CCode (array_length = false)] ALubyte[] buf, ALuint bytes);
    [CCode (has_target = false)]
    public delegate ALsizei WriteCallback(void* handle, [CCode (array_length = false)] ALubyte[] buf, ALuint bytes);
    [CCode (has_target = false)]
    public delegate int64   SeekCallback(void* handle, int64 offset, int whence);

    [CCode (cname = "alureSetIOCallbacks")]
    public bool set_io_callbacks(
        OpenCallback  open,
        CloseCallback close,
        ReadCallback  read,
        WriteCallback write,
        SeekCallback  seek
    );

    [CCode (cname = "alureGetProcAddress")]
    public void* get_proc_address(string funcname);
}
