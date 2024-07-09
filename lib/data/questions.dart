import 'package:section2/models/quiz_question.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

String apiKey = "AIzaSyBp83nEOiJNSGvvvjbwy2DWslc3pYMUhBI"; // gemini 1.5
List<QuizQuestion> questions = [];

Future<void> fetchData() async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash', apiKey: apiKey);
  final content = [
    Content.text(
        '''
Buatkan 5 soal Nilai Mutlak pada matematika dengan EMPAT pilihan jawaban. 
Ikuti format berikut dengan ketat untuk setiap soal:

1. [Tulis pertanyaan lengkap di sini tanpa nomor atau label]
[Jawaban benar]
[Jawaban salah 1]
[Jawaban salah 2]
[Jawaban salah 3]

2. [Pertanyaan berikutnya]
[Jawaban benar]
[Jawaban salah 1]
[Jawaban salah 2]
[Jawaban salah 3]

(Lanjutkan hingga 5 soal)

PENTING:
- Jangan gunakan label seperti "Soal 1" atau "a)", "b)", "c)", "d)" untuk jawaban.
- Pastikan setiap soal memiliki tepat satu pertanyaan dan empat pilihan jawaban.
- Jawaban yang benar harus selalu berada di baris pertama setelah pertanyaan.
''')
  ];
  final response = await model.generateContent(content);
  String? text = response.text;
  print(text);
  print(text);
  if (text != null) {
    List<QuizQuestion> generatedQuestions = [];
    List<String> questionBlocks = text.split('\n\n');
    for (String block in questionBlocks) {
      List<String> lines = block.split('\n');
      if (lines.length >= 5) {
        String questionText = lines[0].trim();
        List<String> answers =
            lines.sublist(1, 5).map((answer) => answer.trim()).toList();
        generatedQuestions.add(QuizQuestion(questionText, answers));
      }
    }

    // Simpan list questions dengan hasil yang sudah di-generate
    questions = generatedQuestions;

    // Cetak questions termasuk prompt
    print('Prompt: ${content[0].parts[0]}');
    print('');
    questions.forEach((question) {
      print('Pertanyaan: ${question.questionText}');
      print('Jawaban:');
      for (int i = 0; i < question.answers.length; i++) {
        print(' - ${question.answers[i]}');
      }
      print('');
    });
  } else {
    print('Gagal memuat data');
  }
}

// String apiKey = 'AIzaSyBp83nEOiJNSGvvvjbwy2DWslc3pYMUhBI';
// Future<void> fetchData() async {
//   final model = GenerativeModel(
//     model: 'gemini-1.5-flash',
//     apiKey: apiKey,
//   );

//   final content = [
//     Content.text(
//       'Buatkan 5 soal matematika di bab pertidaksamaan dengan EMPAT pilihan jawaban. LANGSUNG SAJA BERIKAN PERTANYAANNYA TANPA BASA BASI LALU FIXED SET JAWABAN BENAR ADA DI PILIHAN A',
//     )
//   ];

//   final response = await model.generateContent(content);
//   String? text = response.text;
//   print(response);
//   if (text != null) {
//     List<QuizQuestion> generatedQuestions = [];

//     // Example: Split text into questions and answers
//     // Replace with your actual parsing logic based on model response format
//     List<String> questionBlocks = text.split('\n\n');

//     for (String block in questionBlocks) {
//       List<String> lines = block.split('\n');
//       String questionText = lines[0];
//       List<String> answers = lines.sublist(1);
//       generatedQuestions.add(QuizQuestion(questionText, answers));
//     }

//     // Print or process generatedQuestions as needed

//     print(generatedQuestions);
//   } else {
//     print('Failed to load data');
//   }
// }

