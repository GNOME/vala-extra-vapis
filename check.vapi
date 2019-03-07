/*
 * Copyright 2019 Corentin Noël <corentin@elementary.io>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

[CCode (cprefix = "ck_", lower_case_cprefix = "ck_", cheader_filename = "check.h")]
namespace Check {
	/**
	 * Type for a test function
	 */
	[CCode (cname = "TFun", has_target = false)]
	public delegate void TFun (int arg);

	/**
	 * Type for a setup/teardown function
	 */
	[CCode (cname = "SFun", has_target = false)]
	public delegate void SFun ();

	[CCode (cname = "tcase_fn_start")]
	public void tcase_fn_start (string fname, string file, int line);
	[CCode (cname = "vala_check_tcase_start_function")]
	public inline void tcase_start_function () {
		tcase_fn_start (GLib.Log.METHOD, GLib.Log.FILE, GLib.Log.LINE);
	}

	/**
	 * Type for a test case
	 *
	 * A TCase represents a test case. For the moment, test cases
	 * can only be run through a suite
	 */
	[Compact]
	[CCode (cname = "TCase", cprefix = "tcase_", free_function = "", cheader_filename = "check.h")]
	public class TCase {
		/**
		 * Create a test case.
		 *
		 * Once created, tests can be added with the {@link TCase.add_test}
		 * method, and the test case assigned to a suite with the
		 * {@link Suite.add_tcase} method.
		 *
		 * @param name name of the test case
		 *
		 * @return test case containing no tests
		 *
		 * @since 0.6.0
		 * */
		[CCode (cname = "tcase_create")]
		[Version (since = "0.6.0")]
		public TCase (string name);
		/**
		 * Add a test function to a test case
		 *
		 * @param tf test function to add to test case
		 *
		 * @since 0.6.0
		 * */
		[Version (since = "0.6.0")]
		public void add_test (TFun tf);

		/**
		 * Add a test function with signal handling to a test case
		 *
		 * The added test is expected to terminate by throwing the given signal
		 *
		 * @param tf test function to add to test case
		 * @param signal expected signal for test function to throw in order for
		 * the test to be considered passing
		 *
		 * @since 0.9.2
		 * */
		[Version (since = "0.9.2")]
		public void add_test_raise_signal (TFun tf, int @signal);

		/**
		 * Add a test function with an expected exit value to a test case
		 *
		 * The added test is expected to terminate by exiting with the given value
		 *
		 * @param tf test function to add to test case
		 * @param expected_exit_value exit value for test function to return in
		 * order for the test to be considered passing
		 *
		 * @since 0.9.7
		 */
		[Version (since = "0.9.7")]
		public void add_exit_test (TFun tf, int expected_exit_value);

		/**
		 * Add a looping test function to a test case
		 *
		 * The test will be called in a for(i = s; i < e; i++) loop with each
		 * iteration being executed in a new context. The loop variable 'i' is
		 * available in the test.
		 *
		 * @param tf function to add to test case
		 * @param s starting index for value "i" in test
		 * @param e ending index for value "i" in test
		 *
		 * @since 0.9.4
		 */
		[Version (since = "0.9.4")]
		public void add_loop_test (TFun tf, int s, int e);

		/**
		 * Add a looping test function with signal handling to a test case
		 *
		 * The test will be called in a for(i = s; i < e; i++) loop with each
		 * iteration being executed in a new context. The loop variable 'i' is
		 * available in the test.
		 *
		 * The added test is expected to terminate by throwing the given signal
		 *
		 * @param tf function to add to test case
		 * @param signal expected signal for test function to throw in order for
		 * the test to be considered passing
		 * @param s starting index for value "i" in test
		 * @param e ending index for value "i" in test
		 *
		 * @since 0.9.5
		 */
		[Version (since = "0.9.5")]
		public void add_loop_test_raise_signal (TFun tf, int @signal, int s, int e);

		/**
		 * Add a looping test function with an expected exit value to a test case
		 *
		 * The test will be called in a for(i = s; i < e; i++) loop with each
		 * iteration being executed in a new context. The loop variable 'i' is
		 * available in the test.
		 *
		 * The added test is expected to terminate by exiting with the given value
		 *
		 * @param tf function to add to test case
		 * @param expected_exit_value exit value for test function to return in
		 * order for the test to be considered passing
		 * @param s starting index for value "i" in test
		 * @param e ending index for value "i" in test
		 *
		 * @since 0.9.7
		 */
		[Version (since = "0.9.7")]
		public void add_loop_exit_test (TFun tf, int expected_exit_value, int s, int e);

		/**
		 * Add a test function to a test case
		 * @param tf function to add to test case
		 * @param allowed_exit_value exit value for test function to return in
		 * order for the test to be considered passing
		 * @param start starting index for value "i" in test
		 * @param end ending index for value "i" in test
		 */
		[CCode (cname = "_tcase_add_test")]
		public void add_test_full (TFun tf, string fname, int signal, int allowed_exit_value, int start, int end);

		/**
		 * Add unchecked fixture setup/teardown functions to a test case
		 *
		 * Unchecked fixture functions are run at the start and end of the
		 * test case, and not before and after unit tests. Further,
		 * unchecked fixture functions are not run in a separate address space,
		 * like test functions, and so must not exit or signal (e.g.,
		 * segfault).
		 *
		 * Also, when run in CK_NOFORK mode, unchecked fixture functions may
		 * lead to different unit test behavior if unit tests change data
		 * setup by the fixture functions.
		 *
		 * Note that if a setup function fails, the remaining setup functions
		 * will be omitted, as will the test case and the teardown functions.
		 * If a teardown function fails the remaining teardown functins will be
		 * omitted.
		 *
		 * @param setup function to add to be executed before the test case;
		 * if NULL no setup function is added
		 * @param teardown function to add to be executed after the test case;
		 * if NULL no teardown function is added
		 * @since 0.8.0
		 */
		[Version (since = "0.8.0")]
		public void add_unchecked_fixture (SFun? setup = null, SFun? teardown = null);

		/**
		 * Add checked fixture setup/teardown functions to a test case
		 *
		 * Checked fixture functions are run before and after each unit test inside
		 * of the address space of the test. Thus, if using CK_FORK
		 * mode the separate process running the unit test will survive signals
		 * or unexpected exits in the fixture function. Also, if the setup
		 * function is idempotent, unit test behavior will be the same in
		 * CK_FORK and CK_NOFORK modes.
		 *
		 * However, since fixture functions are run before and after each unit
		 * test, they should not be expensive code.
		 *
		 * Note that if a setup function fails, the remaining setup functions
		 * will be omitted, as will the test and the teardown functions. If a
		 * teardown function fails the remaining teardown functins will be
		 * omitted.
		 *
		 * @param setup function to add to be executed before each unit test in
		 * the test case; if NULL no setup function is added
		 * @param teardown function to add to be executed after each unit test in
		 * the test case; if NULL no teardown function is added
		 *
		 * @since 0.8.0
		*/
		[Version (since = "0.8.0")]
		public void add_checked_fixture (SFun? setup = null, SFun? teardown = null);

		/**
		 * Set the timeout for all tests in a test case.
		 *
		 * A test that lasts longer than the timeout (in seconds) will be killed
		 * and thus fail with an error.
		 *
		 * If not set, the default timeout is one assigned at compile time. If
		 * the environment variable CK_DEFAULT_TIMEOUT is defined and no timeout
		 * is set, the value in the environment variable is used.
		 *
		 * If Check is compile without fork() support this call is ignored,
		 * as timeouts are not possible.
		 *
		 * @param timeout to use, in seconds. If the value contains a decimal
		 * portion, but no high resolution timer is available,
		 * the value is rounded up to the nearest second.
		 *
		 * @since 0.9.2
		 */
		[Version (since = "0.9.2")]
		public void set_timeout (double timeout);
	}

	/**
	 * Type for a test suite
	 */
	[Compact]
	[CCode (cname = "Suite", cprefix = "suite_", free_function = "", cheader_filename = "check.h")]
	public class Suite {
		/**
		 * Creates a test suite with the given name.
		 *
		 * Create a suite, which will contain test cases. Once
		 * created, use {@link Suite.add_tcase} to add test cases.
		 * When finished, create a suite runner from the
		 * suite using {@link SRunner.SRunner}
		 *
		 * @param name name of the suite
		 *
		 * @return suite
		 *
		 * @since 0.6.0
		 */
		[CCode (cname = "suite_create")]
		[Version (since = "0.6.0")]
		public Suite (string name);

		[CCode (cname = "suite_tcase")]
		private int _tcase (string tcname);
		/**
		 * Determines whether a given test suite contains a case named after a
		 * given string.
		 *
		 * @param tcname test case to look for
		 *
		 * @return true if the given test case is within the given suite;
		 * false otherwise
		 *
		 * @since 0.9.9
		 */
		[Version (since = "0.9.9")]
		[CCode (cname = "vala_check_suite_tcase")]
		public bool tcase (string tcname) {
			return _tcase (tcname) == 1;
		}

		/**
		 * Add a test case to a suite
		 *
		 * @param tc test case to add to suite
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public void add_tcase (TCase tc);
	}

	/**
	 * Fail the test if expression is false
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param expr expression to evaluate
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void assert (bool expression);

	/**
	 * Fail the test if the expression is false; print message on failure
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param expr expression to evaluate
	 * @param ... message to print (in printf format) if expression is false
	 *
	 * @since 0.9.6
	 */
	[PrintfFormat]
	[Version (since = "0.9.6")]
	public void assert_msg (bool expression, ...);

	/**
	 * Unconditionally fail the test
	 *
	 * Note that once called, the remaining of the test is aborted
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void abort ();

	/**
	 * Unconditionally fail the test; print a message
	 *
	 * Note that once called, the remaining of the test is aborted
	 *
	 * @param ... message to print (in printf format)
	 *
	 * @since 0.9.6
	 */
	[PrintfFormat]
	[Version (since = "0.9.6")]
	public void abort_msg (...);

	/**
	 * Check two signed integers to determine if X==Y
	 *
	 * If not X==Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void assert_int_eq (int X, int Y);

	/**
	 * Check two signed integers to determine if X!=Y
	 *
	 * If not X!=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void assert_int_ne (int X, int Y);

	/**
	 * Check two signed integers to determine if X<Y
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * If not X<Y, the test fails.
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_int_lt (int X, int Y);

	/**
	 * Check two signed integers to determine if X<=Y
	 *
	 * If not X<=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_int_le (int X, int Y);

	/**
	 * Check two signed integers to determine if X>Y
	 *
	 * If not X>Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_int_gt (int X, int Y);

	/**
	 * Check two signed integers to determine if X>=Y
	 *
	 * If not X>=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X signed integer
	 * @param Y signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_int_ge (int X, int Y);

	/**
	 * Check two unsigned integers to determine if X==Y
	 *
	 * If not X==Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_eq (uint X, uint Y);

	/**
	 * Check two unsigned integers to determine if X!=Y
	 *
	 * If not X!=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_ne (uint X, uint Y);

	/**
	 * Check two unsigned integers to determine if X<Y
	 *
	 * If not X<Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_lt (uint X, uint Y);

	/**
	 * Check two unsigned integers to determine if X<=Y
	 *
	 * If not X<=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_le (uint X, uint Y);

	/**
	 * Check two unsigned integers to determine if X>Y
	 *
	 * If not X>Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_gt (uint X, uint Y);

	/**
	 * Check two unsigned integers to determine if X>=Y
	 *
	 * If not X>=Y, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X unsigned signed integer
	 * @param Y unsigned signed integer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_uint_ge (uint X, uint Y);

	/**
	 * Check two strings to determine if 0==strcmp(X,Y)
	 *
	 * If not 0==strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void assert_str_eq (string X, string Y);

	/**
	 * Check two strings to determine if 0!=strcmp(X,Y)
	 *
	 * If not 0!=strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.6
	 */
	[Version (since = "0.9.6")]
	public void assert_str_ne (string X, string Y);

	/**
	 * Check two strings to determine if 0<strcmp(X,Y), (e.g. strcmp(X,Y)>0)
	 *
	 * If not 0<strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_str_lt (string X, string Y);

	/**
	 * Check two strings to determine if 0<=strcmp(X,Y) (e.g. strcmp(X,Y)>=0)
	 *
	 * If not 0<=strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_str_le (string X, string Y);

	/**
	 * Check two strings to determine if 0<strcmp(X,Y) (e.g. strcmp(X,Y)>0)
	 *
	 * If not 0<strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_str_gt (string X, string Y);

	/**
	 * Check two strings to determine if 0>=strcmp(X,Y) (e.g. strcmp(X,Y)<=0)
	 *
	 * If not 0>=strcmp(X,Y), the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X string
	 * @param Y string to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_str_ge (string X, string Y);

	/**
	 * Check if two pointers are equal.
	 *
	 * If the two passed pointers are not equal, the test
	 * fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X pointer
	 * @param Y pointer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_ptr_eq (void* X, void* Y);

	/**
	 * Check if two pointers are not.
	 *
	 * If the two passed pointers are equal, the test fails.
	 *
	 * Note that if the check fails, the remaining of the test is aborted
	 *
	 * @param X pointer
	 * @param Y pointer to compare against X
	 *
	 * @since 0.9.10
	 */
	[Version (since = "0.9.10")]
	public void assert_ptr_ne (void* X, void* Y);

	/**
	 * Mark the last point reached in a unit test.
	 *
	 * If the test throws a signal or exits, the location noted with the
	 * failure is the last location of a {@link assert*} or {@link abort} call.
	 * Use {@link mark_point} to record intermediate locations (useful for tracking down
	 * crashes or exits).
	 *
	 * @since 0.6.0
	*/
	[CCode (cname = "mark_point")]
	[Version (since = "0.6.0")]
	public void mark_point ();

	/**
	 * Enum describing the possible results of a test
	 */
	[CCode (cname = "enum test_result", cprefix = "CK_", has_type_id = false)]
	public enum TestResultValue {
		[CCode (cname = "CK_TEST_RESULT_INVALID")]
		INVALID,
		PASS,
		FAILURE,
		ERROR,
	}

	[CCode (cname = "enum print_output", cprefix = "CK_", has_type_id = false)]
	public enum PrintOutput {
		SILENT,
		MINIMAL,
		NORMAL,
		VERBOSE,
		ENV,
		SUBUNIT,
	}

	/**
	 * Enum representing the types of contexts for a test
	 */
	[CCode (cname = "enum ck_result_ctx", cprefix = "CK_CTX_", has_type_id = false)]
	public enum ResultContext {
		INVALID,
		SETUP,
		TEST,
		TEARDOWN,
	}

	/**
	 * Holds state for a running of a test suite
	 */
	[Compact]
	[CCode (cname = "SRunner", cprefix = "srunner_", free_function = "srunner_free", cheader_filename = "check.h")]
	public class SRunner {
		/**
		 * Creates a suite runner for the given suite.
		 *
		 * Once created, additional suites can be added to the
		 * suite runner using {@link SRunner.add_suite}, and the suite runner can be
		 * run with {@link SRunner.run_all}.
		 *
		 * @param s suite to generate a suite runner for
		 *
		 * @return suite runner for the given suite
		 *
		 * @since 0.6.0
		 */
		[CCode (cname = "srunner_create")]
		[Version (since = "0.6.0")]
		public SRunner (Check.Suite s);

		/**
		 * Add an additional suite to a suite runner.
		 *
		 * The first suite in a suite runner is always added in {@link SRunner.SRunner}.
		 * This call adds additional suites to a suite runner.
		 *
		 * @param s suite to add to the given suite runner
		 *
		 * @since 0.7.0
		 */
		[Version (since = "0.7.0")]
		public void add_suite (Check.Suite s);

		/**
		 * Runs a suite runner and all contained suite, printing results to
		 * stdout as specified by the print_mode.
		 *
		 * In addition to running all suites, if the suite runner has been
		 * configured to output to a log, that is also performed.
		 *
		 * Note that if the CK_RUN_CASE and/or CK_RUN_SUITE environment variables
		 * are defined, then only the named suite and/or test case is run.
		 *
		 * @param print_mode the verbosity in which to report results to stdout
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public void run_all (Check.PrintOutput print_mode = Check.PrintOutput.NORMAL);

		/**
		 * Run a specific suite or test case from a suite runner, printing results
		 * to stdout as specified by the print_mode.
		 *
		 * In addition to running any applicable suites or test cases, if the
		 * suite runner has been configured to output to a log, that is also
		 * performed.
		 *
		 * @param sname suite name to run. A NULL means "any suite".
		 * @param tcname test case name to run. A NULL means "any test case"
		 * @param print_mode the verbosity in which to report results to stdout
		 *
		 * @since 0.9.9
		 */
		[Version (since = "0.9.9")]
		public void run (string? sname = null, string? tcname = null, Check.PrintOutput print_mode = Check.PrintOutput.NORMAL);

		/**
		 * Retrieve the number of failed tests executed by a suite runner.
		 *
		 * This value represents both test failures and errors.
		 *
		 * @return number of test failures and errors found by the suite runner
		 *
		 * @since 0.6.1
		 */
		[Version (since = "0.6.1")]
		public int ntests_failed ();

		/**
		 * Retrieve the total number of tests run by a suite runner.
		 *
		 * @return number of all tests run by the suite runner
		 *
		 * @since 0.6.1
		 */
		[Version (since = "0.6.1")]
		public int ntests_run ();

		/**
		 * Return an array of results for all failures found by a suite runner.
		 *
		 * Number of results is equal to {@link SRunner.nfailed_tests}.
		 *
		 * Information about individual results can be queried using:
		 * {@link TestResult.rtype}, {@link TestResult.ctx}, {@link TestResult.msg},
		 * {@link TestResult.lno}, {@link TestResult.lfile}, and {@link TestResult.tcname}.
		 *
		 * @return array of TestResult objects
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public (unowned Check.TestResult)[] failures ();

		/**
		 * Return an array of results for all tests run by a suite runner.
		 *
		 * Number of results is equal to {@link SRunner.ntests_run}, and excludes
		 * failures due to setup function failure.
		 *
		 * Information about individual results can be queried using:
		 * {@link TestResult.rtype}, {@link TestResult.ctx}, {@link TestResult.msg},
		 * {@link TestResult.lno}, {@link TestResult.lfile}, and {@link TestResult.tcname}.
		 *
		 * @return array of TestResult objects
		 *
		 * @since 0.6.1
		*/
		[Version (since = "0.6.1")]
		public (unowned Check.TestResult)[] results ();

		/**
		 * Print the results contained in an SRunner to stdout.
		 *
		 * @param print_mode the print_output (verbosity) to use to report
		 * the result
		 *
		 * @since 0.7.0
		 */
		[Version (since = "0.7.0")]
		public void print (Check.PrintOutput print_mode);

		/**
		 * Set the suite runner to output the result in log format to the
		 * given file.
		 *
		 * Note: log file setting is an initialize only operation -- it should
		 * be done immediately after SRunner creation, and the log file can't be
		 * changed after being set.
		 *
		 * This setting does not conflict with the other log output types;
		 * all logging types can occur concurrently if configured.
		 *
		 * @param fname file name to output log results to
		 *
		 * @since 0.7.1
		*/
		[Version (since = "0.7.1")]
		public void set_log (string fname);

		[CCode (cname = "srunner_has_log")]
		private int _has_log ();
		/**
		 * Checks if the suite runner is assigned a file for log output.
		 *
		 * @return true iff the suite runner currently is configured to output
		 * in log format; false otherwise
		 *
		 * @since 0.7.1
		 */
		[Version (since = "0.7.1")]
		[CCode (cname = "vala_check_srunner_has_log")]
		public bool has_log () {
			return _has_log () == 1;
		}

		/**
		 * Retrieves the name of the currently assigned file
		 * for log output, if any exists.
		 *
		 * @return the name of the log file, or NULL if none is configured
		 *
		 * @since 0.7.1
		 */
		[Version (since = "0.7.1")]
		public unowned string? log_fname ();

		/**
		 * Set the suite runner to output the result in XML format to the
		 * given file.
		 *
		 * Note: XML file setting is an initialize only operation -- it should
		 * be done immediately after SRunner creation, and the XML file can't be
		 * changed after being set.
		 *
		 * This setting does not conflict with the other log output types;
		 * all logging types can occur concurrently if configured.
		 *
		 * @param fname file name to output XML results to
		 *
		 * @since 0.9.1
		*/
		[Version (since = "0.9.1")]
		public void set_xml (string fname);

		[CCode (cname = "srunner_has_xml")]
		private int _has_xml ();
		/**
		 * Checks if the suite runner is assigned a file for XML output.
		 *
		 * @return true iff the suite runner currently is configured to output
		 * in XML format; false otherwise
		 *
		 * @since 0.9.1
		 */
		[Version (since = "0.9.1")]
		[CCode (cname = "vala_check_srunner_has_xml")]
		public bool has_xml () {
			return _has_xml () == 1;
		}

		/**
		 * Retrieves the name of the currently assigned file
		 * for XML output, if any exists.
		 *
		 * @return the name of the XML file, or NULL if none is configured
		 *
		 * @since 0.9.1
		 */
		[Version (since = "0.9.1")]
		public unowned string? xml_fname ();

		/**
		 * Set the suite runner to output the result in TAP format to the
		 * given file.
		 *
		 * Note: TAP file setting is an initialize only operation -- it should
		 * be done immediately after SRunner creation, and the TAP file can't be
		 * changed after being set.
		 *
		 * This setting does not conflict with the other log output types;
		 * all logging types can occur concurrently if configured.
		 *
		 * @param fname file name to output TAP results to
		 *
		 * @since 0.9.12
		*/
		[Version (since = "0.9.12")]
		public void set_tap (string fname);

		[CCode (cname = "srunner_has_tap")]
		private int _has_tap ();
		/**
		 * Checks if the suite runner is assigned a file for TAP output.
		 *
		 * @return true if the suite runner currently is configured to output
		 * in TAP format; false otherwise
		 *
		 * @since 0.9.12
		 */
		[Version (since = "0.9.12")]
		[CCode (cname = "vala_check_srunner_has_tap")]
		public bool has_tap () {
			return _has_tap () == 1;
		}

		/**
		 * Retrieves the name of the currently assigned file
		 * for TAP output, if any exists.
		 *
		 * @return the name of the TAP file, or NULL if none is configured
		 *
		 * @since 0.9.12
		 */
		[Version (since = "0.9.12")]
		public unowned string? tap_fname ();

		/**
		 * Retrieve the current fork status for the given suite runner
		 *
		 * @since 0.8.0
		 */
		[Version (since = "0.8.0")]
		public Check.ForkStatus fork_status ();

		/**
		 * Set the fork status for a given suite runner.
		 *
		 * The default fork status is CK_FORK_GETENV, which will look
		 * for the CK_FORK environment variable, which can be set to
		 * "yes" or "no". If the environment variable is not present,
		 * CK_FORK will be used if fork() is available on the system,
		 * otherwise CK_NOFORK is used.
		 *
		 * If set to CK_FORK or CK_NOFORK, the environment variable
		 * if defined is ignored.
		 *
		 * If Check is compiled without support for fork(), attempting
		 * to set the status to CK_FORK is ignored.
		 *
		 * @param fstat fork status to assign
		 *
		 * @since 0.8.0
		 */
		[Version (since = "0.8.0")]
		public void set_fork_status (Check.ForkStatus fstat);
	}

	/**
	 * Opaque type for a test failure
	 */
	[Compact]
	[CCode (cname = "TestResult", cprefix = "tr_", free_function = "free", cheader_filename = "check.h")]
	public class TestResult {
		/**
		 * Retrieve type of result that the given test result represents.
		 *
		 * This is a member of test_result, and can represent a
		 * pass, failure, or error.
		 *
		 * @return result of given test
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public int rtype ();

		/**
		 * Retrieve context in which the result occurred for the given test result.
		 *
		 * The types of contents include the test setup, teardown, or the
		 * body of the test itself.
		 *
		 * @return context to which the given test result applies
		 *
		 * @since 0.8.0
		 */
		[Version (since = "0.8.0")]
		public Check.ResultContext ctx ();

		/**
		 * Retrieve failure message from test result, if applicable.
		 *
		 * @return pointer to a message, if one exists. NULL otherwise.
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public unowned string? msg ();

		/**
		 * Retrieve line number at which a failure occurred, if applicable.
		 *
		 * @return If the test resulted in a failure, returns the line number
		 * that the failure occurred on; otherwise returns -1.
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public int lno ();

		/**
		 * Retrieve file name at which a failure occurred, if applicable.
		 *
		 * @return If the test resulted in a failure, returns a string
		 * containing the name of the file where the failure
		 * occurred; otherwise returns NULL.
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public unowned string? lfile ();

		/**
		 * Retrieve test case name in which a failure occurred, if applicable.
		 *
		 * @return If the test resulted in a failure, returns a string
		 * containing the name of the test suite where the failure
		 * occurred; otherwise returns NULL.
		 *
		 * @since 0.6.0
		 */
		[Version (since = "0.6.0")]
		public unowned string? tcname ();
	}

	/**
	 * Enum describing the current fork usage.
	 */
	[CCode (cname = "enum fork_status", cprefix = "CK_", has_type_id = false)]
	public enum ForkStatus {
		FORK_GETENV,
		FORK,
		NOFORK,
	}

	/**
	 * Invoke fork() during a test and assign the child to the same
	 * process group that the rest of the test case uses.
	 *
	 * One can invoke fork() directly during a test; however doing so
	 * may not guarantee that any children processes are destroyed once
	 * the test finishes. Once a test has completed, all processes in
	 * the process group will be killed; using this wrapper will prevent
	 * orphan processes.
	 *
	 * If Check is compiled without fork() support this call simply
	 * return -1 and does nothing.
	 *
	 * @return On success, the PID of the child process is returned in
	 * the parent, and 0 is returned in the child. On failure,
	 * a value of -1 is returned to the parent process and no
	 * child process is created.
	 *
	 * @since 0.9.3
	 */
	[CCode (cname = "check_fork")]
	[Version (since = "0.9.3")]
	public Posix.pid_t check_fork ();

	/**
	 * Wait for the pid and exit.
	 *
	 * This is to be used in conjunction with {@link check_fork}. When called,
	 * will wait for the given process to terminate. If the process
	 * exited without error, exit(EXIT_SUCCESS) is invoked; otherwise
	 * exit(EXIT_FAILURE) is invoked.
	 *
	 * If Check is compiled without support for fork(), this invokes
	 * exit(EXIT_FAILURE).
	 *
	 * @param pid process to wait for, created by {@link check_fork}
	 *
	 * @since 0.9.3
	 */
	[CCode (cname = "check_waitpid_and_exit")]
	[NoReturn]
	[Version (since = "0.9.3")]
	public void check_waitpid_and_exit (Posix.pid_t pid);
}
