#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
# -------------------------------------------------------------
# This makefile defines the following targets
#
#   - all (default) - builds all targets and runs all tests.
#   - ci-smoke: Executes the smoke test. 
#   - fabric-ca - builds the fabric-ca binaries.
#   - pip-install - Installs the dependencies required.

all: ci-smoke fabric-ca pip-install
fabric_URL1 = https://gerrit.hyperledger.org/r/fabric
fabric_URL2 = https://gerrit.hyperledger.org/r/fabric-ca
link = /home/sambhav/fabric-test/fabric-test/feature/scripts/install_behave.sh
ci-smoke:
	@echo "=====================Installing Image Files================================="
	@echo "============================================================================"
	@git clone $(fabric_URL1)
	@make docker -C /home/sambhav/makes/fabric
fabric-ca:
	@echo "=====================Installing Binaries===================================="
	@echo "############################################################################"
	@git clone $(fabric_URL2)
	@make docker -C /home/sambhav/makes/fabric-ca
pip-install:
	@echo "=====================Installing Dependencies================================"
	@echo "############################################################################"
	@bash $(link)

