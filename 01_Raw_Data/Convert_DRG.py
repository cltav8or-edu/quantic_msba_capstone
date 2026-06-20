input_file =  '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/d_drg.txt'
output_file = '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/d_drg.csv'  # pipe-separated values

with open(input_file, "r", encoding="utf-8") as infile, \
     open(output_file, "w", encoding="utf-8") as outfile:

    for line in infile:
        line = line.rstrip("\n")

        # Split on first 3 commas only
        fields = line.split(",", 3)

        # Ensure exactly 4 columns
        while len(fields) < 4:
            fields.append("")

        # Strip whitespace if desired
        fields = [f.strip() for f in fields]

        # Write as pipe-delimited
        outfile.write("|".join(fields) + "\n")
