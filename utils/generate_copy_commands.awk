BEGIN {
    print "start";
    _dest=dest;
    _total=total;
    _count=0;
}

{
    _count++;
    print sprintf("echo [ %d / %d ] \"%s\"", _count, _total, $0); 
# system( sprintf("cp -p \"%s\" \"%s\"", $0, _dest) );
    print( sprintf("cp -p -n \"%s\" \"%s\"", $0, _dest) );
}
