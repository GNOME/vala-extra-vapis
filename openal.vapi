/*
 * OpenAL bindings for Vala
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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/al.h")]
namespace AL
{
    // 8-bit boolean
    [CCode (cname="ALboolean", has_type_id = false)]
    public struct ALboolean : int8 {}

    // character
    [CCode (cname="ALchar", has_type_id = false)]
    public struct ALchar : char {}

    // signed 8-bit 2's complement integer
    [CCode (cname="ALbyte", has_type_id = false)]
    public struct ALbyte : int8 {}

    // unsigned 8-bit integer
    [CCode (cname="ALubyte", has_type_id = false)]
    public struct ALubyte : uint8 {}

    // signed 16-bit 2's complement integer
    [CCode (cname="ALshort", has_type_id = false)]
    public struct ALshort : int16 {}

    // unsigned 16-bit integer
    [CCode (cname="ALushort", has_type_id = false)]
    public struct ALushort : uint16 {}

    // signed 32-bit 2's complement integer
    [CCode (cname="ALint", has_type_id = false)]
    public struct ALint : int32 {}

    // unsigned 32-bit integer
    [CCode (cname="ALuint", has_type_id = false)]
    public struct ALuint : uint32 {}

    // non-negative 32-bit binary integer size
    [CCode (cname="ALsizei", has_type_id = false)]
    public struct ALsizei : int32 {}

    // enumerated 32-bit value
    [CCode (cname="ALenum", has_type_id = false)]
    public struct ALenum : int32 {}

    // 32-bit IEEE754 floating-point
    [CCode (cname="ALfloat", has_type_id = false)]
    public struct ALfloat : float {}

    // 64-bit IEEE754 floating-point
    [CCode (cname="ALdouble", has_type_id = false)]
    public struct ALdouble : double {}

    // void type (for opaque pointers only)
    [CCode (cname="ALvoid", has_type_id = false)]
    public struct ALvoid {}

    /** "no distance model" or "no buffer" */
    [CCode (cname="AL_NONE")]
    public const ALenum NONE;

    /** Boolean False. */
    [CCode (cname="AL_FALSE")]
    public const ALenum FALSE;

    /** Boolean True. */
    [CCode (cname="AL_TRUE")]
    public const ALenum TRUE;

    /**
    * Relative source.
    * Type:    ALboolean
    * Range:   [AL_TRUE, AL_FALSE]
    * Default: AL_FALSE
    *
    * Specifies if the Source has relative coordinates.
    */
    [CCode (cname="AL_SOURCE_RELATIVE")]
    public const ALenum SOURCE_RELATIVE;

    /**
    * Inner cone angle, in degrees.
    * Type:    ALint, ALfloat
    * Range:   [0 - 360]
    * Default: 360
    *
    * The angle covered by the inner cone, where the source will not attenuate.
    */
    [CCode (cname="AL_CONE_INNER_ANGLE")]
    public const ALenum CONE_INNER_ANGLE;

    /**
    * Outer cone angle, in degrees.
    * Range:   [0 - 360]
    * Default: 360
    *
    * The angle covered by the outer cone, where the source will be fully
    * attenuated.
    */
    [CCode (cname="AL_CONE_OUTER_ANGLE")]
    public const ALenum CONE_OUTER_ANGLE;

    /**
    * Source pitch.
    * Type:    ALfloat
    * Range:   [0.5 - 2.0]
    * Default: 1.0
    *
    * A multiplier for the frequency (sample rate) of the source's buffer.
    */
    [CCode (cname="AL_PITCH")]
    public const ALenum PITCH;

    /**
    * Source or listener position.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * The source or listener location in three dimensional space.
    *
    * OpenAL, like OpenGL, uses a right handed coordinate system, where in a
    * frontal default view X (thumb) points right, Y points up (index finger), and
    * Z points towards the viewer/camera (middle finger).
    *
    * To switch from a left handed coordinate system, flip the sign on the Z
    * coordinate.
    */
    [CCode (cname="AL_POSITION")]
    public const ALenum POSITION;

    /**
    * Source direction.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * Specifies the current direction in local space.
    * A zero-length vector specifies an omni-directional source (cone is ignored).
    */
    [CCode (cname="AL_DIRECTION")]
    public const ALenum DIRECTION;

    /**
    * Source or listener velocity.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * Specifies the current velocity in local space.
    */
    [CCode (cname="AL_VELOCITY")]
    public const ALenum VELOCITY;

    /**
    * Source looping.
    * Type:    ALboolean
    * Range:   [AL_TRUE, AL_FALSE]
    * Default: AL_FALSE
    *
    * Specifies whether source is looping.
    */
    [CCode (cname="AL_LOOPING")]
    public const ALenum LOOPING;

    /**
    * Source buffer.
    * Type:  ALuint
    * Range: any valid Buffer.
    *
    * Specifies the buffer to provide sound samples.
    */
    [CCode (cname="AL_BUFFER")]
    public const ALenum BUFFER;

    /**
    * Source or listener gain.
    * Type:  ALfloat
    * Range: [0.0 - ]
    *
    * A value of 1.0 means unattenuated. Each division by 2 equals an attenuation
    * of about -6dB. Each multiplicaton by 2 equals an amplification of about
    * +6dB.
    *
    * A value of 0.0 is meaningless with respect to a logarithmic scale; it is
    * silent.
    */
    [CCode (cname="AL_GAIN")]
    public const ALenum GAIN;

    /**
    * Minimum source gain.
    * Type:  ALfloat
    * Range: [0.0 - 1.0]
    *
    * The minimum gain allowed for a source, after distance and cone attenation is
    * applied (if applicable).
    */
    [CCode (cname="AL_MIN_GAIN")]
    public const ALenum MIN_GAIN;

    /**
    * Maximum source gain.
    * Type:  ALfloat
    * Range: [0.0 - 1.0]
    *
    * The maximum gain allowed for a source, after distance and cone attenation is
    * applied (if applicable).
    */
    [CCode (cname="AL_MAX_GAIN")]
    public const ALenum MAX_GAIN;

    /**
    * Listener orientation.
    * Type: ALfloat[6]
    * Default: {0.0, 0.0, -1.0, 0.0, 1.0, 0.0}
    *
    * Effectively two three dimensional vectors. The first vector is the front (or
    * "at") and the second is the top (or "up").
    *
    * Both vectors are in local space.
    */
    [CCode (cname="AL_ORIENTATION")]
    public const ALenum ORIENTATION;

    /**
    * Source state (query only).
    * Type:  ALint
    * Range: [AL_INITIAL, AL_PLAYING, AL_PAUSED, AL_STOPPED]
    */
    [CCode (cname="AL_SOURCE_STATE")]
    public const ALenum SOURCE_STATE;

    /** Source state value. */
    [CCode (cname = "ALint", cprefix = "AL_", has_type_id = false)]
    public enum SourceState {
        INITIAL,
        PLAYING,
        PAUSED,
        STOPPED
    }

    /**
    * Source Buffer Queue size (query only).
    * Type: ALint
    *
    * The number of buffers queued using alSourceQueueBuffers, minus the buffers
    * removed with alSourceUnqueueBuffers.
    */
    [CCode (cname="AL_BUFFERS_QUEUED")]
    public const ALenum BUFFERS_QUEUED;

    /**
    * Source Buffer Queue processed count (query only).
    * Type: ALint
    *
    * The number of queued buffers that have been fully processed, and can be
    * removed with alSourceUnqueueBuffers.
    *
    * Looping sources will never fully process buffers because they will be set to
    * play again for when the source loops.
    */
    [CCode (cname="AL_BUFFERS_PROCESSED")]
    public const ALenum BUFFERS_PROCESSED;

    /**
    * Source reference distance.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * The distance in units that no attenuation occurs.
    *
    * At 0.0, no distance attenuation ever occurs on non-linear attenuation models.
    */
    [CCode (cname="AL_REFERENCE_DISTANCE")]
    public const ALenum REFERENCE_DISTANCE;

    /**
    * Source rolloff factor.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * Multiplier to exaggerate or diminish distance attenuation.
    *
    * At 0.0, no distance attenuation ever occurs.
    */
    [CCode (cname="AL_ROLLOFF_FACTOR")]
    public const ALenum ROLLOFF_FACTOR;

    /**
    * Outer cone gain.
    * Type:    ALfloat
    * Range:   [0.0 - 1.0]
    * Default: 0.0
    *
    * The gain attenuation applied when the listener is outside of the source's
    * outer cone.
    */
    [CCode (cname="AL_CONE_OUTER_GAIN")]
    public const ALenum CONE_OUTER_GAIN;

    /**
    * Source maximum distance.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: +inf
    *
    * The distance above which the source is not attenuated any further with a
    * clamped distance model, or where attenuation reaches 0.0 gain for linear
    * distance models with a default rolloff factor.
    */
    [CCode (cname="AL_MAX_DISTANCE")]
    public const ALenum MAX_DISTANCE;

    [CCode (cname = "ALenum", cprefix = "AL_", has_type_id = false)]
    public enum SourceBufferPosition {
        /** Source buffer position, in seconds */
        SEC_OFFSET,
        /** Source buffer position, in sample frames */
        SAMPLE_OFFSET,
        /** Source buffer position, in bytes */
        BYTE_OFFSET
    }

    /**
    * Source type (query only).
    * Type:  ALint
    * Range: [AL_STATIC, AL_STREAMING, AL_UNDETERMINED]
    *
    * A Source is Static if a Buffer has been attached using AL_BUFFER.
    *
    * A Source is Streaming if one or more Buffers have been attached using
    * alSourceQueueBuffers.
    *
    * A Source is Undetermined when it has the NULL buffer attached using
    * AL_BUFFER.
    */
    [CCode (cname="AL_SOURCE_TYPE")]
    public const ALenum SOURCE_TYPE;

    /** Source type value. */
    [CCode (cname = "ALint", cprefix = "AL_", has_type_id = false)]
    public enum SourceType {
        STATIC,
        STREAMING,
        UNDETERMINED
    }

    /** Buffer format specifier. */
    [CCode (cname = "ALenum", cprefix = "AL_FORMAT_", has_type_id = false)]
    public enum BufferFormat {
        MONO8,
        MONO16,
        STEREO8,
        STEREO16
    }

    /** Buffer frequency (query only). */
    [CCode (cname="AL_FREQUENCY")]
    public const ALenum FREQUENCY;
    /** Buffer bits per sample (query only). */
    [CCode (cname="AL_BITS")]
    public const ALenum BITS;
    /** Buffer channel count (query only). */
    [CCode (cname="AL_CHANNELS")]
    public const ALenum CHANNELS;
    /** Buffer data size (query only). */
    [CCode (cname="AL_SIZE")]
    public const ALenum SIZE;

    /**
    * Buffer state.
    *
    * Not for public use.
    */
    [CCode (cname = "ALenum", cprefix = "AL_", has_type_id = false)]
    public enum BufferState {
        UNUSED,
        PENDING,
        PROCESSED
    }

    [CCode (cname = "ALenum", cprefix = "AL_", has_type_id = false)]
    public enum Error {
        /** No error. */
        NO_ERROR,
        /** Invalid name paramater passed to AL call. */
        INVALID_NAME,
        /** Invalid enum parameter passed to AL call. */
        INVALID_ENUM,
        /** Invalid value parameter passed to AL call. */
        INVALID_VALUE,
        /** Illegal AL call. */
        INVALID_OPERATION
        /** Not enough memory. */,
        OUT_OF_MEMORY
    }

    /** Context string: Vendor ID. */
    [CCode (cname="AL_VENDOR")]
    public const ALenum VENDOR;
    /** Context string: Version. */
    [CCode (cname="AL_VERSION")]
    public const ALenum VERSION;
    /** Context string: Renderer ID. */
    [CCode (cname="AL_RENDERER")]
    public const ALenum RENDERER;
    /** Context string: Space-separated extension list. */
    [CCode (cname="AL_EXTENSIONS")]
    public const ALenum EXTENSIONS;

    /**
    * Doppler scale.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * Scale for source and listener velocities.
    */
    [CCode (cname="AL_DOPPLER_FACTOR")]
    public const ALenum DOPPLER_FACTOR;

    /**
    * Doppler velocity (deprecated).
    *
    * A multiplier applied to the Speed of Sound.
    */
    [CCode (cname="AL_DOPPLER_VELOCITY")]
    public const ALenum DOPPLER_VELOCITY;

    /**
    * Speed of Sound, in units per second.
    * Type:    ALfloat
    * Range:   [0.0001 - ]
    * Default: 343.3
    *
    * The speed at which sound waves are assumed to travel, when calculating the
    * doppler effect.
    */
    [CCode (cname="AL_SPEED_OF_SOUND")]
    public const ALenum SPEED_OF_SOUND;

    /**
    * Distance attenuation model.
    * Type:    ALint
    * Range:   [AL_NONE, AL_INVERSE_DISTANCE, AL_INVERSE_DISTANCE_CLAMPED,
    *           AL_LINEAR_DISTANCE, AL_LINEAR_DISTANCE_CLAMPED,
    *           AL_EXPONENT_DISTANCE, AL_EXPONENT_DISTANCE_CLAMPED]
    * Default: AL_INVERSE_DISTANCE_CLAMPED
    *
    * The model by which sources attenuate with distance.
    *
    * None     - No distance attenuation.
    * Inverse  - Doubling the distance halves the source gain.
    * Linear   - Linear gain scaling between the reference and max distances.
    * Exponent - Exponential gain dropoff.
    *
    * Clamped variations work like the non-clamped counterparts, except the
    * distance calculated is clamped between the reference and max distances.
    */
    [CCode (cname="AL_DISTANCE_MODEL")]
    public const ALenum DISTANCE_MODEL;

    /** Distance model value. */
    [CCode (cname = "ALint", cprefix = "AL_", has_type_id = false)]
    public enum DistanceModel {
        INVERSE_DISTANCE,
        INVERSE_DISTANCE_CLAMPED,
        LINEAR_DISTANCE,
        LINEAR_DISTANCE_CLAMPED,
        EXPONENT_DISTANCE,
        EXPONENT_DISTANCE_CLAMPED
    }

    [CCode (cname="alDopplerFactor")]
    public void doppler_factor(ALfloat value);
    [CCode (cname="alDopplerVelocity")]
    public void doppler_velocity(ALfloat value);
    [CCode (cname="alSpeedOfSound")]
    public void speed_of_sound(ALfloat value);
    [CCode (cname="alDistanceModel")]
    public void distance_model(DistanceModel distanceModel);

    /** Renderer State management. */
    [CCode (cname="alEnable")]
    public void enable(ALenum capability);
    [CCode (cname="alDisable")]
    public void disable(ALenum capability);
    [CCode (cname="alIsEnabled")]
    public bool is_enabled(ALenum capability);

    /** State retrieval. */
    [CCode (cname="alGetString")]
    public unowned string? get_string(ALenum param);
    [CCode (cname="alGetBooleanv")]
    public void get_booleanv(ALenum param, [CCode (array_length = false)]ALboolean[] values);
    [CCode (cname="alGetIntegerv")]
    public void get_integerv(ALenum param, [CCode (array_length = false)]ALint[] values);
    [CCode (cname="alGetFloatv")]
    public void get_floatv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
    [CCode (cname="alGetDoublev")]
    public void get_doublev(ALenum param, [CCode (array_length = false)]ALdouble[] values);
    [CCode (cname="alGetBoolean")]
    public bool get_boolean(ALenum param);
    [CCode (cname="alGetInteger")]
    public ALint get_integer(ALenum param);
    [CCode (cname="alGetFloat")]
    public ALfloat get_float(ALenum param);
    [CCode (cname="alGetDouble")]
    public ALdouble get_double(ALenum param);

    /**
    * Error retrieval.
    *
    * Obtain the first error generated in the AL context since the last check.
    */
    [CCode (cname="alGetError")]
    public Error get_error();

    /**
    * Extension support.
    *
    * Query for the presence of an extension, and obtain any appropriate function
    * pointers and enum values.
    */
    [CCode (cname="alIsExtensionPresent")]
    public bool is_extension_present(string extname);
    [CCode (cname="alGetProcAddress")]
    public void* get_proc_address(string fname);
    [CCode (cname="alGetEnumValue")]
    public ALenum get_enum_value(string ename);

    [Compact]
    [CCode (has_type_id = false)]
    public class Listener {
        /** Set Listener parameters */
        [CCode (cname="alListenerf")]
        public static void set_paramf(ALenum param, ALfloat value);
        [CCode (cname="alListener3f")]
        public static void set_param3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
        [CCode (cname="alListenerfv")]
        public static void set_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alListeneri")]
        public static void set_parami(ALenum param, ALint value);
        [CCode (cname="alListener3i")]
        public static void set_param3i(ALenum param, ALint value1, ALint value2, ALint value3);
        [CCode (cname="alListeneriv")]
        public static void set_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);

        /** Get Listener parameters */
        [CCode (cname="alGetListenerf")]
        public static void get_paramf(ALenum param, out ALfloat value);
        [CCode (cname="alGetListener3f")]
        public static void get_param3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
        [CCode (cname="alGetListenerfv")]
        public static void get_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alGetListeneri")]
        public static void get_parami(ALenum param, out ALint value);
        [CCode (cname="alGetListener3i")]
        public static void get_param3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
        [CCode (cname="alGetListeneriv")]
        public static void get_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);
    }

    [SimpleType]
    [CCode (cname="ALuint", has_type_id = false)]
    public struct Source : ALuint {
        /** Set Source parameters. */
        [CCode (cname="alSourcef")]
        public void set_paramf(ALenum param, ALfloat value);
        [CCode (cname="alSource3f")]
        public void set_param3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
        [CCode (cname="alSourcefv")]
        public void set_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alSourcei")]
        public void set_parami(ALenum param, ALint value);
        [CCode (cname="alSource3i")]
        public void set_param3i(ALenum param, ALint value1, ALint value2, ALint value3);
        [CCode (cname="alSourceiv")]
        public void set_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);

        /** Get Source parameters. */
        [CCode (cname="alGetSourcef")]
        public void get_paramf(ALenum param, out ALfloat value);
        [CCode (cname="alGetSource3f")]
        public void get_param3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
        [CCode (cname="alGetSourcefv")]
        public void get_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alGetSourcei")]
        public void get_parami( ALenum param, out ALint value);
        [CCode (cname="alGetSource3i")]
        public void get_param3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
        [CCode (cname="alGetSourceiv")]
        public void get_paramiv(ALenum param, [CCode (array_length = false)]ALint[]values);

        /** Play, replay, or resume (if paused) a list of Sources */
        [CCode (cname="alSourcePlayv")]
        public static void playv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Stop a list of Sources */
        [CCode (cname="alSourceStopv")]
        public static void stopv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Rewind a list of Sources */
        [CCode (cname="alSourceRewindv")]
        public static void rewindv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Pause a list of Sources */
        [CCode (cname="alSourcePausev")]
        public static void pausev(ALsizei n, [CCode (array_length = false)]Source[] sources);

        /** Play, replay, or resume a Source */
        [CCode (cname="alSourcePlay")]
        public void play();
        /** Stop a Source */
        [CCode (cname="alSourceStop")]
        public void stop();
        /** Rewind a Source (set playback postiton to beginning) */
        [CCode (cname="alSourceRewind")]
        public void rewind();
        /** Pause a Source */
        [CCode (cname="alSourcePause")]
        public void pause();

        /** Queue buffers onto a source */
        [CCode (cname="alSourceQueueBuffers")]
        public void queue_buffers(ALsizei nb, [CCode (array_length = false)]ALuint[] buffers);
        [CCode (cname="alSourceQueueBuffers")]
        public void queue_buffer(ALsizei nb, ref ALuint buffer);
        /** Unqueue processed buffers from a source */
        [CCode (cname="alSourceUnqueueBuffers")]
        public void unqueue_buffers(ALsizei nb, [CCode (array_length = false)]ALuint[] buffers);
        [CCode (cname="alSourceUnqueueBuffers")]
        public void unqueue_buffer(ALsizei nb, ref ALuint buffer);
    }

    /** Create Source objects. */
    [CCode (cname="alGenSources")]
    public void gen_sources(ALsizei n, [CCode (array_length = false)]Source[] sources);
    /** Create Source object. */
    [CCode (cname="alGenSources")]
    public void gen_source(ALsizei n, out Source source);
    /** Delete Source objects. */
    [CCode (cname="alDeleteSources")]
    public void delete_sources(ALsizei n, [CCode (array_length = false)]Source[] sources);
    /** Delete Source object. */
    [CCode (cname="alDeleteSources")]
    public void delete_source(ALsizei n, ref Source source);
    /** Verify a handle is a valid Source. */
    [CCode (cname="alIsSource")]
    public bool is_source(ALuint source);

    [SimpleType]
    [CCode (cname="ALuint", has_type_id = false)]
    public struct Buffer : ALuint {
        /** Specifies the data to be copied into a buffer */
        [CCode (cname="alBufferData")]
        public void set_data(ALenum format, [CCode (array_length = false)]uint8[] data, ALsizei size, ALsizei freq);

        /** Set Buffer parameters, */
        [CCode (cname="alBufferf")]
        public void set_paramf(ALenum param, ALfloat value);
        [CCode (cname="alBuffer3f")]
        public void set_param3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
        [CCode (cname="alBufferfv")]
        public void set_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alBufferi")]
        public void set_parami(ALenum param, ALint value);
        [CCode (cname="alBuffer3i")]
        public void set_param3i(ALenum param, ALint value1, ALint value2, ALint value3);
        [CCode (cname="alBufferiv")]
        public void set_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);

        /** Get Buffer parameters. */
        [CCode (cname="alGetBufferf")]
        public void get_paramf(ALenum param, out ALfloat value);
        [CCode (cname="alGetBuffer3f")]
        public void get_param3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
        [CCode (cname="alGetBufferfv")]
        public void get_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alGetBufferi")]
        public void get_parami(ALenum param, out ALint value);
        [CCode (cname="alGetBuffer3i")]
        public void get_param3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
        [CCode (cname="alGetBufferiv")]
        public void get_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);
    }

    /** Create Buffer objects */
    [CCode (cname="alGenBuffers")]
    public void gen_buffers(ALsizei n, [CCode (array_length = false)]Buffer[] buffers);
    /** Create Buffer object */
    [CCode (cname="alGenBuffers")]
    public void gen_buffer(ALsizei n, out Buffer buffer);
    /** Delete Buffer objects */
    [CCode (cname="alDeleteBuffers")]
    public void delete_buffers(ALsizei n, [CCode (array_length = false)]Buffer[] buffers);
    /** Delete Buffer object */
    [CCode (cname="alDeleteBuffers")]
    public void delete_buffer(ALsizei n, ref Buffer buffer);
    /** Verify a handle is a valid Buffer */
    [CCode (cname="alIsBuffer")]
    public bool is_buffer(ALuint buffer);
}

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/alc.h")]
namespace ALC
{
    /** 8-bit boolean */
    [CCode (cname="ALCboolean", has_type_id = false)]
    public struct ALCboolean : int8 {}

    /** character */
    [CCode (cname="ALCchar", has_type_id = false)]
    public struct ALCchar : char {}

    /** signed 8-bit 2's complement integer */
    [CCode (cname="ALCbyte", has_type_id = false)]
    public struct ALCbyte : int8 {}

    /** unsigned 8-bit integer */
    [CCode (cname="ALCubyte", has_type_id = false)]
    public struct ALCubyte : uint8 {}

    /** signed 16-bit 2's complement integer */
    [CCode (cname="ALCshort", has_type_id = false)]
    public struct ALCshort : int16 {}

    /** unsigned 16-bit integer */
    [CCode (cname="ALCushort", has_type_id = false)]
    public struct ALCushort : uint16 {}

    /** signed 32-bit 2's complement integer */
    [CCode (cname="ALCint", has_type_id = false)]
    public struct ALCint : int32 {}

    /** unsigned 32-bit integer */
    [CCode (cname="ALCuint", has_type_id = false)]
    public struct ALCuint : uint32 {}

    /** non-negative 32-bit binary integer size */
    [CCode (cname="ALCsizei", has_type_id = false)]
    public struct ALCsizei : int32 {}

    /** enumerated 32-bit value */
    [CCode (cname="ALCenum", has_type_id = false)]
    public struct ALCenum : int32 {}

    /** 32-bit IEEE754 floating-point */
    [CCode (cname="ALCfloat", has_type_id = false)]
    public struct ALCfloat : float {}

    /** 64-bit IEEE754 floating-point */
    [CCode (cname="ALCdouble", has_type_id = false)]
    public struct ALCdouble : double {}

    /** void type (for opaque pointers only) */
    [CCode (cname="ALCvoid", has_type_id = false)]
    public struct ALCvoid {}

    /** Boolean False. */
    [CCode (cname="ALC_FALSE")]
    public const ALCenum FALSE;

    /** Boolean True. */
    [CCode (cname="ALC_TRUE")]
    public const ALCenum TRUE;

    /** Context attribute: <int> Hz. */
    [CCode (cname="ALC_FREQUENCY")]
    public const ALCenum FREQUENCY;

    /** Context attribute: <int> Hz. */
    [CCode (cname="ALC_REFRESH")]
    public const ALCenum REFRESH;

    /** Context attribute: AL_TRUE or AL_FALSE. */
    [CCode (cname="ALC_SYNC")]
    public const ALCenum SYNC;

    /** Context attribute: <int> requested Mono (3D) Sources. */
    [CCode (cname="ALC_MONO_SOURCES")]
    public const ALCenum MONO_SOURCES;

    /** Context attribute: <int> requested Stereo Sources. */
    [CCode (cname="ALC_STEREO_SOURCES")]
    public const ALCenum STEREO_SOURCES;

    [CCode (cname = "ALCenum", cprefix = "ALC_", has_type_id = false)]
    public enum Error {
        /** No error. */
        NO_ERROR,
        /** Invalid device handle. */
        INVALID_DEVICE,
        /** Invalid context handle. */
        INVALID_CONTEXT,
        /** Invalid enum parameter passed to an ALC call. */
        INVALID_ENUM,
        /** Invalid value parameter passed to an ALC call. */
        INVALID_VALUE,
        /** Out of memory. */
        OUT_OF_MEMORY
    }

    /** Runtime ALC version. */
    [CCode (cname="ALC_MAJOR_VERSION")]
    public const ALCenum MAJOR_VERSION;
    [CCode (cname="ALC_MINOR_VERSION")]
    public const ALCenum MINOR_VERSION;

    /** Context attribute list properties. */
    [CCode (cname="ALC_ATTRIBUTES_SIZE")]
    public const ALCenum ATTRIBUTES_SIZE;
    [CCode (cname="ALC_ALL_ATTRIBUTES")]
    public const ALCenum ALL_ATTRIBUTES;

    /** String for the default device specifier. */
    [CCode (cname="ALC_DEFAULT_DEVICE_SPECIFIER")]
    public const ALCenum DEFAULT_DEVICE_SPECIFIER;

    /**
    * String for the given device's specifier.
    *
    * If device handle is NULL, it is instead a null-char separated list of
    * strings of known device specifiers (list ends with an empty string).
    */
    [CCode (cname="ALC_DEVICE_SPECIFIER")]
    public const ALCenum DEVICE_SPECIFIER;
    /** String for space-separated list of ALC extensions. */
    [CCode (cname="ALC_EXTENSIONS")]
    public const ALCenum EXTENSIONS;

    /** Capture extension */
    [CCode (cname="ALC_EXT_CAPTURE")]
    public const ALCenum EXT_CAPTURE;

    /**
    * String for the given capture device's specifier.
    *
    * If device handle is NULL, it is instead a null-char separated list of
    * strings of known capture device specifiers (list ends with an empty string).
    */
    [CCode (cname="ALC_CAPTURE_DEVICE_SPECIFIER")]
    public const ALCenum CAPTURE_DEVICE_SPECIFIER;
    /** String for the default capture device specifier. */
    [CCode (cname="ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER")]
    public const ALCenum CAPTURE_DEFAULT_DEVICE_SPECIFIER;
    /** Number of sample frames available for capture. */
    [CCode (cname="ALC_CAPTURE_SAMPLES")]
    public const ALCenum CAPTURE_SAMPLES;

    /** Enumerate All extension */
    [CCode (cname="ALC_ENUMERATE_ALL_EXT")]
    public const ALCenum ENUMERATE_ALL_EXT;
    /** String for the default extended device specifier. */
    [CCode (cname="ALC_DEFAULT_ALL_DEVICES_SPECIFIER")]
    public const ALCenum DEFAULT_ALL_DEVICES_SPECIFIER;

    /**
    * String for the given extended device's specifier.
    *
    * If device handle is NULL, it is instead a null-char separated list of
    * strings of known extended device specifiers (list ends with an empty string).
    */
    [CCode (cname="ALC_ALL_DEVICES_SPECIFIER")]
    public const ALCenum ALL_DEVICES_SPECIFIER;


    /** Context management. */
    [Compact]
    [CCode (cname="ALCcontext", has_type_id = false, free_function="alcDestroyContext")]
    public class Context {
        [CCode (cname="alcCreateContext")]
        public Context (Device device, [CCode (array_length = false)] ALCint[]? attrlist);

        [CCode (cname="alcMakeContextCurrent")]
        public bool make_current();

        [CCode (cname="alcProcessContext")]
        public void process();

        [CCode (cname="alcSuspendContext")]
        public void suspend();

        [CCode (cname="alcDestroyContext")]
        public void destroy();

        [CCode (cname="alcGetContextsDevice")]
        public Device get_contexts_device();
    }

    [CCode (cname="alcGetCurrentContext")]
    public static Context get_current_context();

    /** Device management. */
    [Compact]
    [CCode (cname="ALCdevice", has_type_id = false, free_function="alcCloseDevice")]
    public class Device {
        [CCode (cname="alcOpenDevice")]
        public Device (string? devicename);

        /**
        * Extension support.
        *
        * Query for the presence of an extension, and obtain any appropriate
        * function pointers and enum values.
        */
        [CCode (cname="alcIsExtensionPresent")]
        public bool is_extension_present(string extname);
        [CCode (cname="alcGetProcAddress")]
        public void* get_proc_address(string funcname);
        [CCode (cname="alcGetEnumValue")]
        public ALCenum get_enum_value(string enumname);

        /** Query function. */
        [CCode (cname="alcGetString")]
        public unowned string? get_string(ALCenum param);
        [CCode (cname="alcGetIntegerv")]
        public void get_integerv(ALCenum param, ALCsizei size, [CCode (array_length = false)] ALCint[] values);

        /**
        * Error support.
        *
        * Obtain the most recent Device error.
        */
        [CCode (cname="alcGetError")]
        public Error get_error();

        [CCode (cname="alcCloseDevice")]
        public bool destroy();
    }

    [Compact]
    [CCode (cname="ALCdevice", has_type_id = false, free_function="alcCaptureCloseDevice")]
    public class CaptureDevice : Device {
        /** Capture function. */
        [CCode (cname="alcCaptureOpenDevice")]
        public CaptureDevice(string devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize);

        [CCode (cname="alcCaptureCloseDevice")]
        public bool destroy();

        [CCode (cname="alcCaptureStart")]
        public void start();

        [CCode (cname="alcCaptureStop")]
        public void stop();

        [CCode (cname="alcCaptureSamples")]
        public void samples([CCode (array_length = false)] uint8[] buffer, ALCsizei samples);
    }
}
