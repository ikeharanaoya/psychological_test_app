problem = Problem.create(title:'賢者スケール', text:'1.多様な視点への寛容さ 
  2.あいまいで複雑な問題への決断力 
  3.感情コントロール 
  4.他者への共感や思いやり 
  5.自己分析力または洞察力 
  6.他者へのアドバイス力
  
  いつも穏やかな態度を保ちつつ他者へのアドバイスがうまい人ってことで、確かに一般的な「賢者」のイメージにも当てはまる感じがしますね。
  
  もちろん常に完璧な賢者なんてなかなかいないとは思いますが、今回のテストで定期的に自分の「賢者レベル」を判断し、自己改善のよすがにしていただくのは非常によいことかと思います。具体的には、以下の24問について5点満点で採点していただければ幸いです（「当てはまる！」と思うものほど高得点）。')
Question.create(number:1,text:'他人の気持ちを察知するのが得意だ。',division_id:6,valuation:5, problem_id: problem.id)
Question.create(number:2,text:'決断するのが苦手だ。',division_id:2,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:3,text:'友人関係を維持するのが苦手だ。',division_id:4,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:4,text:'他の人からは、正しい選択を手助けしてくれる存在とみなされることが多い。',division_id:6,valuation:5, problem_id: problem.id)
Question.create(number:5,text:'自分の助けが必要とされそうな状況を避けることが多い。',division_id:4,valuation:5, problem_id: problem.id)
Question.create(number:6,text:'動揺しているとはっきりと考えることができない。',division_id:3,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:7,text:'他の人から、私が良いアドバイスをしてくれると言われることが多い。',division_id:6,valuation:5, problem_id: problem.id)
Question.create(number:8,text:'私はいつもタイムリーに意思決定をする。',division_id:2,valuation:5, problem_id: problem.id)
Question.create(number:9,text:'プレッシャーがあっても冷静でいられる。',division_id:3,valuation:5, problem_id: problem.id)
Question.create(number:10,text:'異文化について学ぶのが好きだ。',division_id:1,valuation:5, problem_id: problem.id)
Question.create(number:11,text:'大きな決断をできるだけ先延ばしにする傾向がある。',division_id:2,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:12,text:'定期的に自分の考えを振り返る時間を作っている。',division_id:5,valuation:5, problem_id: problem.id)
Question.create(number:13,text:'見知らぬ人がお金を落としたら、ひろって渡してあげる。',division_id:4,valuation:5, problem_id: problem.id)
Question.create(number:14,text:'自分とは異なるモラルや価値観を持つ人と一緒にいても気にならない。',division_id:1,valuation:5, problem_id: problem.id)
Question.create(number:15,text:'感情的なストレスから回復するのがうまい。',division_id:3,valuation:5, problem_id: problem.id)
Question.create(number:16,text:'自己を振り返ることはしない。',division_id:5,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:17,text:'自信がないときは、誰かに決めてもらいたいと思う。',division_id:2,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:18,text:'自分が扱われたいように他人を扱っている。',division_id:4,valuation:5, problem_id: problem.id)
Question.create(number:19,text:'自分の行動の理由を理解することが重要だ。',division_id:5,valuation:5, problem_id: problem.id)
Question.create(number:20,text:'出会った人すべてから何かを学ぶことが多い。',division_id:1,valuation:5, problem_id: problem.id)
Question.create(number:21,text:'多様な視点に触れるのは楽しい。',division_id:1,valuation:5, problem_id: problem.id)
Question.create(number:22,text:'自分の行動を分析することは少ない。',division_id:5,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:23,text:'人が相談に来ても、何を話せばいいのかわからないことが多い。',division_id:6,valuation:5,inversion:true, problem_id: problem.id)
Question.create(number:24,text:'自分のネガティブな感情を遮断できないことが多い。',division_id:3,valuation:5,inversion:true, problem_id: problem.id)
Division.create(division_id:1,text:'多様な視点への寛容さ', problem_id: problem.id)
Division.create(division_id:2,text:'あいまいで複雑な問題への決断力', problem_id: problem.id)
Division.create(division_id:3,text:'感情コントロール', problem_id: problem.id)
Division.create(division_id:4,text:'他者への共感や思いやり', problem_id: problem.id)
Division.create(division_id:5,text:'自己分析力または洞察力', problem_id: problem.id)
Division.create(division_id:6,text:'他者へのアドバイス力',  problem_id: problem.id)