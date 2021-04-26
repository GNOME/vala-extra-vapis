/*
 * PhysicsFS binding for Vala
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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "physfs.h")]
namespace PHYSFS
{
	/**
	* \typedef PHYSFS_uint8
	* \brief An unsigned, 8-bit integer type.
	*/
	[CCode (cname = "PHYSFS_uint8", has_type_id = false)]
	public struct Uint8 : uint8 {}

	/**
	* \typedef PHYSFS_sint8
	* \brief A signed, 8-bit integer type.
	*/
	[CCode (cname = "PHYSFS_sint8", has_type_id = false)]
	public struct Sint8 : int8 {}

	/**
	* \typedef PHYSFS_uint16
	* \brief An unsigned, 16-bit integer type.
	*/
	[CCode (cname = "PHYSFS_uint16", has_type_id = false)]
	public struct Uint16 : uint16 {}

	/**
	* \typedef PHYSFS_sint16
	* \brief A signed, 16-bit integer type.
	*/
	[CCode (cname = "PHYSFS_sint16", has_type_id = false)]
	public struct Sint16 : int16 {}

	/**
	* \typedef PHYSFS_uint32
	* \brief An unsigned, 32-bit integer type.
	*/
	[CCode (cname = "PHYSFS_uint32", has_type_id = false)]
	public struct Uint32 : uint32 {}

	/**
	* \typedef PHYSFS_sint32
	* \brief A signed, 32-bit integer type.
	*/
	[CCode (cname = "PHYSFS_sint32", has_type_id = false)]
	public struct Sint32 : int32 {}

	/**
	* \typedef PHYSFS_uint64
	* \brief An unsigned, 64-bit integer type.
	* \warning on platforms without any sort of 64-bit datatype, this is
	* equivalent to PHYSFS_uint32!
	*/
	[CCode (cname = "PHYSFS_uint64", has_type_id = false)]
	public struct Uint64 : uint {}

	/**
	* \typedef PHYSFS_sint64
	* \brief A signed, 64-bit integer type.
	* \warning on platforms without any sort of 64-bit datatype, this is
	* equivalent to PHYSFS_sint32!
	*/
	[CCode (cname = "PHYSFS_sint64", has_type_id = false)]
	public struct Sint64 : int {}


	/**
	* PHYSFS_ArchiveInfo
	* Information on various PhysicsFS-supported archives.
	*/
	[CCode (cname = "PHYSFS_ArchiveInfo", has_type_id = false)]
	public struct ArchiveInfo {
		public unowned string extension; /**< Archive file extension: "ZIP", for example. */
		public unowned string description; /**< Human-readable archive description. */
		public unowned string author;	/**< Person who did support for this archive. */
		public unowned string url;		/**< URL related to this archive */
		[CCode (cname = "supportsSymlinks")]
		public bool supports_symlinks;	/**< non-zero if archive offers symbolic links. */
	}

	/**
	* PHYSFS_Version
	* Information the version of PhysicsFS in use.
	*/
	[CCode (cname = "PHYSFS_Version", has_type_id = false)]
	public struct Version {
		public Uint8 major; /**< major revision */
		public Uint8 minor; /**< minor revision */
		public Uint8 patch; /**< patchlevel */
	}
	/**
	* void PHYSFS_getLinkedVersion (PHYSFS_Version *ver)
	* Get the version of PhysicsFS that is linked against your program.
	*/
	[CCode (cname = "PHYSFS_getLinkedVersion")]
	public void get_linked_version (Version* ver);

	/**
	* int PHYSFS_init (const char *argv0)
	* Initialize the PhysicsFS library.
	*/
	[CCode (cname = "PHYSFS_init")]
	public bool init (string? argv0);

	/**
	* int PHYSFS_deinit ()
	* Deinitialize the PhysicsFS library.
	*/
	[CCode (cname = "PHYSFS_deinit")]
	public bool deinit ();

	/**
	* const PHYSFS_ArchiveInfo **PHYSFS_supportedArchiveTypes ()
	* Get a list of supported archive types.
	*/
	[CCode (cname = "PHYSFS_supportedArchiveTypes", array_length = false)]
	public unowned ArchiveInfo?[] supported_archive_types ();

	/**
	* void PHYSFS_freeList (void* listVar)
	* Deallocate resources of lists returned by PhysicsFS.
	*/
	[CCode (cname = "PHYSFS_freeList")]
	public void free_list (void* list_var);

	/**
	* const char *PHYSFS_getLastError ()
	* Get human-readable error information.
	*/
	[CCode (cname = "PHYSFS_getLastError")]
	public unowned string? get_last_error ();

	/**
	* const char *PHYSFS_getDirSeparator ()
	* Get platform-dependent dir separator string.
	*/
	[CCode (cname = "PHYSFS_getDirSeparator")]
	public unowned string? get_dir_separator ();

	/**
	* void PHYSFS_permitSymbolicLinks (int allow)
	* Enable or disable following of symbolic links.
	*/
	[CCode (cname = "PHYSFS_permitSymbolicLinks")]
	public void permit_symbolic_links (bool allow);

	/**
	* char **PHYSFS_getCdRomDirs ()
	* Get an array of paths to available CD-ROM drives.
	*/
	[CCode (cname = "PHYSFS_getCdRomDirs", array_length = false)]
	public string?[] get_cdrom_dirs ();

	/**
	* const char *PHYSFS_getBaseDir ()
	* Get the path where the application resides.
	*/
	[CCode (cname = "PHYSFS_getBaseDir")]
	public unowned string? get_base_dir ();


	/**
	* const char *PHYSFS_getUserDir ()
	* Get the path where user's home directory resides.
	*/
	[CCode (cname = "PHYSFS_getUserDir")]
	public unowned string? get_user_dir ();

	/**
	* const char *PHYSFS_getWriteDir ()
	* Get path where PhysicsFS will allow file writing.
	*/
	[CCode (cname = "PHYSFS_getWriteDir")]
	public unowned string? get_write_dir ();

	/**
	* int PHYSFS_setWriteDir (const char *new_dir)
	* Tell PhysicsFS where it may write files.
	*/
	[CCode (cname = "PHYSFS_setWriteDir")]
	public bool set_write_dir (string new_dir);


	/**
	* int PHYSFS_addToSearchPath (const char *new_dir, int appendToPath)
	* Add an archive or directory to the search path.
	*/
	[CCode (cname = "PHYSFS_addToSearchPath")]
	public bool add_to_search_path (string new_dir, bool append_to_path);

	/**
	* int PHYSFS_removeFromSearchPath (const char *old_dir)
	* Remove a directory or archive from the search path.
	*/
	[CCode (cname = "PHYSFS_removeFromSearchPath")]
	public bool remove_from_search_path (string old_dir);

	/**
	* char **PHYSFS_getSearchPath ()
	* Get the current search path.
	*/
	[CCode (cname = "PHYSFS_getSearchPath", array_length = false)]
	public unowned string?[] get_search_path ();

	/**
	* int PHYSFS_setSaneConfig (const char *organization, const char *appName, const char *archiveExt, int includeCdRoms, int archivesFirst)
	* Set up sane, default paths.
	*/
	[CCode (cname = "PHYSFS_setSaneConfig")]
	public bool set_sane_config (string organization, string app_name, string archive_ext, bool include_cdroms, bool archives_first);

	/* Directory management stuff ... */

	/**
	* int PHYSFS_mkdir (const char *dirName)
	* Create a directory.
	*/
	[CCode (cname = "PHYSFS_mkdir")]
	public bool mkdir (string dir_name);

	/**
	* int PHYSFS_delete (const char *filename)
	* Delete a file or directory.
	*/
	[CCode (cname = "PHYSFS_delete")]
	public bool delete (string filename);

	/**
	* const char *PHYSFS_getRealDir (const char *filename)
	* Figure out where in the search path a file resides.
	*/
	[CCode (cname = "PHYSFS_getRealDir")]
	public unowned string? get_real_dir (string filename);

	/**
	* char **PHYSFS_enumerateFiles (const char *dir)
	* Get a file listing of a search path's directory.
	*/
	[CCode (cname = "PHYSFS_enumerateFiles", array_length = false)]
	public unowned string?[] enumerate_files (string dir);

	/**
	* int PHYSFS_exists (const char *fname)
	* Determine if a file exists in the search path.
	*/
	[CCode (cname = "PHYSFS_exists")]
	public bool exists (string fname);

	/**
	* int PHYSFS_isDirectory (const char *fname)
	* Determine if a file in the search path is really a directory.
	*/
	[CCode (cname = "PHYSFS_isDirectory")]
	public bool is_directory (string fname);

	/**
	* int PHYSFS_isSymbolicLink (const char *fname)
	* Determine if a file in the search path is really a symbolic link.
	*/
	[CCode (cname = "PHYSFS_isSymbolicLink")]
	public bool is_symbolic_link (string fname);

	/**
	* PHYSFS_sint64 PHYSFS_getLastModTime (const char *filename)
	* Get the last modification time of a file.
	*/
	[CCode (cname = "PHYSFS_getLastModTime")]
	public Sint64 get_last_mod_time (string filename);

	/* i/o stuff... */

	[Compact]
	[CCode (cname = "PHYSFS_File", has_type_id = false, free_function = "PHYSFS_close")]
	public class File {
		/**
		* File* PHYSFS_openWrite (const char *filename)
		* Open a file for writing.
		*/
		[CCode (cname = "PHYSFS_openWrite")]
		public File.open_write (string filename);

		/**
		* File* PHYSFS_openAppend (const char *filename)
		* Open a file for appending.
		*/
		[CCode (cname = "PHYSFS_openAppend")]
		public File.open_append (string filename);

		/**
		* File* PHYSFS_openRead (const char *filename)
		* Open a file for reading.
		*/
		[CCode (cname = "PHYSFS_openRead")]
		public File.open_read (string filename);

		/**
		* int PHYSFS_close (File* handle)
		* Close a PhysicsFS filehandle.
		*/
		[CCode (cname = "PHYSFS_close")]
		public bool close ();

		/**
		* PHYSFS_sint64 PHYSFS_read (File* handle, void* buffer, PHYSFS_uint32 objSize, PHYSFS_uint32 objCount)
		* Read data from a PhysicsFS filehandle
		*/
		[CCode (cname = "PHYSFS_read")]
		public Sint64 read ([CCode (array_length = false)] uint8[] buffer, Uint32 obj_size, Uint32 obj_count);

		/**
		* PHYSFS_sint64 PHYSFS_write (File* handle, const void* buffer, PHYSFS_uint32 objSize, PHYSFS_uint32 objCount)
		* Write data to a PhysicsFS filehandle
		*/
		[CCode (cname = "PHYSFS_write")]
		public Sint64 write ([CCode (array_length = false)] uint8[] buffer, Uint32 obj_size, Uint32 obj_count);

		/* File position stuff... */

		/**
		* int PHYSFS_eof (File* handle)
		* Check for end-of-file state on a PhysicsFS filehandle.
		*/
		[CCode (cname = "PHYSFS_eof")]
		public bool eof ();

		/**
		* PHYSFS_sint64 PHYSFS_tell (File* handle)
		* Determine current position within a PhysicsFS filehandle.
		*/
		[CCode (cname = "PHYSFS_tell")]
		public Sint64 tell ();

		/**
		* int PHYSFS_seek (File* handle, PHYSFS_uint64 pos)
		* Seek to a new position within a PhysicsFS filehandle.
		*/
		[CCode (cname = "PHYSFS_seek")]
		public int seek (Uint64 pos);

		/**
		* PHYSFS_sint64 FileLength (File* handle)
		* Get total length of a file in bytes.
		*/
		[CCode (cname = "PHYSFS_fileLength")]
		public Sint64 length ();

		/* Buffering stuff... */

		/**
		* int PHYSFS_setBuffer (File* handle, PHYSFS_uint64 bufsize)
		* Set up buffering for a PhysicsFS file handle.
		*/
		[CCode (cname = "PHYSFS_setBuffer")]
		public bool set_buffering (Uint64 buf_size);

		/**
		* int PHYSFS_flush (File* handle)
		* Flush a buffered PhysicsFS file handle.
		*/
		[CCode (cname = "PHYSFS_flush")]
		public bool flush ();

		/**
		* PHYSFS_sint64 PHYSFS_readBytes (File* handle, void* buffer, PHYSFS_uint64 len)
		* Read bytes from a PhysicsFS filehandle
		*/
		[CCode (cname = "PHYSFS_readBytes")]
		public Sint64 read_bytes ([CCode (array_length = false)] uint8[] buffer, Uint64 len);

		/**
		* PHYSFS_sint64 PHYSFS_writeBytes (File* handle, const void* buffer, PHYSFS_uint64 len)
		* Write data to a PhysicsFS filehandle
		*/
		[CCode (cname = "PHYSFS_writeBytes")]
		public Sint64 write_bytes (uint8[] buffer);

		/**
		* int PHYSFS_readSLE16 (File* file, PHYSFS_sint16 *val)
		* Read and convert a signed 16-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readSLE16")]
		public bool read_sle16 (out Sint16 val);

		/**
		* int PHYSFS_readULE16 (File* file, PHYSFS_uint16 *val)
		* Read and convert an unsigned 16-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readULE16")]
		public bool read_ule16 (out Uint16 val);

		/**
		* int PHYSFS_readSBE16 (File* file, PHYSFS_sint16 *val)
		* Read and convert a signed 16-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readSBE16")]
		public bool read_sbe16 (out Sint16 val);

		/**
		* int PHYSFS_readUBE16 (File* file, PHYSFS_uint16 *val)
		* Read and convert an unsigned 16-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readUBE16")]
		public bool read_ube16 (out Uint16 val);

		/**
		* int PHYSFS_readSLE32 (File* file, PHYSFS_sint32 *val)
		* Read and convert a signed 32-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readSLE32")]
		public bool read_sle32 (out Sint32 val);

		/**
		* int PHYSFS_readULE32 (File* file, PHYSFS_uint32 *val)
		* Read and convert an unsigned 32-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readULE32")]
		public bool read_ule32 (out Uint32 val);

		/**
		* int PHYSFS_readSBE32 (File* file, PHYSFS_sint32 *val)
		* Read and convert a signed 32-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readSBE32")]
		public bool read_sbe32 (out Sint32 val);

		/**
		* int PHYSFS_readUBE32 (File* file, PHYSFS_uint32 *val)
		* Read and convert an unsigned 32-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readUBE32")]
		public bool read_ube32 (out Uint32 val);

		/**
		* int PHYSFS_readSLE64 (File* file, PHYSFS_sint64 *val)
		* Read and convert a signed 64-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readSLE64")]
		public bool read_sle64 (out Sint64 val);

		/**
		* int PHYSFS_readULE64 (File* file, PHYSFS_uint64 *val)
		* Read and convert an unsigned 64-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_readULE64")]
		public bool read_ule64 (out Uint64 val);

		/**
		* int PHYSFS_readSBE64 (File* file, PHYSFS_sint64 *val)
		* Read and convert a signed 64-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readSBE64")]
		public bool read_sbe64 (out Sint64 val);

		/**
		* int PHYSFS_readUBE64 (File* file, PHYSFS_uint64 *val)
		* Read and convert an unsigned 64-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_readUBE64")]
		public bool read_ube64 (out Uint64 val);

		/**
		* int PHYSFS_writeSLE16 (File* file, PHYSFS_sint16 val)
		* Convert and write a signed 16-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeSLE16")]
		public bool write_sle16 (Sint16 val);

		/**
		* int PHYSFS_writeULE16 (File* file, PHYSFS_uint16 val)
		* Convert and write an unsigned 16-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeULE16")]
		public bool write_ule16 (Uint16 val);

		/**
		* int PHYSFS_writeSBE16 (File* file, PHYSFS_sint16 val)
		* Convert and write a signed 16-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_writeSBE16")]
		public bool write_sbe16 (Sint16 val);

		/**
		* int PHYSFS_writeUBE16 (File* file, PHYSFS_uint16 val)
		* Convert and write an unsigned 16-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_writeUBE16")]
		public bool write_ube16 (Uint16 val);

		/**
		* int PHYSFS_writeSLE32 (File* file, PHYSFS_sint32 val)
		* Convert and write a signed 32-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeSLE32")]
		public bool write_sle32 (Sint32 val);

		/**
		* int PHYSFS_writeULE32 (File* file, PHYSFS_uint32 val)
		* Convert and write an unsigned 32-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeULE32")]
		public bool write_ule32 (Uint32 val);

		/**
		* int PHYSFS_writeSBE32 (File* file, PHYSFS_sint32 val)
		* Convert and write a signed 32-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_writeSBE32")]
		public bool write_sbe32 (Sint32 val);

		/**
		* int PHYSFS_writeUBE32 (File* file, PHYSFS_uint32 val)
		* Convert and write an unsigned 32-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_writeUBE32")]
		public bool write_ube32 (Uint32 val);

		/**
		* int PHYSFS_writeSLE64 (File* file, PHYSFS_sint64 val)
		* Convert and write a signed 64-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeSLE64")]
		public bool write_sle64 (Sint64 val);

		/**
		* int PHYSFS_writeULE64 (File* file, PHYSFS_uint64 val)
		* Convert and write an unsigned 64-bit littleendian value.
		*/
		[CCode (cname = "PHYSFS_writeULE64")]
		public bool write_ule64 (Uint64 val);

		/**
		* int PHYSFS_writeSBE64 (File* file, PHYSFS_sint64 val)
		* Convert and write a signed 64-bit bigending value.
		*/
		[CCode (cname = "PHYSFS_writeSBE64")]
		public bool write_sbe64 (Sint64 val);

		/**
		* int PHYSFS_writeUBE64 (File* file, PHYSFS_uint64 val)
		* Convert and write an unsigned 64-bit bigendian value.
		*/
		[CCode (cname = "PHYSFS_writeUBE64")]
		public bool write_ube64 (Uint64 val);

		/**
		* int PHYSFS_mountHandle (File* file, const char *new_dir, const char *mountPoint, int appendToPath)
		* Add an archive, contained in a File handle, to the search path.
		*/
		[CCode (cname = "PHYSFS_mountHandle")]
		public bool mount_handle (string new_dir, string mount_point, bool append_to_path);
	}

	/* Byteorder stuff... */

	/**
	* PHYSFS_sint16 PHYSFS_swapSLE16 (PHYSFS_sint16 val)
	* Swap littleendian signed 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE16")]
	public Sint16 swap_sle16 (Sint16 val);


	/**
	* PHYSFS_uint16 PHYSFS_swapULE16 (PHYSFS_uint16 val)
	* Swap littleendian unsigned 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE16")]
	public Uint16 swap_ule16 (Uint16 val);

	/**
	* PHYSFS_sint32 PHYSFS_swapSLE32 (PHYSFS_sint32 val)
	* Swap littleendian signed 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE32")]
	public Sint32 swap_sle32 (Sint32 val);


	/**
	* PHYSFS_uint32 PHYSFS_swapULE32 (PHYSFS_uint32 val)
	* Swap littleendian unsigned 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE32")]
	public Uint32 swap_ule32 (Uint32 val);

	/**
	* PHYSFS_sint64 PHYSFS_swapSLE64 (PHYSFS_sint64 val)
	* Swap littleendian signed 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE64")]
	public Sint64 swap_sle64 (Sint64 val);

	/**
	* PHYSFS_uint64 PHYSFS_swapULE64 (PHYSFS_uint64 val)
	* Swap littleendian unsigned 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE64")]
	public Uint64 swap_ule64 (Uint64 val);

	/**
	* PHYSFS_sint16 PHYSFS_swapSBE16 (PHYSFS_sint16 val)
	* Swap bigendian signed 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE16")]
	public Sint16 swap_sbe16 (Sint16 val);

	/**
	* PHYSFS_uint16 PHYSFS_swapUBE16 (PHYSFS_uint16 val)
	* Swap bigendian unsigned 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE16")]
	public Uint16 swap_ube16 (Uint16 val);

	/**
	* PHYSFS_sint32 PHYSFS_swapSBE32 (PHYSFS_sint32 val)
	* Swap bigendian signed 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE32")]
	public Sint32 swap_sbe32 (Sint32 val);

	/**
	* PHYSFS_uint32 PHYSFS_swapUBE32 (PHYSFS_uint32 val)
	* Swap bigendian unsigned 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE32")]
	public Uint32 swap_ube32 (Uint32 val);

	/**
	* PHYSFS_sint64 PHYSFS_swapSBE64 (PHYSFS_sint64 val)
	* Swap bigendian signed 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE64")]
	public Sint64 swap_sbe64 (Sint64 val);

	/**
	* PHYSFS_uint64 PHYSFS_swapUBE64 (PHYSFS_uint64 val)
	* Swap bigendian unsigned 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE64")]
	public Uint64 swap_ube64 (Uint64 val);

	/* Everything above this line is part of the PhysicsFS 1.0 API. */

	/**
	* int PHYSFS_isInit ()
	* Determine if the PhysicsFS library is initialized.
	*/
	[CCode (cname = "PHYSFS_isInit")]
	public bool is_init ();

	/**
	* int PHYSFS_symbolicLinksPermitted ()
	* Determine if the symbolic links are permitted.
	*/
	[CCode (cname = "PHYSFS_symbolicLinksPermitted")]
	public bool symbolic_links_permitted ();

	[CCode (has_target = false, has_typedef = false)]
	public delegate int InitFunc (); /**< Initialize. Can be NULL. Zero on failure. */
	[CCode (has_target = false, has_typedef = false)]
	public delegate void DeinitFunc (); /**< Deinitialize your allocator. Can be NULL. */
	[CCode (has_target = false, has_typedef = false)]
	public delegate void* MallocFunc (Uint64 size); /**< Allocate like malloc (). */
	[CCode (has_target = false, has_typedef = false)]
	public delegate void* ReallocFunc (void* dst, Uint64 size); /**< Reallocate like realloc (). */
	[CCode (has_target = false, has_typedef = false)]
	public delegate void FreeFunc (void* pointer); /**< Free memory from Malloc or Realloc. */
	/**
	* PHYSFS_Allocator
	* PhysicsFS allocation function pointers.
	*/
	[CCode (cname = "PHYSFS_Allocator", has_type_id = false)]
	public struct Allocator {
		[CCode (cname = "Init")]
		public InitFunc init_func;	/**< Initialize. Can be NULL. Zero on failure. */
		[CCode (cname = "Deinit")]
		public DeinitFunc deinit_func; /**< Deinitialize your allocator. Can be NULL. */
		[CCode (cname = "Malloc")]
		public MallocFunc malloc_func; /**< Allocate like malloc (). */
		[CCode (cname = "Realloc")]
		public ReallocFunc realloc_func; /**< Reallocate like realloc (). */
		[CCode (cname = "Free")]
		public FreeFunc free_func;		/**< Free memory from Malloc or Realloc. */
	}

	/**
	* int PHYSFS_setAllocator (const PHYSFS_Allocator *allocator)
	* Hook your own allocation routines into PhysicsFS.
	*/
	[CCode (cname = "PHYSFS_setAllocator")]
	public bool set_allocator (Allocator* allocator);

	/**
	* int PHYSFS_mount (const char *new_dir, const char *mountPoint, int appendToPath)
	* Add an archive or directory to the search path.
	*/
	[CCode (cname = "PHYSFS_mount")]
	public bool mount (string new_dir, string mount_point, bool append_to_path);

	/**
	* int PHYSFS_getMountPoint (const char *dir)
	* Determine a mounted archive's mountpoint.
	*/
	[CCode (cname = "PHYSFS_getMountPoint")]
	public unowned string? get_mount_point (string dir);

	/**
	* PHYSFS_StringCallback
	* Function signature for callbacks that report strings.
	*/
	[CCode (cname = "PHYSFS_StringCallback", instance_pos = 0.1)]
	public delegate void StringCallback (string str);

	/**
	* PHYSFS_EnumFilesCallback
	* Function signature for callbacks that enumerate files.
	*/
	[CCode (cname = "PHYSFS_EnumFilesCallback", instance_pos = 0.1)]
	public delegate void EnumFilesCallback (string origdir, string fname);

	/**
	* void PHYSFS_getCdRomDirsCallback (PHYSFS_StringCallback c, void* d)
	* Enumerate CD-ROM directories, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_getCdRomDirsCallback")]
	public void get_cdrom_dirs_callback (StringCallback c);

	/**
	* void PHYSFS_getSearchPathCallback (PHYSFS_StringCallback c, void* d)
	* Enumerate the search path, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_getSearchPathCallback")]
	public void get_search_path_callback (StringCallback c);

	/**
	* void PHYSFS_enumerateFilesCallback (const char *dir, PHYSFS_EnumFilesCallback c, void* d)
	* Get a file listing of a search path's directory, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_enumerateFilesCallback")]
	public void enumerate_files_callback (string dir, EnumFilesCallback c);

	/**
	* void PHYSFS_utf8FromUcs4 (const PHYSFS_uint32 *src, char *dst, PHYSFS_uint64 len)
	* Convert a UCS-4 string to a UTF-8 string.
	*/
	[CCode (cname = "PHYSFS_utf8FromUcs4")]
	public void utf8_from_ucs4 ([CCode (array_length = false)] Uint32[] src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] uint8[] dst);

	/**
	* void PHYSFS_utf8ToUcs4 (const char *src, PHYSFS_uint32 *dst, PHYSFS_uint64 len)
	* Convert a UTF-8 string to a UCS-4 string.
	*/
	[CCode (cname = "PHYSFS_utf8ToUcs4")]
	public void utf8_to_ucs4 (string src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] Uint32[] dst);

	/**
	* void PHYSFS_utf8FromUcs2 (const PHYSFS_uint16 *src, char *dst, PHYSFS_uint64 len)
	* Convert a UCS-2 string to a UTF-8 string.
	*/
	[CCode (cname = "PHYSFS_utf8FromUcs2")]
	public void utf8_from_ucs2 ([CCode (array_length = false)] Uint16[] src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] uint8[] dst);

	/**
	* PHYSFS_utf8ToUcs2 (const char *src, PHYSFS_uint16 *dst, PHYSFS_uint64 len)
	* Convert a UTF-8 string to a UCS-2 string.
	*/
	[CCode (cname = "PHYSFS_utf8ToUcs2")]
	public void utf8_to_ucs2 (string src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] Uint16[] dst);

	/**
	* void PHYSFS_utf8FromLatin1 (const char *src, char *dst, PHYSFS_uint64 len)
	* Convert a UTF-8 string to a Latin1 string.
	*/
	[CCode (cname = "PHYSFS_utf8FromLatin1")]
	public void utf8_from_latin1 (string src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] uint8[] dst);

	/* Everything above this line is part of the PhysicsFS 2.0 API. */

	/**
	* int PHYSFS_caseFold (const PHYSFS_uint32 from, PHYSFS_uint32 *to)
	* "Fold" a Unicode codepoint to a lowercase equivalent.
	*/
	[CCode (cname = "PHYSFS_caseFold")]
	public int case_fold (Uint32 from, out Uint32 to);

	/**
	* int PHYSFS_utf8stricmp (const char *str1, const char *str2)
	* Case-insensitive compare of two UTF-8 strings.
	*/
	[CCode (cname = "PHYSFS_utf8stricmp")]
	public int utf8_stricmp (string str1, string str2);

	/**
	* int PHYSFS_utf16stricmp (const PHYSFS_uint16 *str1, const PHYSFS_uint16 *str2)
	* Case-insensitive compare of two UTF-16 strings.
	*/
	[CCode (cname = "PHYSFS_utf16stricmp")]
	public int utf16_stricmp ([CCode (array_length = false)] Uint16[] str1, [CCode (array_length = false)] Uint16[] str2);

	/**
	* int PHYSFS_ucs4stricmp (const PHYSFS_uint32 *str1, const PHYSFS_uint32 *str2)
	* Case-insensitive compare of two UCS-4 strings.
	*/
	[CCode (cname = "PHYSFS_ucs4stricmp")]
	public int ucs4_stricmp ([CCode (array_length = false)] Uint32[] str1, [CCode (array_length = false)] Uint32[] str2);

	/**
	* PHYSFS_EnumerateCallback
	* Possible return values from PHYSFS_EnumerateCallback.
	*/
	[CCode (cprefix = "PHYSFS_ENUM_", cname = "int", has_type_id = false)]
	public enum EnumerateCallbackResult {
		ERROR = -1, /**< Stop enumerating, report error to app. */
		STOP = 0,	/**< Stop enumerating, report success to app. */
		OK = 1		/**< Keep enumerating, no problems */
	}

	/**
	* PHYSFS_EnumerateCallback
	* Function signature for callbacks that enumerate and return results.
	*/
	[CCode (cname = "PHYSFS_EnumerateCallback", instance_pos = 0.1)]
	public delegate EnumerateCallbackResult EnumerateCallback (string origdir, string fname);

	/**
	* int PHYSFS_enumerate (const char *dir, PHYSFS_EnumerateCallback c, void* d)
	* Get a file listing of a search path's directory, using an application-defined callback, with errors reported.
	*/
	[CCode (cname = "PHYSFS_enumerate")]
	public bool enumerate (string dir, EnumerateCallback c);

	/**
	* int PHYSFS_unmount (const char *old_dir)
	* Remove a directory or archive from the search path.
	*/
	[CCode (cname = "PHYSFS_unmount")]
	public bool unmount (string old_dir);

	/**
	* const PHYSFS_Allocator *PHYSFS_getAllocator ()
	* Discover the current allocator.
	*/
	[CCode (cname = "PHYSFS_getAllocator")]
	public unowned Allocator* get_allocator ();

	/**
	* FileType
	* Possible types of a file.
	*/
	[CCode (cprefix = "PHYSFS_FILETYPE_", cname = "int", has_type_id = false)]
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
		public Sint64 filesize; /**< size in bytes, -1 for non-files and unknown */
		public Sint64 modtime; /**< last modification time */
		public Sint64 createtime; /**< like modtime, but for file creation time */
		public Sint64 accesstime; /**< like modtime, but for file access time */
		public FileType filetype; /**< File? Directory? Symlink? */
		public bool readonly; /**< non-zero if read only, zero if writable. */
	}

	/**
	* int PHYSFS_stat (const char *fname, PHYSFS_Stat *stat)
	* Get various information about a directory or a file.
	*/
	[CCode (cname = "PHYSFS_stat")]
	public bool stat (string fname, out Stat stat);

	/**
	* void PHYSFS_utf8FromUtf16 (const PHYSFS_uint16 *src, char *dst, PHYSFS_uint64 len)
	* Convert a UTF-16 string to a UTF-8 string.
	*/
	[CCode (cname = "PHYSFS_utf8FromUtf16")]
	public void utf8_from_utf16 ([CCode (array_length = false)] Uint16[] src, [CCode (array_length_cname = "len", array_length_type = "PHYSFS_uint64")] uint8[] dst);

	/**
	* PHYSFS_utf8ToUtf16 (const char *src, PHYSFS_uint16 *dst, PHYSFS_uint64 len)
	* Convert a UTF-8 string to a UTF-16 string.
	*/
	[CCode (cname = "PHYSFS_utf8ToUtf16")]
	public void utf8_to_utf16 (string src, [CCode (array_length = false)] Uint16[] dst, Uint64 len);

	[CCode (has_target = false, has_typedef = false)]
	public delegate Sint64 IoReadFunc (Io* io, void* buf, Uint64 len);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Sint64 IoWriteFunc (Io *io, void* buffer, Uint64 len);
	[CCode (has_target = false, has_typedef = false)]
	public delegate bool IoSeekFunc (Io *io, Uint64 offset);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Sint64 IoTellFunc (Io *io);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Sint64 IoLengthFunc (Io *io);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Io* IoDuplicateFunc (Io *io);
	[CCode (has_target = false, has_typedef = false)]
	public delegate bool IoFlushFunc (Io *io);
	[CCode (has_target = false, has_typedef = false)]
	public delegate void IoDestroyFunc (Io *io);

	/**
	* PHYSFS_Io
	* An abstract i/o interface.
	*/
	[CCode (cname = "PHYSFS_Io", has_type_id = false)]
	public struct Io {
		/**
		* Binary compatibility information.
		*/
		public Uint32 version;

		/**
		* Instance data for this struct.
		*/
		public void* opaque;

		/**
		* Read more data.
		*/
		[CCode (cname = "read")]
		public IoReadFunc read_func;

		/**
		* Write more data.
		*/
		[CCode (cname = "write")]
		public IoWriteFunc write_func;

		/**
		* Move i/o position to a given byte offset from start.
		*/
		[CCode (cname = "seek")]
		public IoSeekFunc seek_func;

		/**
		* Report current i/o position.
		*/
		[CCode (cname = "tell")]
		public IoTellFunc tell_func;

		/**
		* Determine size of the i/o instance's dataset.
		*/
		[CCode (cname = "length")]
		public IoLengthFunc length_func;

		/**
		* Duplicate this i/o instance.
		*/
		[CCode (cname = "duplicate")]
		public IoDuplicateFunc duplicate_func;

		/**
		* Flush resources to media, or wherever.
		*/
		[CCode (cname = "flush")]
		public IoFlushFunc flush_func;

		/**
		* Cleanup and deallocate i/o instance.
		*/
		[CCode (cname = "destroy")]
		public IoDestroyFunc destroy_func;
	}

	/**
	* int PHYSFS_mountIo (Io* io, const char *new_dir, const char *mountPoint, int appendToPath)
	* Add an archive, built on a PHYSFS_Io, to the search path.
	*/
	[CCode (cname = "PHYSFS_mountIo")]
	public bool mount_io (Io* io, string new_dir, string mount_point, bool append_to_path);

	[CCode (has_target = false, has_typedef = false)]
	public delegate void MemoryDel (void* memory);
	/**
	* int PHYSFS_mountMemory (const void* buf, PHYSFS_uint64 len, void (*del) (void* ), const char *new_dir, const char *mountPoint, int appendToPath)
	* Add an archive, contained in a memory buffer, to the search path.
	*/
	[CCode (cname = "PHYSFS_mountMemory")]
	public bool mount_memory (uint8[] buf, MemoryDel? del, string new_dir, string mount_point, bool append_to_path);

	/**
	* PHYSFS_ErrorCode
	* Values that represent specific causes of failure.
	*/
	[CCode (cprefix = "PHYSFS_ERR_", cname = "int", has_type_id = false)]
	public enum ErrorCode {
		OK,		/**< Success; no error.					*/
		OTHER_ERROR,	/**< Error not otherwise covered here.	*/
		OUT_OF_MEMORY,	/**< Memory allocation failed.			*/
		NOT_INITIALIZED, /**< PhysicsFS is not initialized.		*/
		IS_INITIALIZED, /**< PhysicsFS is already initialized.	*/
		ARGV0_IS_NULL,	/**< Needed argv[0], but it is NULL.	*/
		UNSUPPORTED,	/**< Operation or feature unsupported.	*/
		PAST_EOF,	/**< Attempted to access past end of file. */
		FILES_STILL_OPEN, /**< Files still open. */
		INVALID_ARGUMENT, /**< Bad parameter passed to an function. */
		NOT_MOUNTED,	/**< Requested archive/dir not mounted.	*/
		NOT_FOUND,	/**< File (or whatever) not found.	*/
		SYMLINK_FORBIDDEN,/**< Symlink seen when not permitted.	*/
		NO_WRITE_DIR,	/**< No write dir has been specified.	*/
		OPEN_FOR_READING, /**< Wrote to a file opened for reading. */
		OPEN_FOR_WRITING, /**< Read from a file opened for writing. */
		NOT_A_FILE,	/**< Needed a file, got a directory (etc). */
		READ_ONLY,	/**< Wrote to a read-only filesystem.	*/
		CORRUPT,	/**< Corrupted data encountered.	*/
		SYMLINK_LOOP,	/**< Infinite symbolic link loop.	*/
		IO,		/**< i/o error (hardware failure, etc).	*/
		PERMISSION,	/**< Permission denied.	*/
		NO_SPACE,	/**< No space (disk full, over quota, etc) */
		BAD_FILENAME,	/**< Filename is bogus/insecure.	*/
		BUSY,		/**< Tried to modify a file the OS needs. */
		DIR_NOT_EMPTY,	/**< Tried to delete dir with files in it. */
		OS_ERROR,	/**< Unspecified OS-level error.*/
		DUPLICATE,	/**< Duplicate entry.	*/
		BAD_PASSWORD,	/**< Bad password.*/
		APP_CALLBACK	/**< Application callback reported error. */
	}

	/**
	* PHYSFS_ErrorCode PHYSFS_getLastErrorCode ()
	* Get machine-readable error information.
	*/
	[CCode (cname = "PHYSFS_getLastErrorCode")]
	public ErrorCode get_last_error_code ();

	/**
	* const char *PHYSFS_getErrorByCode (PHYSFS_ErrorCode code)
	* Get human-readable description string for a given error code.
	*/
	[CCode (cname = "PHYSFS_getErrorByCode")]
	public unowned string? get_error_by_code (ErrorCode code);

	/**
	* void PHYSFS_setErrorCode (PHYSFS_ErrorCode code)
	* Set the current thread's error code.
	*/
	[CCode (cname = "PHYSFS_setErrorCode")]
	public void set_error_code (ErrorCode code);

	/**
	* const char *PHYSFS_getPrefDir (const char *org, const char *app)
	* Get the user-and-app-specific path where files can be written.
	*/
	[CCode (cname = "PHYSFS_getPrefDir")]
	public unowned string? get_pref_dir (string org, string app);

	[CCode (has_target = false, has_typedef = false)]
	public delegate void* ArchiverOpenArchiveFunc (Io* io, string name, bool for_write, int* claimed);
	[CCode (has_typedef = false)]
	public delegate EnumerateCallbackResult ArchiverEnumerateFunc (void* opaque, string dirname, EnumerateCallback cb, string origdir);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Io* ArchiverOpenReadFunc (void* opaque, string fnm);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Io* ArchiverOpenWriteFunc (void* opaque, string filename);
	[CCode (has_target = false, has_typedef = false)]
	public delegate Io* ArchiverOpenAppendFunc (void* opaque, string filename);
	[CCode (has_target = false, has_typedef = false)]
	public delegate bool ArchiverRemoveFunc (void* opaque, string filename);
	[CCode (has_target = false, has_typedef = false)]
	public delegate bool ArchiverMkdirFunc (void* opaque, string filename);
	[CCode (has_target = false, has_typedef = false)]
	public delegate bool ArchiverStatFunc (void* opaque, string fn, out Stat stat);
	[CCode (has_target = false, has_typedef = false)]
	public delegate void ArchiverCloseArchiveFunc (void* opaque);
	/**
	* PHYSFS_Archiver
	* Abstract interface to provide support for user-defined archives.
	*/
	[CCode (cname = "PHYSFS_Archiver", has_type_id = false)]
	public struct Archiver {
		/**
		* Binary compatibility information.
		*/
		public Uint32 version;

		/**
		* Basic info about this archiver.
		*/
		public ArchiveInfo info;

		/**
		* Open an archive provided by (io).
		*/
		[CCode (cname = "openArchive")]
		public ArchiverOpenArchiveFunc open_archive_func;

		/**
		* List all files in (dirname).
		*/
		[CCode (cname = "enumerate", delegate_target = false)]
		public ArchiverEnumerateFunc enumerate_func;

		/**
		* Open a file in this archive for reading.
		*/
		[CCode (cname = "openRead")]
		public ArchiverOpenReadFunc open_read_func;

		/**
		* Open a file in this archive for writing.
		*/
		[CCode (cname = "openWrite")]
		public ArchiverOpenWriteFunc open_write_func;

		/**
		* Open a file in this archive for appending.
		*/
		[CCode (cname = "openAppend")]
		public ArchiverOpenAppendFunc open_append_func;

		/**
		* Delete a file or directory in the archive.
		*/
		[CCode (cname = "remove")]
		public ArchiverRemoveFunc remove_func;

		/**
		* Create a directory in the archive.
		*/
		[CCode (cname = "mkdir")]
		public ArchiverMkdirFunc mkdir_func;

		/**
		* Obtain basic file metadata.
		*/
		[CCode (cname = "stat")]
		public ArchiverStatFunc stat_func;

		/**
		* Destruct a previously-opened archive.
		*/
		[CCode (cname = "closeArchive")]
		public ArchiverCloseArchiveFunc close_archive_func;
	}

	/**
	* int PHYSFS_registerArchiver (const PHYSFS_Archiver *archiver)
	* Add a new archiver to the system.
	*/
	[CCode (cname = "PHYSFS_registerArchiver")]
	public bool register_archiver (Archiver* archiver);

	/**
	* int PHYSFS_deregisterArchiver (const char *ext)
	* Remove an archiver from the system.
	*/
	[CCode (cname = "PHYSFS_deregisterArchiver")]
	public bool deregister_archiver (string ext);
}
