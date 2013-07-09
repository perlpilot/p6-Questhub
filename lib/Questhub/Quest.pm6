use Questhub::Quest::State;

class Questhub::Quest {
    has Str $.id is readonly = !!! 'id required';
    has Str $.name is readonly = !!! 'name required';
    has Str $.author is readonly = !!! 'author required';
    has Questhub::Quest::State $.status is readonly = !!! 'status required';
    has Str @.owners is readonly = !!! 'owners required';
    has Str @.tags is readonly = !!! 'tags required';

    method Str() {
        return join "\n", map { my $n = $_.name.substr(2); "$n: " ~ self."$n"() }, self.^attributes;
    }
}
