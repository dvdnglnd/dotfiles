
;; JAVA
(require `eclim)
(add-hook `java-mode-hook `eclim-mode)
(require `eclimd)
;; (setq eclim-executable "c:/Users/englandd/eclipse-neon/eclipse/eclim.bat")
(global-eclim-mode)
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
(custom-set-variables
  '(eclim-eclipse-dirs '("c:/Users/englandd/eclipse-neon/eclipse"))
  '(eclim-executable "c:/Users/englandd/eclipse-neon/eclipse/eclim.bat"))
