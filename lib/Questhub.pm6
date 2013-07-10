use v6;
use LWP::Simple;
use JSON::Tiny;
use Questhub::Quest;

class Questhub {
    has $.server is readonly = "http://questhub.io";
    has LWP::Simple $.ua is readonly handles 'get' = LWP::Simple.new;

    method get_quests {
        my $json = self.get(self.server ~ '/api/quest');
        my $data = from-json($json);
        my @quests;
        for @($data) -> $elem {
            $elem<id> //= $elem<_id>;
            $elem<owners> //= $elem<team>;
            push @quests, Questhub::Quest.new(|$elem);
        }
        return @quests;
    }
}

