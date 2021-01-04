# リスニングスキル診断
problem = Problem.create(title: 'リスニングスキル診断', text: '人間関係の改善に欠かせない「自分の傾聴スキル」をチェックするための14問', pattern: 1)
Division.create(division_id: 1,text: '予備リスニング',standard: 9,max: 15,problem_id: problem.id)
Division.create(division_id: 2,text: 'アクティブリスニング',standard: 20,max: 35,problem_id: problem.id)
Division.create(division_id: 3,text: '共感リスニング',standard: 12,max: 20,problem_id: problem.id)
Question.create(number: 1,text: 'より多くの仕事をこなすために、電話で人と話しているときでも、電子メールやインスタントメッセージに返信する。',division_id: 1,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 2,text: '相手が言っていることをより明確に理解するために、会話中に大事なポイントを繰り返す。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 3,text: '相手がデリケートな話題について話しているときは、相手がリラックスできるように努力する。',division_id: 1,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 4,text: '会話中の沈黙が気になる。',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 5,text: '会話をしているあいだには、相手の意見と自分の意見を比べる。',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 6,text: '自分の主張を詳しく説明してもらうために、オープンクエスチョンの質問を使う（「はい」か「いいえ」で答えられない質問のこと）。',division_id: 3,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 7,text: '誰かと話すときは、うなずきながら「うんうん」や「なるほど」とあいづちを返す。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 8,text: '相手の反応をうながすために「悪魔の代弁者」を演じることがある（議論を深めるためにあえて批判や反論をするディーベート術）',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 9,text: '自分の意見に賛成してもらうために、相手を誘導尋問をすることがある。',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 10,text: '人の話をさえぎることがある。',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 11,text: '人から話しかけられたときは、相手の気をそらさないように完全にじっとしている。',division_id: 2,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 12,text: '相手の体の動きを見つつ、感情を推測しながら話を聞くようにしている。',division_id: 2,valuation: 5,inversion: 0,problem_id: problem.id)
Question.create(number: 13,text: '相手が説明に困っているときは、すぐに自分の話に切り替える。',division_id: 3,valuation: 5,inversion: 1,problem_id: problem.id)
Question.create(number: 14,text: '自分が忙しいときは、相手にできるだけ早く話し進めるようにうながす。',division_id: 1,valuation: 5,inversion: 1,problem_id: problem.id)