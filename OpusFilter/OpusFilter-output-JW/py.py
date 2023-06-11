import os
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import style

import sys
if sys.version_info[0] == 3:
    import tkinter as tk
else:
    import Tkinter as tk

matplotlib.use( 'tkagg')
os.system("opusfilter-scores hist JW300-scores.es-en.jsonl.gz")
os.system("opusfilter-scores corr JW300-scores.es-en.jsonl.gz")
