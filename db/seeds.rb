# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Problem.create(title:'賢者スケール', text:'今回のテストで定期的に自分の「賢者レベル」を判断し、自己改善のよすがにしていただくのは非常によいことかと思います。具体的には、以下の24問について5点満点で採点していただければ幸いです（「当てはまる！」と思うものほど高得点）。')
Question.create(number:1,text:'他人の気持ちを察知するのが得意だ。',division_id:6,valuation:5,problem_id:1)
Question.create(number:2,text:'決断するのが苦手だ。',division_id:2,valuation:5,inversion:true,problem_id:1)
Question.create(number:3,text:'友人関係を維持するのが苦手だ。',division_id:4,valuation:5,inversion:true,problem_id:1)
Question.create(number:4,text:'他の人からは、正しい選択を手助けしてくれる存在とみなされることが多い。',division_id:6,valuation:5,problem_id:1)
Question.create(number:5,text:'自分の助けが必要とされそうな状況を避けることが多い。',division_id:4,valuation:5,problem_id:1)
Question.create(number:6,text:'動揺しているとはっきりと考えることができない。',division_id:3,valuation:5,inversion:true,problem_id:1)
Question.create(number:7,text:'他の人から、私が良いアドバイスをしてくれると言われることが多い。',division_id:6,valuation:5,problem_id:1)
Question.create(number:8,text:'私はいつもタイムリーに意思決定をする。',division_id:2,valuation:5,problem_id:1)
Question.create(number:9,text:'プレッシャーがあっても冷静でいられる。',division_id:3,valuation:5,problem_id:1)
Question.create(number:10,text:'異文化について学ぶのが好きだ。',division_id:1,valuation:5,problem_id:1)
Question.create(number:11,text:'大きな決断をできるだけ先延ばしにする傾向がある。',division_id:2,valuation:5,inversion:true,problem_id:1)
Question.create(number:12,text:'定期的に自分の考えを振り返る時間を作っている。',division_id:5,valuation:5,problem_id:1)
Question.create(number:13,text:'見知らぬ人がお金を落としたら、ひろって渡してあげる。',division_id:4,valuation:5,problem_id:1)
Question.create(number:14,text:'自分とは異なるモラルや価値観を持つ人と一緒にいても気にならない。',division_id:1,valuation:5,problem_id:1)
Question.create(number:15,text:'感情的なストレスから回復するのがうまい。',division_id:3,valuation:5,problem_id:1)
Question.create(number:16,text:'自己を振り返ることはしない。',division_id:5,valuation:5,inversion:true,problem_id:1)
Question.create(number:17,text:'自信がないときは、誰かに決めてもらいたいと思う。',division_id:2,valuation:5,inversion:true,problem_id:1)
Question.create(number:18,text:'自分が扱われたいように他人を扱っている。',division_id:4,valuation:5,problem_id:1)
Question.create(number:19,text:'自分の行動の理由を理解することが重要だ。',division_id:5,valuation:5,problem_id:1)
Question.create(number:20,text:'出会った人すべてから何かを学ぶことが多い。',division_id:1,valuation:5,problem_id:1)
Question.create(number:21,text:'多様な視点に触れるのは楽しい。',division_id:1,valuation:5,problem_id:1)
Question.create(number:22,text:'自分の行動を分析することは少ない。',division_id:5,valuation:5,inversion:true,problem_id:1)
Question.create(number:23,text:'人が相談に来ても、何を話せばいいのかわからないことが多い。',division_id:6,valuation:5,inversion:true,problem_id:1)
Question.create(number:24,text:'自分のネガティブな感情を遮断できないことが多い。',division_id:3,valuation:5,inversion:true,problem_id:1)
