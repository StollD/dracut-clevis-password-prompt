# dracut-clevis-password-prompt
When you encrypt your system partition and then unlock it using [clevis](https://github.com/latchset/clevis)
and the TPM (Trusted Platform Module) of your computer, you will still see
a password prompt in the bootscreen. The system continues to boot nonetheless,
but it still annoys me.

This is a small patch that will stop the password prompt from appearing, unless
the clevis decryption fails (for example if you need to boot the computer
without secure boot). Then it will show and you can unlock the disk manually
using your password.

**Note:** This is a hack and highly specialized. It might not work on anything 
except Fedora, and only on relatively simple encryption setups.

## Installation
```bash
$ git clone https://github.com/StollD/dracut-clevis-password-prompt
$ cd dracut-clevis-password-prompt
$ sudo mkdir /usr/lib/dracut/modules.d/95password-clevis
$ sudo cp module-setup.sh /usr/lib/dracut/modules.d/95password-clevis
$ sudo dracut -f
```
