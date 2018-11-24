import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_sngrep_app_is_installed(host):
    sngrep = host.package('sngrep')

    assert sngrep.is_installed
