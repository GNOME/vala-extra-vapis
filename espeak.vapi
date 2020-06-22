/* Espeak Vala Bindings
 * Copyright 2020 Daniel 'grindhold' Brendle <grindhold@gmx.net>
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
/**
 * Espeak voice synthesis library
 *
 * Example:
 *
 * {{{
 * public static void main(string[] argv) {
 *     Espeak.initialize(Espeak.AudioOutput.PLAYBACK, 0, null, 0);
 *     string input = "Hello World";
 *     Espeak.synth(input, input.length+1, 0, Espeak.PositionType.CHARACTER, 0, Espeak.CHARS_AUTO, null, null);
 *     Espeak.synchronize();
 *     Espeak.terminate();
 * }
 * }}}
 * Compile with: --pkg espeak -X -lespeak
 */
[CCode (cprefix = "espeak", lower_case_cprefix = "espeak_", cheader_filename = "espeak/speak_lib.h")]
namespace Espeak {
    [CCode (cname = "espeak_EVENT_TYPE", cprefix = "espeakEVENT_")]
    public enum EventType {
        LIST_TERMINATED,
        WORD,
        SENTENCE = 2,        // Start of sentence
        MARK = 3,            // Mark
        PLAY = 4,            // Audio element
        END = 5,             // End of sentence or clause
        MSG_TERMINATED = 6,  // End of message
        PHONEME = 7,         // Phoneme, if enabled in espeak_Initialize()
        SAMPLERATE = 8       // internal use, set sample rate
    }

    [CCode (cname = "espeak_EVENT")]
    public struct Event {
        public EventType type;
        public uint unique_identifier;
        public int text_position;
        public int length;
        public int audio_position;
        public int sample;
        public void* user_data;
        [CCode (cname = "id.number")]
        public int id_number;   
        [CCode (cname = "id.name")]
        public unowned string id_name;
        [CCode (cname = "id.string")]
        public char id_string[8];
    }

    [CCode (cname = "espeak_POSITION_TYPE", cprefix = "POS_")]
    public enum PositionType {
        CHARACTER,
        WORD,
        SENTENCE
    }

    [CCode (cname = "espeak_AUDIO_OUTPUT", cprefix = "AUDIO_OUTPUT_")]
    public enum AudioOutput {
        PLAYBACK,
        RETRIEVAL,
        SYNCHRONOUS,
        SYNCH_PLAYBACK
    }

    [CCode (cname = "espeak_ERROR", cprefix = "EE_")]
    public enum Error {
        OK,
        INTERNAL_ERROR,
        BUFFER_FULL,
        NOT_FOUND
    }

    public const int INITIALIZE_PHONEME_EVENTS;
    public const int INITIALIZE_PHONEME_IPA;
    public const int INITIALIZE_DONT_EXIT;

 
    [CCode (cname = "espeak_Initialize")]
    public int initialize (AudioOutput output, int buflength, string? path, int options);

    [CCode (cname = "t_espeak_callback", has_target = false)]
    public delegate int Callback (short* s, int i, Event e);

    [CCode (cname = "espeak_SetSynthCallback")]
    public void set_synth_callback (Callback synth_callback);

    [CCode (cname = "vala_t_espeak_uri_callback", has_target = false, has_typedef = false)]
    public delegate int UriCallback (int i, string s1, string s2);

    [CCode (cname = "espeak_SetUriCallback")]
    public void set_uri_callback (UriCallback uri_callback);

    [CCode (cname = "espeakCHARS_AUTO")]
    public const int CHARS_AUTO;
    [CCode (cname = "espeakCHARS_UTF8")]
    public const int CHARS_UTF8;
    [CCode (cname = "espeakCHARS_8BIT")]
    public const int CHARS_8BIT;
    [CCode (cname = "espeakCHARS_WCHAR")]
    public const int CHARS_WCHAR;
    [CCode (cname = "espeakCHARS_16BIT")]
    public const int CHARS_16BIT;

    public const int SSML;
    public const int PHONEMES;
    public const int ENDPAUSE;
    public const int KEEP_NAMEDATA;

    [CCode (cname = "espeak_Synth")]
    public Error synth (void* text, size_t size, uint position, PositionType position_type, uint end_position, uint flags, out uint unique_identifier, out void* user_data);

    [CCode (cname = "espeak_SynthMark")]
    public Error synth_mark (void* text, size_t size, string index_mark, uint end_position, uint flags, uint* unique_identifier, void* user_data);

    [CCode (cname = "espeak_Key")]
    public Error key (string key_name);

    [CCode (cname = "espeak_Char")]
    public Error @char (int16 character);

    [CCode (cname = "espeak_PARAMETER", cprefix = "espeak")]
    public enum Parameter {
        SILENCE,
        RATE,
        VOLUME,
        PITCH,
        RANGE,
        PUNCTUATION,
        CAPITALS,
        WORDGAP,
        OPTIONS,
        INTONATION,
        RESERVED1,
        RESERVED2,
        EMPHASIS,
        LINELENGTH,
        VOICETYPE,
        [CCode (cname = "N_SPEECHPARAM")]
        N_SPEECH_PARAM
    }

    [CCode (cname = "espeak_PUNCT_TYPE", cprefix = "espeakPUNKT_")]
    public enum PunctType {
        NONE,
        ALL,
        SOME
    }

    [CCode (cname = "espeak_SetParameter")]
    public Error set_parameter (Parameter parameter, int @value, int relative);

    [CCode (cname = "espeak_GetParameter")]
    public Error get_parameter (Parameter parameter, int current);

    [CCode (cname = "espeak_SetPunctuationList")]
    public Error set_punctuation_list (ref int16 punctlist);

    [CCode (cname = "espeak_SetPhonemeTrace")]
    public void set_phoneme_trace (int @value, out GLib.FileStream stream);

    [CCode (cname = "espeak_TextToPhonemes")]
    public string text_to_phonemes (void** textptr,int textmode, int phonememode);

    [CCode (cname = "espeak_CompileDictionary")]
    public void compile_dictionary (string path, GLib.FileStream log, int flags);

    [CCode (cname = "espeak_VOICE")]
    public struct Voice {
        unowned string name;
        unowned string languages;
        unowned string identifier;
        uchar gender;
        uchar age;
        uchar variant;
        uchar xxl;
        int score;
        void* spare;
    }

    [CCode (cname = "espeak_ListVoices", array_length = false, array_null_terminated = true)]
    public (unowned Voice?)[] list_voices (Voice? voice_spec);

    [CCode (cname = "espeak_SetVoiceByName")]
    public Error set_voice_by_name (string name);

    [CCode (cname = "espeak_SetVoiceByProperties")]
    public Error set_voice_by_properties (Voice? voice_spec);

    [CCode (cname = "espeak_GetCurrentVoice")]
    public unowned Voice? get_current_voice ();

    [CCode (cname = "espeak_Cancel")]
    public Error cancel ();

    [CCode (cname = "espeak_IsPlaying")]
    public int is_playing ();

    [CCode (cname = "espeak_Synchronize")]
    public Error synchronize ();

    [CCode (cname = "espeak_Terminate")]
    public Error terminate ();

    [CCode (cname = "espeak_Info")]
    public string info (out string path_data);
}
