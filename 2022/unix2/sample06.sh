#!/bin/sh
cat <<EOF
set terminal pdfcairo
set output 'sin.pdf'
plot sin(x)
EOF
