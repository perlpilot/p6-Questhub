

class Questhub {
    has $.server is readonly = "http://questhub.io";
    has $.ua is readonly;

    method ua { 
        $!ua = _build_ua unless $!ua.defined;
        return $!ua;
    }
}


sub _build_ua {
    return 42;
}

