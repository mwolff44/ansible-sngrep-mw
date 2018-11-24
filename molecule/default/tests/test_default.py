import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize('pkg', [
  'sngrep'
])
def test_pkg_app_is_installed(host, pkg):
    package = host.package(pkg)

    assert package.is_installed
