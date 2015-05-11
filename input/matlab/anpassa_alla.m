for mapp=[15, 19],
    disp(mapp)
    for repetition=1:2,
        disp(repetition)
        [k, m, dk, dm] = anpassa(mapp, repetition);
        disp([k, m, dk, dm])
    end
end
