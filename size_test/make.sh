#!/bin/sh 
# bash, dash, ksh, sh compatibility

printf "                    binary16    danagy      bfloat\n"
printf "                    --------    ------      ------\n"

for b in faddfsub fadd fsub s fmulfdiv fmul fdiv s fln s fmod s fpow2 fsqrt s frac fint s fwld fwst fbld s all
do

    test ${b} = "s" && printf "\n" && continue

    a="${b}:" 
    while test ${#a} -lt "15" ; do
        a="${a} " 
    done
    printf "     ${a}"
            
    for a in ../binary16 ../danagy ../bfloat ; do
        pasmo -I ${a} -d size_${b}.asm test.bin > test.asm
        size=`find test.bin -ls | awk '{print $7}'`
        printf "%s" ${size}
        kolikrat=$((12-${#size}))
        while test $kolikrat -gt 0 ; do
            printf " "
            kolikrat=$((kolikrat-1))
        done
    done
    printf "\n"

done
