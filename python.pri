# Copyright 2005-2017 The Mumble Developers. All rights reserved.
# Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file at the root of the
# Mumble source tree or at <https://www.mumble.info/LICENSE>.

# This .pri files finds a suitable Python binary on the system.
#
# It exposes the found Python binary as the 'PYTHON' qmake variable.
# This variable contains the absolute path to a working Python binary.
#
# Why do we need to do this?
#
# Some systems (for example, OpenBSD's Python port), are not
# PEP 394 (https://www.python.org/dev/peps/pep-0394/) compliant.
#
# This means that there is no 'python', 'python2' or 'python3'
# binaries in the $PATH.
#
# On those systems, we can't rely on a '#!/usr/bin/env python2'
# or similar shebang. We have to query the system for versioned
# Python binaries like "python2.7" instead.
#
# This file does that, by searching in $PATH using the 'which'
# tool.
#
# If no binary is found, an error is shown to the user.
#
# This script also supports setting a MUMBLE_PYTHON environment
# variable to specify an absolute path to a Python binary to use.
# Setting this environment variable overrides any querying.

win32 {
	PYTHON = $$(MUMBLE_PYTHON)
	isEmpty(PYTHON) {
		PYTHON=python
	}
} else {
	PYTHON = $$(MUMBLE_PYTHON)
	isEmpty(PYTHON) {
		PYTHON=$$system(which python 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python2 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python2.7 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.0 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.1 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.2 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.3 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.4 2>/dev/null)
	}
	isEmpty(PYTHON) {
		PYTHON=$$system(which python3.5 2>/dev/null)
	}
	isEmpty(PYTHON) {
		error("Unable to find the system's Python binary. Some scripts invoked during the Mumble build use Python. You can manually specify it via the MUMBLE_PYTHON environment variable (either 2 or 3).")
	}
}
