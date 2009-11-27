function Y = fixchromosome(X)
% Sprawdza poprawnosc chromosomu X, usuwa powtorzenia.

len = length(X);

rep(len) = 0;	% Repetitions
change = [];	% Chosen positions with repetitions
missing = [];	% Missing gens

for i = 1:len,	% Mark repetitions
	if rep(Y(i)) = 0,
		rep(Y(i)) = i;
	else
		if rand() < .5,
			change = [change, rep(Y(i))];
		else
			change = [change, i];
		end
	end
end

for i = 1:len,	% Find missing values
	if rep(i) = 0,
		missing = [missing, i];
	end
end

for i = 1:length(missing),	% Fix chromosome
	Y(change(i)) = missing(i);
end

Y = permute(Y, change);

end	%fixchromosome