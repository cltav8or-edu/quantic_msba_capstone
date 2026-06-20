import csv

FIELD_SPECS = [
    (0, 5, 'HOSP_NIS'),           # 1-5
    (5, 9, 'NIS_STRATUM'),        # 6-9
    (9, 20, 'DISCWT'),            # 10-20 (numeric with 7 decimal digits)
    (20, 22, 'HOSP_BEDSIZE'),     # 21-22
    (22, 24, 'HOSP_LOCTEACH'),    # 23-24
    (24, 26, 'H_CONTRL'),         # 25-26
    (26, 34, 'N_DISC_U'),         # 27-34
    (34, 38, 'N_HOSP_U'),         # 35-38
    (38, 46, 'S_DISC_U'),         # 39-46
    (46, 50, 'S_HOSP_U'),         # 47-50
    (50, 56, 'TOTAL_DISC'),       # 51-56
    (56, 60, 'YEAR')              # 57-60
]
input_file =  '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/HCUP/NIS_2023_Hospital.ASC'
output_file = '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/HCUP/NIS_2023_Hospital.csv'

with open(input_file, 'r', encoding='ascii') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:
    writer = csv.writer(outfile)
    # Write header
    writer.writerow([name for _, _, name in FIELD_SPECS])
    for line_num, line in enumerate(infile, 1):
        line = line.rstrip('\r\n')  # Remove line endings
        if len(line) < 60:
            print(f"Warning: Line {line_num} too short ({len(line)} chars)")
            continue
        row = []
        for start, end, name in FIELD_SPECS:
            field = line[start:end].strip()
            # Special handling: HOSPID is Z-format (leading zeros)
            if name == 'HOSPID':
                field = field.zfill(5)
            row.append(field)

        writer.writerow(row)

    print(f"Conversion complete: {output_file}")