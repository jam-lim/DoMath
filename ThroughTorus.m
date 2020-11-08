function x =ThroughTorus(p1,p2,L)
x = floor(p1(1)/L) ~=floor(p2(1)/L) || floor(p1(2)/L) ~=floor(p2(2)/L);
end