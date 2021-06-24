text_dict = {"0": "NO ", "1": "YES"}

with open("exp/mono0a/decode_test_yesno/scoring_kaldi/best_wer", "r") as f:
    content = f.read().splitlines()[0]
    wer = content.split()[1]
    weight, penalty = content.split("/")[-1].split("_")[1:]

file_path = "exp/mono0a/decode_test_yesno/scoring_kaldi/penalty_" + penalty + "/" + weight + ".txt"
with open(file_path, "r") as f:
    results = f.read().splitlines()

print("\n*** WER: %" + wer + " ***\n")

print("Results:")
for result in results:
    file_name, decoded_text = result.split(" ", maxsplit=1)
    decoded_text = decoded_text.replace("NO", "NO ")
    correct_text = " ".join([text_dict[number] for number in file_name.split("_")])
    print(file_name)
    print("Correct text:", correct_text)
    print("Decoded text:", decoded_text)
    print()
