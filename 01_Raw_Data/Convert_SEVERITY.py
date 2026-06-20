import csv

FIELD_SPECS = [
    (0, 5, 'HOSP_NIS'),              # 1-5
    (5, 15, 'KEY_NIS'),              # 6-15
    (15, 19, 'APRDRG'),              # 16-19
    (19, 21, 'APRDRG_Risk_Mortality'), # 20-21
    (21, 23, 'APRDRG_Severity')      # 22-23
]
input_file =  '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/HCUP/NIS_2023_Severity.ASC'
output_file = '/Users/scottwheeler/Library/CloudStorage/GoogleDrive-clt.av8or@gmail.com/My Drive/MSBA/00_Capstone/Data/HCUP/NIS_2023_Severity.csv'

with open(input_file, 'r', encoding='ascii') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:
    writer = csv.writer(outfile)
    # Write header
    writer.writerow([name for _, _, name in FIELD_SPECS])
    for line_num, line in enumerate(infile, 1):
        line = line.rstrip('\r\n')  # Remove line endings
        if len(line) < 23:
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