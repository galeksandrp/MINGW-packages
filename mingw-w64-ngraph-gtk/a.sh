set -e

cd bla
for pkg in *.pkg.tar.*; do
    pkgname="$(echo "$pkg" | rev | cut -d- -f4- | rev)"
    diff -Nur <(pacman -Fl "$pkgname" | sed -e 's|^[^ ]* |/|' | sort) <(pacman -Ql "$pkgname" | sed -e 's|^[^/]*||' | sort)
done
