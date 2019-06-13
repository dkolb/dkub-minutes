$out_dir = 'obj/';
$makeindex = 'makeindex -s gind.ist -o %B.ind %O %B';
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o '$_[0]'.gls '$_[0]'.glo");
}
