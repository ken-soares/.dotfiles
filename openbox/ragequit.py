#!/bin/python3

from tkinter import *
import os
window = Tk()

theme = {"foreground":"#ebdbb2","button":"#665c54","background":"#282828"}
window.title("RageQuit")
window.geometry("700x350")
window.configure(bg=theme["background"])
window.resizable(False,False)
cancelButton = Button(window,text="Cancel ❌",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:exit())
cancelButton.pack(side=TOP,pady=3)
shutdownButton= Button(window,text="Shutdown 📴",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:os.system("shutdown -h now"))
shutdownButton.pack(side=TOP,pady=3)
restartButton = Button(window,text="Restart 🔄",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:os.system("shutdown -r"))
restartButton.pack(side=TOP,pady=3)
sleepButton = Button(window,text="Sleep 💤",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:os.system("systemctl suspend"))
sleepButton.pack(side=TOP,pady=3)
logoutButton = Button(window,text="Log out 🚪",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:os.system("pkill -u koneko"))
logoutButton.pack(side=TOP,pady=3)
lockButton = Button(window,text="Lock 🔒",width=90,height=2,bg=theme["button"],fg=theme["foreground"],command=lambda:os.system("i3lock -i /home/koneko/Pictures/cropped-3840-1080-1137852.png"))
lockButton.pack(side=TOP,pady=3)
window.mainloop()
