# protein_DNA_PWMcos_modeling
Some MD files for simulating sequence specific recognition of DNA targets by proteins using the PWMcos model. (produced with CafeMol)

## MD Files

Two systems (PU.1 and TBP) share the same file structure:

- `/ninfo`: information files including molecule-specific parameters
- `/para`: general parameters used by CafeMol
- `/pdb`: initial structures
- `*.inp`: control for CafeMol
- `*.data`: MD information
- `*.ts`: time series of energy/rmsd/rg/Q-value...
- `*.dcd`: trajectory
