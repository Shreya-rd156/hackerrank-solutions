SELECT W.id, P.age, W.coins_needed, W.power
FROM Wands W
JOIN Wands_Property P ON W.code = P.code
WHERE P.is_evil = 0
AND W.coins_needed = (
    SELECT MIN(W2.coins_needed)
    FROM Wands W2
    JOIN Wands_Property P2 ON W2.code = P2.code
    WHERE W2.power = W.power
    AND P2.age = P.age
    AND P2.is_evil = 0
)
ORDER BY W.power DESC, P.age DESC;
