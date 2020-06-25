/* PROJ Vala Bindings
 * Copyright 2020 Corentin Noël
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the “Software”), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

[CCode (cheader_filename = "proj.h", cprefix = "proj_")]
namespace Proj {
    /**
     * Functionality for handling thread contexts
     */
    [CCode (cname = "PJ_CONTEXT", cprefix = "proj_context_", free_function = "proj_context_destroy", has_type_id = false)]
    [Compact]
    public class Context {
        [CCode (cname = "proj_context_create")]
        public Context ();
        public void set_file_finder (Proj.FileFinder finder);
        public void set_search_paths (int count_paths, string[] paths);
        private void _use_proj4_init_rules (int enable);
        [CCode (cname = "vala_proj_use_proj4_init_rules")]
        public void use_proj4_init_rules (bool enable) {
            _use_proj4_init_rules (enable ? 1 : 0);
        }
        private int _get_use_proj4_init_rules (int from_legacy_code_path);
        [CCode (cname = "vala_proj_context_get_use_proj4_init_rules")]
        public bool get_use_proj4_init_rules (bool from_legacy_code_path) {
            return _get_use_proj4_init_rules (from_legacy_code_path ? 1 : 0) != 0;
        }
    }
    /**
     * Transformation definition
     */
    [CCode (cname = "PJ", cprefix = "proj_", free_function = "proj_destroy", has_type_id = false)]
    [Compact]
    public class Projection {
        [CCode (cname = "proj_create")]
        public Projection (Proj.Context ctx, string definition);
        [CCode (cname = "proj_create_argv")]
        public Projection.argv (Proj.Context ctx, [CCode (array_length_pos = 0.9)] string[] argv);
        [CCode (cname = "proj_create_crs_to_crs")]
        public Projection.crs_to_crs (Proj.Context ctx, string source_crs, string target_crs, Proj.Area? area);
        [CCode (cname = "proj_create_crs_to_crs_from_pj")]
        public Projection.crs_to_crs_from_pj (Proj.Context ctx, Proj.Projection source_crs, Proj.Projection target_crs, Proj.Area? area, [CCode (array_length = false)] string[] options);
        public void assign_context (Proj.Context ctx);
        private int _angular_input (Proj.Direction dir);
        [CCode (cname = "vala_proj_angular_input")]
        public bool angular_input (Proj.Direction dir) {
          return _angular_input (dir) != 0;
        }
        private int _angular_output (Proj.Direction dir);
        [CCode (cname = "vala_proj_angular_output")]
        public bool angular_output (Proj.Direction dir) {
          return _angular_output (dir) != 0;
        }
        public Proj.Coordinate trans (Proj.Direction direction, Proj.Coordinate coord);
        public int trans_array (Proj.Direction direction, [CCode (array_length_pos = 0.9)] Proj.Coordinate[] coord);
        [CCode (instance_pos = 1.9)]
        public Proj.Projection normalize_for_visualization (Proj.Context ctx);
        /**
         * Measure internal consistency - in forward or inverse direction
         */
        public double roundtrip (Proj.Direction direction, [CCode (array_length_pos = 0.9)] Proj.Coordinate[] coord);
        /**
         * Geodesic distance between two points with angular 2D coordinates
         */
        public double lp_dist (Proj.Coordinate a, Proj.Coordinate b);
        /**
         * Geodesic distance AND the vertical offset
         */
        public double lpz_dist (Proj.Coordinate a, Proj.Coordinate b);
        /**
         * Geodesic distance (in meter) + fwd and rev azimuth between two points on the ellipsoid
         */
        public Proj.Coordinate geod (Proj.Coordinate a, Proj.Coordinate b);
        /**
         * Scaling and angular distortion factors
         */
        public Proj.Factors factors (Proj.Coordinate lp);
    }
    [CCode (cname = "PJ_OPERATION_FACTORY_CONTEXT", cprefix = "proj_operation_factory_context_", free_function = "proj_operation_factory_context_destroy", has_type_id = false)]
    [Compact]
    public class OperationFactoryContext {
        [CCode (cname = "proj_create_operation_factory_context")]
        public OperationFactoryContext (Proj.Context ctx, string authority);
        [CCode (instance_pos = 0.9)]
        public void set_desired_accuracy (Proj.Context ctx, double accuracy);
        [CCode (instance_pos = 0.9)]
        public void set_area_of_interest (Proj.Context ctx, double west_lon_degree, double south_lat_degree, double east_lon_degree, double north_lat_degree);
        [CCode (instance_pos = 0.9)]
        public void set_crs_extent_use (Proj.Context ctx, Proj.CrsExtentUse use);
        [CCode (instance_pos = 0.9)]
        public void set_spatial_criterion (Proj.Context ctx, Proj.SpatialCriterion criterion);
        [CCode (instance_pos = 0.9)]
        public void set_grid_availability_use (Proj.Context ctx, Proj.GridAvailabilityUse use);
        [CCode (instance_pos = 0.9)]
        public void set_use_proj_alternative_grid_names (Proj.Context ctx, int usePROJNames);
        [CCode (instance_pos = 0.9)]
        public void set_allow_use_intermediate_crs (Proj.Context ctx, Proj.IntermediateCrsUse use);
        [CCode (instance_pos = 0.9)]
        public void set_allowed_intermediate_crs (Proj.Context ctx, [CCode (array_length = false)] string[] list_of_auth_name_codes);
        [CCode (instance_pos = 0.9)]
        public void set_discard_superseded (Proj.Context ctx, int discard);
    }
    [CCode (cname = "PJ_OBJ_LIST", cprefix = "proj_list_", free_function = "proj_list_destroy", has_type_id = false)]
    [Compact]
    public class ObjectList {
        [CCode (cname = "proj_create_operations")]
        public ObjectList (Proj.Context ctx, Proj.Projection source_crs, Proj.Projection target_crs, Proj.OperationFactoryContext operation_context);
        public int get_count ();
        [CCode (instance_pos = 0.9)]
        public Proj.Projection get (Proj.Context ctx, int index);
    }
    [CCode (cname = "PJ_AREA", cprefix = "proj_area_", free_function = "proj_area_destroy", has_type_id = false)]
    [Compact]
    public class Area {
        [CCode (cname = "proj_area_create")]
        public Area ();
        public void set_bbox (double west_lon_degree, double south_lat_degree, double east_lon_degree, double north_lat_degree);
    }
    [CCode (cname = "PJ_COORD", has_type_id = false)]
    [SimpleType]
    public struct Coordinate {
        public double v[4];
        public Proj.XYZT xyzt;
        public Proj.UVWT uvwt;
        public Proj.LPZT lpzt;
        public Proj.GEOD geod;
        public Proj.OPK opk;
        public Proj.ENU enu;
        public Proj.XYZ xyz;
        public Proj.UVW uvw;
        public Proj.LPZ lpz;
        public Proj.XY xy;
        public Proj.UV uv;
        public Proj.LP lp;
        [CCode (cname = "proj_coord")]
        public Coordinate (double x, double y, double z, double t);
        /**
         * Euclidean distance between two points with linear 2D coordinates
         */
        [CCode (cname = "proj_xy_dist")]
        public double xy_dist (Proj.Coordinate b);
        /**
         * Euclidean distance between two points with linear 3D coordinates
         */
        [CCode (cname = "proj_xyz_dist")]
        public double xyz_dist (Proj.Coordinate b);
    }
    [CCode (cname = "P5_FACTORS", has_type_id = false)]
    public struct Factors {
        public double meridional_scale;               /* h */
        public double parallel_scale;                 /* k */
        public double areal_scale;                    /* s */

        public double angular_distortion;             /* omega */
        public double meridian_parallel_angle;        /* theta-prime */
        public double meridian_convergence;           /* alpha */

        public double tissot_semimajor;               /* a */
        public double tissot_semiminor;               /* b */

        public double dx_dlam;
        public double dx_dphi;
        public double dy_dlam;
        public double dy_dphi;
    }
    [CCode (cname = "PJ_XYZT", has_type_id = false)]
    public struct XYZT {
        public double x;
        public double y;
        public double z;
        public double t;
    }
    [CCode (cname = "PJ_UVWT", has_type_id = false)]
    public struct UVWT {
        public double u;
        public double v;
        public double w;
        public double t;
    }
    [CCode (cname = "PJ_LPZT", has_type_id = false)]
    public struct LPZT {
        public double lam;
        public double phi;
        public double z;
        public double t;
    }
    /**
     * Rotations: omega, phi, kappa
     */
    [CCode (cname = "PJ_OPK", has_type_id = false)]
    public struct OPK {
        public double o;
        public double p;
        public double k;
    }
    /**
     * East, North, Up
     */
    [CCode (cname = "PJ_ENU", has_type_id = false)]
    public struct ENU {
        public double e;
        public double n;
        public double u;
    }
    /**
     * Geodesic length, fwd azi, rev azi
     */
    [CCode (cname = "PJ_GEOD", has_type_id = false)]
    public struct GEOD {
        public double s;
        public double a1;
        public double a2;
    }
    [CCode (cname = "PJ_UV", has_type_id = false)]
    public struct UV {
        public double u;
        public double v;
    }
    [CCode (cname = "PJ_XY", has_type_id = false)]
    public struct XY {
        public double x;
        public double y;
    }
    [CCode (cname = "PJ_LP", has_type_id = false)]
    public struct LP {
        public double lam;
        public double phi;
    }
    [CCode (cname = "PJ_XYZ", has_type_id = false)]
    public struct XYZ {
        public double x;
        public double y;
        public double z;
    }
    [CCode (cname = "PJ_UVW", has_type_id = false)]
    public struct UVW {
        public double u;
        public double v;
        public double w;
    }
    [CCode (cname = "PJ_LPZ", has_type_id = false)]
    public struct LPZ {
        public double lam;
        public double phi;
        public double z;
    }
    /**
     * Apply transformation to observation - in forward or inverse direction
     */
    [CCode (cname = "PJ_DIRECTION", has_type_id = false)]
    public enum Direction {
        [CCode (cname = "PJ_FWD")]
        FORWARD,
        [CCode (cname = "PJ_IDENT")]
        IDENTICAL,
        [CCode (cname = "PJ_INV")]
        INVERSE
    }
    /**
     * Specify how source and target CRS extent should be used to restrict
     * candidate operations (only taken into account if no explicit area of
     * interest is specified).
     */
    [CCode (cname = "PROJ_CRS_EXTENT_USE", cprefix = "PJ_CRS_EXTENT_", has_type_id = false)]
    public enum CrsExtentUse {
        NONE,
        BOTH,
        INTERSECTION,
        SMALLEST
    }
    /**
     * Describe how grid availability is used.
     */
    [CCode (cname = "PROJ_GRID_AVAILABILITY_USE", cprefix = "PROJ_GRID_AVAILABILITY_", has_type_id = false)]
    public enum GridAvailabilityUse {
        USED_FOR_SORTING,
        DISCARD_OPERATION_IF_MISSING_GRID,
        IGNORED
    }
    /**
     * Spatial criterion to restrict candidate operations.
     */
    [CCode (cname = "PROJ_SPATIAL_CRITERION", cprefix = "PROJ_SPATIAL_CRITERION_", has_type_id = false)]
    public enum SpatialCriterion {
        STRICT_CONTAINMENT,
        PARTIAL_INTERSECTION
    }
    /**
     * Describe if and how intermediate CRS should be used.
     */
    [CCode (cname = "PROJ_INTERMEDIATE_CRS_USE", cprefix = "PROJ_INTERMEDIATE_CRS_USE_", has_type_id = false)]
    public enum IntermediateCrsUse {
        ALWAYS,
        IF_NO_DIRECT_TRANSFORMATION,
        NEVER
    }
    /**
     * Callback to resolve a filename to a full path
     */
    [CCode (cname = "proj_file_finder")]
    public delegate string FileFinder (Proj.Context ctx, string file);
    public double torad (double angle_in_degrees);
    public double todeg (double angle_in_radians);
    public double dmstor (string is, ref string rs);
    public unowned string rtodms (ref string s, double r, int pos, int neg);
    public void cleanup ();
}
