#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

FAMILYCOIND=${FAMILYCOIND:-$BINDIR/familycoind}
FAMILYCOINCLI=${FAMILYCOINCLI:-$BINDIR/familycoin-cli}
FAMILYCOINTX=${FAMILYCOINTX:-$BINDIR/familycoin-tx}
FAMILYCOINQT=${FAMILYCOINQT:-$BINDIR/qt/familycoin-qt}

[ ! -x $FAMILYCOIND ] && echo "$FAMILYCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
FAMILYVER=($($FAMILYCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for familycoind if --version-string is not set,
# but has different outcomes for familycoin-qt and familycoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$FAMILYCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $FAMILYCOIND $FAMILYCOINCLI $FAMILYCOINTX $FAMILYCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${FAMILYVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${FAMILYVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
