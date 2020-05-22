/*
 * PhysicsFS binding for Vala
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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="physfs.h")]
namespace PHYSFS
{
    /**
     * PHYSFS_ArchiveInfo
     * Information on various PhysicsFS-supported archives.
     */
    [CCode (cname = "PHYSFS_ArchiveInfo", has_type_id = false)]
    public struct ArchiveInfo {
        public string extension;   /**< Archive file extension: "ZIP", for example. */
        public string description; /**< Human-readable archive description. */
        public string author;      /**< Person who did support for this archive. */
        public string url;         /**< URL related to this archive */
        [CCode (cname = "supportsSymlinks")]
        public bool supports_symlinks;    /**< non-zero if archive offers symbolic links. */
    }

    /**
     * PHYSFS_Version
     * Information the version of PhysicsFS in use.
     */
    [CCode (cname = "PHYSFS_Version", has_type_id = false)]
    public struct Version {
        public uint8 major; /**< major revision */
        public uint8 minor; /**< minor revision */
        public uint8 patch; /**< patchlevel */
    }
    /**
     * void PHYSFS_getLinkedVersion(PHYSFS_Version *ver)
     * Get the version of PhysicsFS that is linked against your program.
     */
    [CCode (cname = "PHYSFS_getLinkedVersion")]
    public void get_linked_version(Version* ver);

    /**
     * int PHYSFS_init(const char *argv0)
     * Initialize the PhysicsFS library.
     */
    [CCode (cname = "PHYSFS_init")]
    public bool init(string argv0);

    /**
     * int PHYSFS_deinit()
     * Deinitialize the PhysicsFS library.
     */
    [CCode (cname = "PHYSFS_deinit")]
    public bool deinit();

    /**
    * const PHYSFS_ArchiveInfo **PHYSFS_supportedArchiveTypes()
    * Get a list of supported archive types.
    */
    [CCode (cname = "PHYSFS_supportedArchiveTypes", array_length = false)]
    public unowned ArchiveInfo*[] supported_archive_types();

    /**
    * void PHYSFS_freeList(void* listVar)
    * Deallocate resources of lists returned by PhysicsFS.
    */
    [CCode (cname = "PHYSFS_freeList")]
    public void free_list(void* list_var);

    /**
    * const char *PHYSFS_getLastError()
    * Get human-readable error information.
    */
    [CCode (cname = "PHYSFS_getLastError")]
    public unowned string? get_last_error();

    /**
    * const char *PHYSFS_getDirSeparator()
    * Get platform-dependent dir separator string.
    */
    [CCode (cname = "PHYSFS_getDirSeparator")]
    public unowned string? get_dir_separator();

    /**
    * void PHYSFS_permitSymbolicLinks(int allow)
    * Enable or disable following of symbolic links.
    */
    [CCode (cname = "PHYSFS_permitSymbolicLinks")]
    public void permit_symbolic_links(int allow);

    /**
    * char **PHYSFS_getCdRomDirs()
    * Get an array of paths to available CD-ROM drives.
    */
    [CCode (cname = "PHYSFS_getCdRomDirs", array_length = false)]
    public string?[] get_cdrom_dirs();

    /**
    * const char *PHYSFS_getBaseDir()
    * Get the path where the application resides.
    */
    [CCode (cname = "PHYSFS_getBaseDir")]
    public unowned string? get_base_dir();


    /**
    * const char *PHYSFS_getUserDir()
    * Get the path where user's home directory resides.
    */
    [CCode (cname = "PHYSFS_getUserDir")]
    public unowned string? get_user_dir();

    /**
    * const char *PHYSFS_getWriteDir()
    * Get path where PhysicsFS will allow file writing.
    */
    [CCode (cname = "PHYSFS_getWriteDir")]
    public unowned string? get_write_dir();

    /**
    * int PHYSFS_setWriteDir(const char *new_dir)
    * Tell PhysicsFS where it may write files.
    */
    [CCode (cname = "PHYSFS_setWriteDir")]
    public bool set_write_dir(string new_dir);


    /**
    * int PHYSFS_addToSearchPath(const char *new_dir, int appendToPath)
    * Add an archive or directory to the search path.
    */
    [CCode (cname = "PHYSFS_addToSearchPath")]
    public bool add_to_search_path(string new_dir, bool append_to_path);

    /**
    * int PHYSFS_removeFromSearchPath(const char *old_dir)
    * Remove a directory or archive from the search path.
    */
    [CCode (cname = "PHYSFS_removeFromSearchPath")]
    public bool remove_from_search_path(string old_dir);

    /**
    * char **PHYSFS_getSearchPath()
    * Get the current search path.
    */
    [CCode (cname = "PHYSFS_getSearchPath", array_length = false)]
    public unowned string?[] PHYSFS_getSearchPath();

    /**
    * int PHYSFS_setSaneConfig(const char *organization, const char *appName, const char *archiveExt, int includeCdRoms, int archivesFirst)
    * Set up sane, default paths.
    */
    [CCode (cname = "PHYSFS_setSaneConfig")]
    public bool set_sane_config(string organization,
                                string app_name,
                                string archive_ext,
                                bool include_cdroms,
                                bool archives_first);

    /* Directory management stuff ... */

    /**
     * int PHYSFS_mkdir(const char *dirName)
     * Create a directory.
     */
    [CCode (cname = "PHYSFS_mkdir")]
    public bool mkdir(string dir_name);

    /**
     * int PHYSFS_delete(const char *filename)
     * Delete a file or directory.
     */
    [CCode (cname = "PHYSFS_delete")]
    public bool delete(string filename);

    /**
     * const char *PHYSFS_getRealDir(const char *filename)
     * Figure out where in the search path a file resides.
     */
    [CCode (cname = "PHYSFS_getRealDir")]
    public unowned string? get_real_dir(string filename);

    /**
     * char **PHYSFS_enumerateFiles(const char *dir)
     * Get a file listing of a search path's directory.
     */
    [CCode (cname = "PHYSFS_enumerateFiles", array_length = false)]
    public unowned string?[] enumerate_files(string dir);

    /**
     * int PHYSFS_exists(const char *fname)
     * Determine if a file exists in the search path.
     */
    [CCode (cname = "PHYSFS_exists")]
    public bool exists(string fname);

    /**
     * int PHYSFS_isDirectory(const char *fname)
     * Determine if a file in the search path is really a directory.
     */
    [CCode (cname = "PHYSFS_isDirectory")]
    public bool is_directory(string fname);

    /**
    * int PHYSFS_isSymbolicLink(const char *fname)
    * Determine if a file in the search path is really a symbolic link.
    */
    [CCode (cname = "PHYSFS_isSymbolicLink")]
    public bool is_symbolic_link(string fname) ;

    /**
    * int64 PHYSFS_getLastModTime(const char *filename)
    * Get the last modification time of a file.
    */
    [CCode (cname = "PHYSFS_getLastModTime")]
    public int64 get_last_mod_time(string filename);

    /* i/o stuff... */

    [Compact]
    [CCode (cname = "PHYSFS_File", has_type_id = false, free_function = "PHYSFS_close")]
    //public struct File {
    //    private void* opaque;  /**< That's all you get. Don't touch. */
    //}
    public class File {
        /**
        * File* PHYSFS_openWrite(const char *filename)
        * Open a file for writing.
        */
        [CCode (cname = "PHYSFS_openWrite")]
        public File.open_write(string filename);

        /**
        * File* PHYSFS_openAppend(const char *filename)
        * Open a file for appending.
        */
        [CCode (cname = "PHYSFS_openAppend")]
        public File.open_append(string filename);

        /**
        * File* PHYSFS_openRead(const char *filename)
        * Open a file for reading.
        */
        [CCode (cname = "PHYSFS_openRead")]
        public File.open_read(string filename);

        /**
        * int PHYSFS_close(File* handle)
        * Close a PhysicsFS filehandle.
        */
        [CCode (cname = "PHYSFS_close")]
        public bool close();

        /**
        * int64 PHYSFS_read(File* handle, void* buffer, uint32 objSize, uint32 objCount)
        * Read data from a PhysicsFS filehandle
        */
        [CCode (cname = "PHYSFS_read")]
        public int64 read([CCode (array_length = false)] uint8[] buffer, uint32 obj_size, uint32 obj_count);

        /**
        * int64 PHYSFS_write(File* handle, const void* buffer, uint32 objSize, uint32 objCount)
        * Write data to a PhysicsFS filehandle
        */
        [CCode (cname = "PHYSFS_write")]
        public int64 write([CCode (array_length = false)] uint8[] buffer, uint32 obj_size, uint32 obj_count);

        /* File position stuff... */

        /**
        * int PHYSFS_eof(File* handle)
        * Check for end-of-file state on a PhysicsFS filehandle.
        */
        [CCode (cname = "PHYSFS_eof")]
        public bool eof();

        /**
        * int64 PHYSFS_tell(File* handle)
        * Determine current position within a PhysicsFS filehandle.
        */
        [CCode (cname = "PHYSFS_tell")]
        public int64 tell();

        /**
        * int PHYSFS_seek(File* handle, uint64 pos)
        * Seek to a new position within a PhysicsFS filehandle.
        */
        [CCode (cname = "PHYSFS_seek")]
        public int seek(uint64 pos);

        /**
        * int64 FileLength(File* handle)
        * Get total length of a file in bytes.
        */
        [CCode (cname = "PHYSFS_fileLength")]
        public int64 length();

        /* Buffering stuff... */

        /**
        * int PHYSFS_setBuffer(File* handle, uint64 bufsize)
        * Set up buffering for a PhysicsFS file handle.
        */
        [CCode (cname = "PHYSFS_setBuffer")]
        public bool set_buffering(uint64 buf_size);

        /**
        * int PHYSFS_flush(File* handle)
        * Flush a buffered PhysicsFS file handle.
        */
        [CCode (cname = "PHYSFS_flush")]
        public bool flush();

        /**
        * int64 PHYSFS_readBytes(File* handle, void* buffer, uint64 len)
        * Read bytes from a PhysicsFS filehandle
        */
        [CCode (cname = "PHYSFS_readBytes")]
        public int64 read_bytes([CCode (array_length = false)] uint8[] buffer, uint64 len);

        /**
        * int64 PHYSFS_writeBytes(File* handle, const void* buffer, uint64 len)
        * Write data to a PhysicsFS filehandle
        */
        [CCode (cname = "PHYSFS_writeBytes")]
        public int64 write_bytes(uint8[] buffer);

        /**
        * int PHYSFS_readSLE16(File* file, int16 *val)
        * Read and convert a signed 16-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readSLE16")]
        public bool readSLE16(out int16 val);

        /**
        * int PHYSFS_readULE16(File* file, uint16 *val)
        * Read and convert an unsigned 16-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readULE16")]
        public bool readULE16(out uint16 val);

        /**
        * int PHYSFS_readSBE16(File* file, int16 *val)
        * Read and convert a signed 16-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readSBE16")]
        public bool readSBE16(out int16 val);

        /**
        * int PHYSFS_readUBE16(File* file, uint16 *val)
        * Read and convert an unsigned 16-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readUBE16")]
        public bool readUBE16(out uint16 val);

        /**
        * int PHYSFS_readSLE32(File* file, int32 *val)
        * Read and convert a signed 32-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readSLE32")]
        public bool readSLE32(out int32 val);

        /**
        * int PHYSFS_readULE32(File* file, uint32 *val)
        * Read and convert an unsigned 32-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readULE32")]
        public bool readULE32(out uint32 val);

        /**
        * int PHYSFS_readSBE32(File* file, int32 *val)
        * Read and convert a signed 32-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readSBE32")]
        public bool readSBE32(out int32 val);

        /**
        * int PHYSFS_readUBE32(File* file, uint32 *val)
        * Read and convert an unsigned 32-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readUBE32")]
        public bool readUBE32(out uint32 val);

        /**
        * int PHYSFS_readSLE64(File* file, int64 *val)
        * Read and convert a signed 64-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readSLE64")]
        public bool readSLE64(out int64 val);

        /**
        * int PHYSFS_readULE64(File* file, uint64 *val)
        * Read and convert an unsigned 64-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_readULE64")]
        public bool readULE64(out uint64 val);

        /**
        * int PHYSFS_readSBE64(File* file, int64 *val)
        * Read and convert a signed 64-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readSBE64")]
        public bool readSBE64(out int64 val);

        /**
        * int PHYSFS_readUBE64(File* file, uint64 *val)
        * Read and convert an unsigned 64-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_readUBE64")]
        public bool readUBE64(out uint64 val);

        /**
        * int PHYSFS_writeSLE16(File* file, int16 val)
        * Convert and write a signed 16-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeSLE16")]
        public bool writeSLE16(int16 val);

        /**
        * int PHYSFS_writeULE16(File* file, uint16 val)
        * Convert and write an unsigned 16-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeULE16")]
        public bool writeULE16(uint16 val);

        /**
        * int PHYSFS_writeSBE16(File* file, int16 val)
        * Convert and write a signed 16-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_writeSBE16")]
        public bool writeSBE16(int16 val);

        /**
        * int PHYSFS_writeUBE16(File* file, uint16 val)
        * Convert and write an unsigned 16-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_writeUBE16")]
        public bool writeUBE16(uint16 val);

        /**
        * int PHYSFS_writeSLE32(File* file, int32 val)
        * Convert and write a signed 32-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeSLE32")]
        public bool writeSLE32(int32 val);

        /**
        * int PHYSFS_writeULE32(File* file, uint32 val)
        * Convert and write an unsigned 32-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeULE32")]
        public bool writeULE32(uint32 val);

        /**
        * int PHYSFS_writeSBE32(File* file, int32 val)
        * Convert and write a signed 32-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_writeSBE32")]
        public bool writeSBE32(int32 val);

        /**
        * int PHYSFS_writeUBE32(File* file, uint32 val)
        * Convert and write an unsigned 32-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_writeUBE32")]
        public bool writeUBE32(uint32 val);

        /**
        * int PHYSFS_writeSLE64(File* file, int64 val)
        * Convert and write a signed 64-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeSLE64")]
        public bool writeSLE64(int64 val);

        /**
        * int PHYSFS_writeULE64(File* file, uint64 val)
        * Convert and write an unsigned 64-bit littleendian value.
        */
        [CCode (cname = "PHYSFS_writeULE64")]
        public bool writeULE64(uint64 val);

        /**
        * int PHYSFS_writeSBE64(File* file, int64 val)
        * Convert and write a signed 64-bit bigending value.
        */
        [CCode (cname = "PHYSFS_writeSBE64")]
        public bool writeSBE64(int64 val);

        /**
        * int PHYSFS_writeUBE64(File* file, uint64 val)
        * Convert and write an unsigned 64-bit bigendian value.
        */
        [CCode (cname = "PHYSFS_writeUBE64")]
        public bool writeUBE64(uint64 val);

        /**
        * int PHYSFS_mountHandle(File* file, const char *new_dir, const char *mountPoint, int appendToPath)
        * Add an archive, contained in a File handle, to the search path.
        */
        [CCode (cname = "PHYSFS_mountHandle")]
        public bool mount_handle(string new_dir, string mountPoint, bool append_to_path);
    }

    /* Byteorder stuff... */

    /**
    * int16 PHYSFS_swapSLE16(int16 val)
    * Swap littleendian signed 16 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSLE16")]
    public int16 swapSLE16(int16 val);


    /**
    * uint16 PHYSFS_swapULE16(uint16 val)
    * Swap littleendian unsigned 16 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapULE16")]
    public uint16 swapULE16(uint16 val);

    /**
    * int32 PHYSFS_swapSLE32(int32 val)
    * Swap littleendian signed 32 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSLE32")]
    public int32 swapSLE32(int32 val);


    /**
    * uint32 PHYSFS_swapULE32(uint32 val)
    * Swap littleendian unsigned 32 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapULE32")]
    public uint32 swapULE32(uint32 val);

    /**
    * int64 PHYSFS_swapSLE64(int64 val)
    * Swap littleendian signed 64 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSLE64")]
    public int64 swapSLE64(int64 val);

    /**
    * uint64 PHYSFS_swapULE64(uint64 val)
    * Swap littleendian unsigned 64 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapULE64")]
    public uint64 swapULE64(uint64 val);

    /**
    * int16 PHYSFS_swapSBE16(int16 val)
    * Swap bigendian signed 16 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSBE16")]
    public int16 swapSBE16(int16 val);

    /**
    * uint16 PHYSFS_swapUBE16(uint16 val)
    * Swap bigendian unsigned 16 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapUBE16")]
    public uint16 swapUBE16(uint16 val);

    /**
    * int32 PHYSFS_swapSBE32(int32 val)
    * Swap bigendian signed 32 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSBE32")]
    public int32 swapSBE32(int32 val);

    /**
    * uint32 PHYSFS_swapUBE32(uint32 val)
    * Swap bigendian unsigned 32 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapUBE32")]
    public uint32 swapUBE32(uint32 val);

    /**
    * int64 PHYSFS_swapSBE64(int64 val)
    * Swap bigendian signed 64 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapSBE64")]
    public int64 swapSBE64(int64 val);

    /**
    * uint64 PHYSFS_swapUBE64(uint64 val)
    * Swap bigendian unsigned 64 to platform's native byte order.
    */
    [CCode (cname = "PHYSFS_swapUBE64")]
    public uint64 swapUBE64(uint64 val);

    /* Everything above this line is part of the PhysicsFS 1.0 API. */

    /**
    * int PHYSFS_isInit()
    * Determine if the PhysicsFS library is initialized.
    */
    [CCode (cname = "PHYSFS_isInit")]
    public bool is_init();

    /**
    * int PHYSFS_symbolicLinksPermitted()
    * Determine if the symbolic links are permitted.
    */
    [CCode (cname = "PHYSFS_symbolicLinksPermitted")]
    public bool symbolic_links_permitted();

    [CCode (has_target = false)]
    public delegate int   Init();   /**< Initialize. Can be NULL. Zero on failure. */
    [CCode (has_target = false)]
    public delegate void  Deinit();  /**< Deinitialize your allocator. Can be NULL. */
    [CCode (has_target = false)]
    public delegate void* Malloc(uint64 size);  /**< Allocate like malloc(). */
    public delegate void* Realloc(void* dst, uint64 size); /**< Reallocate like realloc(). */
    public delegate void  Free(void* pointer); /**< Free memory from Malloc or Realloc. */
    /**
    * PHYSFS_Allocator
    * PhysicsFS allocation function pointers.
    */
    [CCode (cname = "PHYSFS_Allocator", has_type_id = false)]
    public struct Allocator {
        [CCode (cname = "init")]
        public Init init_func;       /**< Initialize. Can be NULL. Zero on failure. */
        [CCode (cname = "deinit")]
        public Deinit deinit_func;   /**< Deinitialize your allocator. Can be NULL. */
        [CCode (cname = "malloc")]
        public Malloc malloc_func;   /**< Allocate like malloc(). */
        [CCode (cname = "realloc")]
        public Realloc realloc_func; /**< Reallocate like realloc(). */
        [CCode (cname = "free")]
        public Free free_func;          /**< Free memory from Malloc or Realloc. */
    }

    /**
    * int PHYSFS_setAllocator(const PHYSFS_Allocator *allocator)
    * Hook your own allocation routines into PhysicsFS.
    */
    public bool set_allocator(Allocator* allocator);

    /**
    * int PHYSFS_mount(const char *new_dir, const char *mountPoint, int appendToPath)
    * Add an archive or directory to the search path.
    */
    [CCode (cname = "PHYSFS_mount")]
    public bool mount(string new_dir, string mountPoint, bool append_to_path);

    /**
    * int PHYSFS_getMountPoint(const char *dir)
    * Determine a mounted archive's mountpoint.
    */
    [CCode (cname = "PHYSFS_getMountPoint")]
    public unowned string? get_mount_point(string dir);

    /**
    * PHYSFS_StringCallback
    * Function signature for callbacks that report strings.
    */
    [CCode (cname = "PHYSFS_StringCallback", has_target = false)]
    public delegate void StringCallback (void* data, string str);

    /**
    * PHYSFS_EnumFilesCallback
    * Function signature for callbacks that enumerate files.
    */
    [CCode (cname = "PHYSFS_EnumFilesCallback", has_target = false)]
    public delegate void EnumFilesCallback (void* data, string origdir, string fname);

    /**
    * void PHYSFS_getCdRomDirsCallback(PHYSFS_StringCallback c, void* d)
    * Enumerate CD-ROM directories, using an application-defined callback.
    */
    [CCode (cname = "PHYSFS_getCdRomDirsCallback")]
    public void get_cdrom_dirs_callback(StringCallback c, void* d);

    /**
    * void PHYSFS_getSearchPathCallback(PHYSFS_StringCallback c, void* d)
    * Enumerate the search path, using an application-defined callback.
    */
    [CCode (cname = "PHYSFS_getSearchPathCallback")]
    public void get_search_path_callback(StringCallback c, void* d);

    /**
    * void PHYSFS_enumerateFilesCallback(const char *dir, PHYSFS_EnumFilesCallback c, void* d)
    * Get a file listing of a search path's directory, using an application-defined callback.
    */
    [CCode (cname = "PHYSFS_enumerateFilesCallback")]
    public void enumerate_files_callback(string dir, EnumFilesCallback c, void* d) ;

    /**
    * void PHYSFS_utf8FromUcs4(const uint32 *src, char *dst, uint64 len)
    * Convert a UCS-4 string to a UTF-8 string.
    */
    [CCode (cname = "PHYSFS_utf8FromUcs4")]
    public void utf8_from_ucs4([CCode (array_length = false)] uint32[] src, out string dst, uint64 len);

    /**
    * void PHYSFS_utf8ToUcs4(const char *src, uint32 *dst, uint64 len)
    * Convert a UTF-8 string to a UCS-4 string.
    */
    [CCode (cname = "PHYSFS_utf8ToUcs4")]
    public void utf8_to_ucs4(string src, [CCode (array_length = false)] uint32[] dst, uint64 len);

    /**
    * void PHYSFS_utf8FromUcs2(const uint16 *src, char *dst, uint64 len)
    * Convert a UCS-2 string to a UTF-8 string.
    */
    [CCode (cname = "PHYSFS_utf8FromUcs2")]
    public void utf8_from_ucs2([CCode (array_length = false)] uint16[] src, out string dst, uint64 len);

    /**
    * PHYSFS_utf8ToUcs2(const char *src, uint16 *dst, uint64 len)
    * Convert a UTF-8 string to a UCS-2 string.
    */
    [CCode (cname = "PHYSFS_utf8ToUcs2")]
    public void utf8_to_ucs2(string src, [CCode (array_length = false)] uint16[] dst, uint64 len);

    /**
    * void PHYSFS_utf8FromLatin1(const char *src, char *dst, uint64 len)
    * Convert a UTF-8 string to a Latin1 string.
    */
    [CCode (cname = "PHYSFS_utf8FromLatin1")]
    public void utf8_from_latin1(string src, [CCode (array_length = false)] uint8[] dst, uint64 len);

    /* Everything above this line is part of the PhysicsFS 2.0 API. */

    /**
    * int PHYSFS_caseFold(const uint32 from, uint32 *to)
    * "Fold" a Unicode codepoint to a lowercase equivalent.
    */
    [CCode (cname = "PHYSFS_caseFold")]
    public int case_fold(uint32 from, out uint32 to);

    /**
    * int PHYSFS_utf8stricmp(const char *str1, const char *str2)
    * Case-insensitive compare of two UTF-8 strings.
    */
    [CCode (cname = "PHYSFS_utf8stricmp")]
    public int utf8_stricmp(string str1, string str2);

    /**
    * int PHYSFS_utf16stricmp(const uint16 *str1, const uint16 *str2)
    * Case-insensitive compare of two UTF-16 strings.
    */
    [CCode (cname = "PHYSFS_utf16stricmp")]
    public int utf16_stricmp([CCode (array_length = false)] uint16[] str1, [CCode (array_length = false)] uint16[] str2);

    /**
    * int PHYSFS_ucs4stricmp(const uint32 *str1, const uint32 *str2)
    * Case-insensitive compare of two UCS-4 strings.
    */
    [CCode (cname = "PHYSFS_ucs4stricmp")]
    public int ucs4_stricmp([CCode (array_length = false)] uint32[] str1, [CCode (array_length = false)] uint32[] str2);

    /**
    * PHYSFS_EnumerateCallback
    * Possible return values from PHYSFS_EnumerateCallback.
    */
    [CCode (cprefix = "PHYSFS_ENUM_", cname="int", has_type_id = false)]
    public enum EnumerateCallbackResult {
        ERROR = -1,   /**< Stop enumerating, report error to app. */
        STOP = 0,     /**< Stop enumerating, report success to app. */
        OK = 1        /**< Keep enumerating, no problems */
    }

    /**
    * PHYSFS_EnumerateCallback
    * Function signature for callbacks that enumerate and return results.
    */
    public delegate EnumerateCallbackResult EnumerateCallback(void* data, string origdir, string fname);

    /**
    * int PHYSFS_enumerate(const char *dir, PHYSFS_EnumerateCallback c, void* d)
    * Get a file listing of a search path's directory, using an application-defined callback, with errors reported.
    */
    [CCode (cname = "PHYSFS_enumerate")]
    public bool enumerate(string dir, EnumerateCallback c);

    /**
    * int PHYSFS_unmount(const char *old_dir)
    * Remove a directory or archive from the search path.
    */
    [CCode (cname = "PHYSFS_unmount")]
    public bool unmount(string old_dir);

    /**
    * const PHYSFS_Allocator *PHYSFS_getAllocator()
    * Discover the current allocator.
    */
    [CCode (cname = "PHYSFS_getAllocator")]
    public unowned Allocator* get_allocator();

    /**
    * FileType
    * Possible types of a file.
    */
    [CCode (cprefix = "PHYSFS_FILETYPE_", cname="int", has_type_id = false)]
    public enum FileType {
        REGULAR, /**< a normal File */
        DIRECTORY, /**< a directory */
        SYMLINK, /**< a symlink */
        OTHER /**< something completely different like a device */
    }

    /**
    * PHYSFS_Stat
    * Meta data for a file or directory
    */
    [CCode (cname = "PHYSFS_Stat", has_type_id = false)]
    public struct Stat {
        public int64 filesize; /**< size in bytes, -1 for non-files and unknown */
        public int64 modtime;  /**< last modification time */
        public int64 createtime; /**< like modtime, but for file creation time */
        public int64 accesstime; /**< like modtime, but for file access time */
        public FileType filetype; /**< File? Directory? Symlink? */
        public bool readonly; /**< non-zero if read only, zero if writable. */
    }

    /**
    * int PHYSFS_stat(const char *fname, PHYSFS_Stat *stat)
    * Get various information about a directory or a file.
    */
    [CCode (cname = "PHYSFS_stat")]
    public bool stat(string fname, out Stat stat);

    /**
    * void PHYSFS_utf8FromUtf16(const uint16 *src, char *dst, uint64 len)
    * Convert a UTF-16 string to a UTF-8 string.
    */
    [CCode (cname = "PHYSFS_utf8FromUtf16")]
    public void utf8_from_utf16([CCode (array_length = false)] uint16[] src, out string dst, uint64 len);

    /**
    * PHYSFS_utf8ToUtf16(const char *src, uint16 *dst, uint64 len)
    * Convert a UTF-8 string to a UTF-16 string.
    */
    [CCode (cname = "PHYSFS_utf8ToUtf16")]
    public void utf8ToUtf16(string src, [CCode (array_length = false)] uint16[] dst, uint64 len);

    public delegate int64 IoRead(Io* io, void* buf, uint64 len);
    public delegate int64 IoWrite(Io *io, void* buffer, uint64 len);
    public delegate bool IoSeek(Io *io, uint64 offset);
    public delegate int64 IoTell(Io *io);
    public delegate int64 IoLength(Io *io);
    public delegate Io* IoDuplicate(Io *io);
    public delegate bool IoFlush(Io *io);
    public delegate void IoDestroy(Io *io);

    /**
    * PHYSFS_Io
    * An abstract i/o interface.
    */
    [CCode (cname = "PHYSFS_Io", has_type_id = false)]
    public struct Io {
        /**
        * Binary compatibility information.
        */
        public uint32 version;

        /**
        * Instance data for this struct.
        */
        public void* opaque;

        /**
        * Read more data.
        */
        [CCode (cname = "read")]
        public IoRead read_func;

        /**
        * Write more data.
        */
        [CCode (cname = "write")]
        public IoWrite write_func;

        /**
        * Move i/o position to a given byte offset from start.
        */
        [CCode (cname = "seek")]
        public IoSeek seek_func;

        /**
        * Report current i/o position.
        */
        [CCode (cname = "tell")]
        public IoTell tell_func;

        /**
        * Determine size of the i/o instance's dataset.
        */
        [CCode (cname = "length")]
        public IoLength length_func;

        /**
        * Duplicate this i/o instance.
        */
        [CCode (cname = "duplicate")]
        public IoDuplicate duplicate_func;

        /**
        * Flush resources to media, or wherever.
        */
        [CCode (cname = "flush")]
        public IoFlush flush_func;

        /**
        * Cleanup and deallocate i/o instance.
        */
        [CCode (cname = "destroy")]
        public IoDestroy destroy_func;
    }

    /**
    * int PHYSFS_mountIo(Io* io, const char *new_dir, const char *mountPoint, int appendToPath)
    * Add an archive, built on a PHYSFS_Io, to the search path.
    */
    [CCode (cname = "PHYSFS_mountIo")]
    public bool mount_io(Io* io, string new_dir, string mount_point, bool append_to_path);

    [CCode (cname = "compute_func")]
    public delegate void MemoryDel(void* memory);
    /**
    * int PHYSFS_mountMemory(const void* buf, uint64 len, void (*del)(void* ), const char *new_dir, const char *mountPoint, int appendToPath)
    * Add an archive, contained in a memory buffer, to the search path.
    */
    [CCode (cname = "PHYSFS_mountMemory")]
    public bool mount_memory([CCode (array_length = false)] uint8[] buf, MemoryDel? del, string new_dir, string mount_point, bool append_to_path);

    /**
    * PHYSFS_ErrorCode
    * Values that represent specific causes of failure.
    */
    [CCode (cprefix = "PHYSFS_ERR_", cname="int", has_type_id = false)]
    public enum ErrorCode {
        OK,               /**< Success; no error.                    */
        OTHER_ERROR,      /**< Error not otherwise covered here.     */
        OUT_OF_MEMORY,    /**< Memory allocation failed.             */
        NOT_INITIALIZED,  /**< PhysicsFS is not initialized.         */
        IS_INITIALIZED,   /**< PhysicsFS is already initialized.     */
        ARGV0_IS_NULL,    /**< Needed argv[0], but it is NULL.       */
        UNSUPPORTED,      /**< Operation or feature unsupported.     */
        PAST_EOF,         /**< Attempted to access past end of file. */
        FILES_STILL_OPEN, /**< Files still open.                     */
        INVALID_ARGUMENT, /**< Bad parameter passed to an function.  */
        NOT_MOUNTED,      /**< Requested archive/dir not mounted.    */
        NOT_FOUND,        /**< File (or whatever) not found.         */
        SYMLINK_FORBIDDEN,/**< Symlink seen when not permitted.      */
        NO_WRITE_DIR,     /**< No write dir has been specified.      */
        OPEN_FOR_READING, /**< Wrote to a file opened for reading.   */
        OPEN_FOR_WRITING, /**< Read from a file opened for writing.  */
        NOT_A_FILE,       /**< Needed a file, got a directory (etc). */
        READ_ONLY,        /**< Wrote to a read-only filesystem.      */
        CORRUPT,          /**< Corrupted data encountered.           */
        SYMLINK_LOOP,     /**< Infinite symbolic link loop.          */
        IO,               /**< i/o error (hardware failure, etc).    */
        PERMISSION,       /**< Permission denied.                    */
        NO_SPACE,         /**< No space (disk full, over quota, etc) */
        BAD_FILENAME,     /**< Filename is bogus/insecure.           */
        BUSY,             /**< Tried to modify a file the OS needs.  */
        DIR_NOT_EMPTY,    /**< Tried to delete dir with files in it. */
        OS_ERROR,         /**< Unspecified OS-level error.           */
        DUPLICATE,        /**< Duplicate entry.                      */
        BAD_PASSWORD,     /**< Bad password.                         */
        APP_CALLBACK      /**< Application callback reported error.  */
    }

    /**
    * PHYSFS_ErrorCode PHYSFS_getLastErrorCode()
    * Get machine-readable error information.
    */
    [CCode (cname = "PHYSFS_getLastErrorCode")]
    public ErrorCode get_last_error_code();

    /**
    * const char *PHYSFS_getErrorByCode(PHYSFS_ErrorCode code)
    * Get human-readable description string for a given error code.
    */
    [CCode (cname = "PHYSFS_getErrorByCode")]
    public unowned string? get_error_by_code(ErrorCode code);

    /**
    * void PHYSFS_setErrorCode(PHYSFS_ErrorCode code)
    * Set the current thread's error code.
    */
    [CCode (cname = "PHYSFS_setErrorCode")]
    public void set_error_code(ErrorCode code);

    /**
    * const char *PHYSFS_getPrefDir(const char *org, const char *app)
    * Get the user-and-app-specific path where files can be written.
    */
    [CCode (cname = "PHYSFS_getPrefDir")]
    public unowned string? get_pref_dir(string org, string app);

    public delegate void* ArchiverOpenArchive(Io* io, string name, bool for_write, int* claimed);
    public delegate EnumerateCallbackResult ArchiverEnumerate(void* opaque, string dirname, EnumerateCallback cb, string origdir, void* callbackdata);
    public delegate Io* ArchiverOpenRead(void* opaque, string fnm);
    public delegate Io* ArchiverOpenWrite(void* opaque, string filename);
    public delegate Io* ArchiverOpenAppend(void* opaque, string filename);
    public delegate bool ArchiverRemove(void* opaque, string filename);
    public delegate bool ArchiverMkdir(void* opaque, string filename);
    public delegate bool ArchiverStat(void* opaque, string fn, out Stat stat);
    public delegate void ArchiverCloseArchive(void* opaque);
    /**
    * PHYSFS_Archiver
    * Abstract interface to provide support for user-defined archives.
    */
    [CCode (cname = "PHYSFS_Archiver", has_type_id = false)]
    public struct Archiver {
        /**
        * Binary compatibility information.
        */
        public uint32 version;

        /**
        * Basic info about this archiver.
        */
        public ArchiveInfo info;

        /**
        * Open an archive provided by (io).
        */
        [CCode (cname = "openArchive")]
        public ArchiverOpenArchive open_archive_func;

        /**
        * List all files in (dirname).
        */
        [CCode (cname = "enumerate")]
        public ArchiverEnumerate enumerate_func;

        /**
        * Open a file in this archive for reading.
        */
        [CCode (cname = "openRead")]
        public ArchiverOpenRead open_read_func;

        /**
        * Open a file in this archive for writing.
        */
        [CCode (cname = "openWrite")]
        public ArchiverOpenWrite open_write_func;

        /**
        * Open a file in this archive for appending.
        */
        [CCode (cname = "openAppend")]
        public ArchiverOpenAppend open_append_func;

        /**
        * Delete a file or directory in the archive.
        */
        [CCode (cname = "remove")]
        public ArchiverRemove remove_func;

        /**
        * Create a directory in the archive.
        */
        [CCode (cname = "mkdir")]
        public ArchiverMkdir mkdir_func;

        /**
        * Obtain basic file metadata.
        */
        [CCode (cname = "stat")]
        public ArchiverStat stat_func;

        /**
        * Destruct a previously-opened archive.
        */
        [CCode (cname = "closeArchive")]
        public ArchiverCloseArchive close_archive_func;
    }

    /**
    * int PHYSFS_registerArchiver(const PHYSFS_Archiver *archiver)
    * Add a new archiver to the system.
    */
    [CCode (cname = "PHYSFS_registerArchiver")]
    public bool register_archiver(Archiver* archiver);

    /**
    * int PHYSFS_deregisterArchiver(const char *ext)
    * Remove an archiver from the system.
    */
    [CCode (cname = "PHYSFS_deregisterArchiver")]
    public bool deregister_archiver(string ext);
}
