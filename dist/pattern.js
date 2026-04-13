export function skillSimilarity(a, b) {
    if (a === b)
        return 1;
    const ta = a.split(/[-_]/);
    const tb = b.split(/[-_]/);
    let score = 0;
    const setA = new Set(ta);
    const setB = new Set(tb);
    const overlap = [...setA].filter(x => setB.has(x)).length;
    score += overlap * 0.2;
    return Math.min(score, 1);
}
