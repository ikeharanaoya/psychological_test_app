# 内向タイプ診断テスト
problem = Problem.create(title: '内向タイプ診断テスト', text: '自分はどんなタイプの「内向人間」なのか？を判断する40問')
Division.create(division_id: 1,text: '社会的な内向',standard: 30,max: 50,problem_id: problem.id)
Division.create(division_id: 2,text: '思考的な内向',standard: 34,max: 50,problem_id: problem.id)
Division.create(division_id: 3,text: '不安的な内向',standard: 30,max: 50,problem_id: problem.id)
Division.create(division_id: 4,text: '抑制的な内向',standard: 31,max: 50,problem_id: problem.id)
Question.create(number: 1,text: '大きなお祝いをするよりも、1人か数人の親しい友人と特別な機会を共有するのが好きだ。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 2,text: 'たくさんの人と親しい友達になれたら満足だと思う。',division_id: 1,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 3,text: 'いつも自分の時間を持てるように1日をスケジュールしている。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 4,text: '人が多くて活動的な場所で休暇を過ごすのが好きだ。',division_id: 1,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 5,text: 'たくさんの人に囲まれて数時間を過ごすと、たいていひとりになりたいと思う。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 6,text: '人のそばにいる必要はあまりない。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 7,text: '人のそばにいて、その人たちのことを知ることは、私にとって最高の楽しみのひとつだ。',division_id: 1,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 8,text: 'いつもは1人でやるほうが好きだ。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 9,text: '自分のことをあまり語らないで、周囲の人間に間違った印象を与えることが多い。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 10,text: '社交的な場の後は、楽しんでいてもあとで疲れを感じる。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 11,text: '自分自身についての思考やアイデアを分析するのが好きだ。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 12,text: '私の内面はとても豊かで複雑だ。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 13,text: '自分がどんな人間かをよく考える。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 14,text: '面白い物語や小説を読んでいたり、いい映画を見ていたりするときは、その物語の中の出来事が自分に起きたらどう感じるか想像する。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 15,text: '自分のことはほとんど考えない。',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 16,text: '自分の内なる感情に注意を払うようにしている。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 17,text: '自分の自己評価や自分に対する個人的な意見を大切にしている。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 18,text: '離れたところから自分を見つめ直すために、心の中で自分と距離と取ることが多い。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 19,text: '自分の身に起こるかもしれないことを、規則的に空想したり妄想したりする。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 20,text: '私は内省的で自己を分析したいと思う傾向がある。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 21,text: '誰かがいる部屋に入ると自意識過剰になり、他人の目が自分に注がれているように感じる。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 22,text: '本当は考えたくない人生の失敗や挫折について意識が集中することがよくある。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 23,text: '神経がすり減ってひとりでリラックスしなければならないことがよくある。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 24,text: '社交スキルには自信がある。',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 25,text: '敗北や失望感を覚えると、たいていは恥を感じるか怒りを覚えるが、それを表に出さないようにしている。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 26,text: '新しい状況で内気さを克服するのは簡単なことだ。',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 27,text: '慣れない社交の場でもリラックスできる。',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 28,text: '友達のグループに入っていても、孤独で不安に感じることがよくある。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 29,text: '私が表には出していない考え、感情、行動を知られたら、友人たちは引いてしまうだろう。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 30,text: '知らない人のそばにいると、すごく自意識過剰になってしまう。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 31,text: '朝起きたらすぐに出かけて行動するのが好きだ。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 32,text: '何でも一度はやってみようとする。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 33,text: 'リラックスするためには、ペースを落として物事を気楽に考えようとする。',division_id: 4,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 34,text: '激しい運動で体を消耗させるのが好きだ。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 35,text: '頭に浮かんだことをすぐ口に出す。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 36,text: 'いつも新しくて刺激的な経験や感覚を求めている。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 37,text: 'いつも忙しくしているのが好きだ。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 38,text: '衝動的に行動することがよくある。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 39,text: 'ただ人と違うことをしたいだけの動機でクレイジーな行動を取ることがある。',division_id: 4,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 40,text: 'よくだるさを感じる。',division_id: 4,valuation: 5,inversion: 0,problem_id: problem.id)