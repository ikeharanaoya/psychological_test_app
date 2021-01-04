# FFMQ
problem = Problem.create(title: 'FFMQ', text: '「いま自分はどれぐらいマインドフルネスができてるのか？」を判断できるテスト', pattern: 1)
Division.create(division_id: 1,text: '観察',standard: 24,max: 40,problem_id: problem.id)
Division.create(division_id: 2,text: '説明',standard: 24,max: 40,problem_id: problem.id)
Division.create(division_id: 3,text: '意識した行動',standard: 24,max: 40,problem_id: problem.id)
Division.create(division_id: 4,text: '非判断',standard: 24,max: 40,problem_id: problem.id)
Division.create(division_id: 5,text: '非反応',standard: 21,max: 35,problem_id: problem.id)
Question.create(number: 1,text: '歩いているときに、意図的に自分の体が動く感覚に意識を向けることがある',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 2,text: '自分の感情を表現する言葉を見つけるのが得意だ',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 3,text: '不適切な感情を抱いたり、不合理な思考を抱いたことで、自分を批判することがある',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 4,text: '自分の感覚や感情に反応せずに、その感覚や感情を知覚することが多い',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 5,text: '何かをしているときは気が散りやすく、簡単に注意が逸れてしまう',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 6,text: 'シャワーやお風呂に入るときは、体にかかる水の感覚に注意を払う',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 7,text: '自分の信念や意見、期待を簡単に言葉にすることができる',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 8,text: '他のことを考えていたり、心配事をしていたり、気が散っていたりして、自分のやっていることに注意を払わないことがある',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 9,text: '自分の感情にとらわれずに、感情を見ることができる',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 10,text: '自分が何らかの感覚を持った時に、そんな風に感じてはいけないと自分に言い聞かせることがある',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 11,text: '自分の食べた物や飲んだ物が自分の思考や身体感覚、感情に影響を与えていることに気付ける',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 12,text: '自分の考えていることを表現する言葉を見つけるのが苦手だ',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 13,text: '気が散りやすい',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 14,text: '自分の考えていることの中には異常なものや悪いものがあり、そんな風に考えてはいけないと思っている',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 15,text: '髪の毛の風や顔にかかる太陽などの感覚に意識を向けることが多い',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 16,text: '自分の気持ちを言葉で表現するのが苦手だ',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 17,text: '自分の考えの良し悪しを判断することが多い',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 18,text: 'いま起きていることに集中できない',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 19,text: 'ネガティブな考えやイメージが頭に浮かんだときは、一歩下がって、その考えやイメージにとらわれることなく、その考えやイメージに意識を向けている',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 20,text: '時計の音、鳥のさえずり、車の音などの音に注意を払っている',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 21,text: '解決が難しい状況では、すぐに反応せずにいったん立ち止まることができる',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 22,text: '体の中になんらかの感覚がわいてきたときに、その感覚を表現できる言葉を見つけるのが難しい',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 23,text: '自分が何をしているのかあまり意識せず、自動で行動しているような気がする',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 24,text: '苦しいことを考えたり、嫌なイメージが浮かんでも、すぐに落ち着くことができる',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 25,text: '「そんなふうに考えてはダメだ」と自分に言い聞かせることがよくある',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 26,text: '周囲の匂いや香りに気づくことがよくある',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 27,text: 'ひどく動揺していても、言葉にする方法を見つけることができる',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 28,text: 'よく注意せずに突っ走ってしまうことがよくある',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 29,text: '嫌なことを考えたり、イメージしたりしても、反応せずにただ気づくことができる',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 30,text: '自分の感情の中には悪いことや不適切なものがあり、そのように感じてはいけないと思っている',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 31,text: '色、形、質感、光と影のパターンなど、芸術や自然の中にある視覚的な特徴によく気づく',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 32,text: '意識しなくとも自分の体験を言葉に変えている',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 33,text: 'ネガティブな考えやイメージが浮かんだときは、それに気付いて手放すことができる',division_id: 5,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 34,text: '注意せずに仕事や作業に、ほぼ自動的にやってしまう',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 35,text: 'ネガティブな考えやイメージが浮かんだ時には、自分が良い人間か悪い人間かを判断することが多い',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 36,text: '自分の感情が、自分の思考や行動にどのように影響するかに注意を払っている',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 37,text: '自分がその時どのように感じているかを、かなり細かく描写できる',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 38,text: '自分が注意を払わずに物事を行っていることに気づくことがある',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 39,text: '不合理な考えを持っているときには自分自身を否定しがちだ',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)