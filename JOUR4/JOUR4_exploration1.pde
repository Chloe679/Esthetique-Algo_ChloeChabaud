
char[] first = {'Darling', 'Dear', 'Honey', 'Jewel'};
char[] second = {'duck', 'love', 'moppet', 'sweetheart'};
char[] adjectives = {
    'adorable',
    'affectionate',
    'amorous',
    'anxious',
    'ardent',
    'avid',
    'breathless',
    'burning',
    'covetous',
    'craving',
    'curious',
    'darling',
    'dear',
    'devoted',
    'eager',
    'erotic',
    'fervent',
    'fond',
    'impatient',
    'keen',
    'little',
    'loveable',
    'lovesick',
    'loving',
    'passionate',
    'precious',
    'sweet',
    'sympathetic',
    'tender',
    'unsatisfied',
    'wistful',
};
char[] nouns = {
    'adoration',
    'affection',
    'ambition',
    'appetite',
    'ardour',
    'charm',
    'desire',
    'devotion',
    'eagerness',
    'enchantment',
    'enthusiasm',
    'fancy',
    'fellow feeling',
    'fervour',
    'fondness',
    'heart',
    'hunger',
    'infatuation',
    'liking',
    'longing',
    'love',
    'lust',
    'passion',
    'rapture',
    'sympathy',
    'tenderness',
    'thirst',
    'wish',
    'yearning',
};
char[] adverbs = {
    'affectionately',
    'anxiously',
    'ardently',
    'avidly',
    'beautifully',
    'breathlessly',
    'burningly',
    'covetously',
    'curiously',
    'devotedly',
    'eagerly',
    'fervently',
    'fondly',
    'impatiently',
    'keenly',
    'lovingly',
    'passionately',
    'seductively',
    'tenderly',
    'winningly',
    'wistfully',
};
char[] verbs = {
    'adores',
    'attracts',
    'cares for',
    'cherishes',
    'clings to',
    'desires',
    'holds dear',
    'hopes for',
    'hungers for',
    'is wedded to',
    'likes',
    'longs for',
    'loves',
    'lusts after',
    'pants for',
    'pines for',
    'prizes',
    'sighs for',
    'tempts',
    'thirsts for',
    'treasures',
    'wants',
    'wishes',
    'woos',
    'yearns for',
};
//on met le mot ou pas ?
public static String maybe(List<String> words){
  boolean choice=random.nextBoolean; //on choisit au hasard true ou false
    if (choice){
        return ' ' + choice(words);}
    return '';}
    
//longue phrase ac adj ou adv potentiellement
public static String longer(){
    return (
        ' My'
        + maybe(adjectives)
        + ' '
        + choice(nouns)
        + maybe(adverbs)
        + ' '
        + choice(verbs)
        + ' your'
        + maybe(adjectives)
        + ' '
        + choice(nouns)
        + '.'
    );}
    
    
//choix au hasard d'un mot parmis la liste words
public static String choice(List<String> words){
   return words.get(random.nextInt(words.size()));
 }
//phrase courte 
public static String shorter(){
    return ' ' + choice(adjectives) + ' ' + choice(nouns) + '.';}

public static String body(){
    List<String>text = '';
    Boolean you_are = False; //on écrit you_are ou pas
    for (int i; i<=5;i++){
        String type = choice(List.of("longer", "shorter")); //choix court ou long
        if (type == 'longer'){//long pas besoin de you are
            text = text + longer();
            you_are = False;}
        else{
            if (you_are){ // phrase courte
                text.replace(text.length()-1,text.length()+1),": my"; //on remplace le dernier . par you
                texte.append(shorter()); 
                you_are = False;}
            else{
                text.append("You are my").append(shorter());
                you_are = True;}
        }
    return text;
}
}
//ecriture de la lettre
public static String letter(){
    List<String> text.append(choice(first))
    .append(' ')
    .append(choice(second))
    .append( '\n\n')
    //corps de texte dormatée sur 80 colonnes
    text.append(wrap(body(), 80))
           .append("\n\n");
           
           //signature
           text.append("      Yours")
           .append(choice(adverbs))
           .append("\n\n")
           .append("             M.U.C.\n");
    return text.toString(); //on convertit
}


print('')
while True:
    print(letter())
    sleep(12.0)
