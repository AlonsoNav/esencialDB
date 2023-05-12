package esencialui.frames;

public class login extends javax.swing.JFrame {

    public login() {
        initComponents();
        this.setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        p_main = new javax.swing.JPanel();
        lbl_usuario = new javax.swing.JLabel();
        lbl_contrasena = new javax.swing.JLabel();
        tf_usuario = new javax.swing.JTextField();
        p_entrar = new javax.swing.JPanel();
        lbl_entrar = new javax.swing.JLabel();
        lbl_iniciarsesion = new javax.swing.JLabel();
        pf_contrasena = new javax.swing.JPasswordField();
        S_1 = new javax.swing.JSeparator();
        S_2 = new javax.swing.JSeparator();
        lbl_esencialverde = new javax.swing.JLabel();
        lbl_background = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        p_main.setBackground(new java.awt.Color(255, 255, 255));
        p_main.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lbl_usuario.setFont(new java.awt.Font("Century Gothic", 0, 18)); // NOI18N
        lbl_usuario.setText("Usuario");
        p_main.add(lbl_usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 130, -1, -1));

        lbl_contrasena.setFont(new java.awt.Font("Century Gothic", 0, 18)); // NOI18N
        lbl_contrasena.setText("Contraseña");
        p_main.add(lbl_contrasena, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 240, -1, -1));

        tf_usuario.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        tf_usuario.setForeground(new java.awt.Color(204, 204, 204));
        tf_usuario.setText("Ingrese su nombre de usuario");
        tf_usuario.setBorder(null);
        tf_usuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tf_usuarioActionPerformed(evt);
            }
        });
        p_main.add(tf_usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 180, -1, -1));

        p_entrar.setBackground(new java.awt.Color(51, 204, 0));
        p_entrar.setForeground(new java.awt.Color(255, 255, 255));
        p_entrar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        lbl_entrar.setFont(new java.awt.Font("sansserif", 1, 14)); // NOI18N
        lbl_entrar.setForeground(new java.awt.Color(255, 255, 255));
        lbl_entrar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lbl_entrar.setText("ENTRAR");
        lbl_entrar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lbl_entrarMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout p_entrarLayout = new javax.swing.GroupLayout(p_entrar);
        p_entrar.setLayout(p_entrarLayout);
        p_entrarLayout.setHorizontalGroup(
            p_entrarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lbl_entrar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)
        );
        p_entrarLayout.setVerticalGroup(
            p_entrarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lbl_entrar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 50, Short.MAX_VALUE)
        );

        p_main.add(p_entrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 330, 150, 50));

        lbl_iniciarsesion.setFont(new java.awt.Font("Century Gothic", 1, 24)); // NOI18N
        lbl_iniciarsesion.setText("INICIAR SESIÓN");
        p_main.add(lbl_iniciarsesion, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, -1, -1));

        pf_contrasena.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pf_contrasena.setText("jPasswordField1");
        pf_contrasena.setBorder(null);
        p_main.add(pf_contrasena, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 275, 199, -1));
        p_main.add(S_1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 200, 280, 20));
        p_main.add(S_2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 290, 280, 20));

        lbl_esencialverde.setBackground(new java.awt.Color(255, 255, 255));
        lbl_esencialverde.setFont(new java.awt.Font("Century Gothic", 1, 24)); // NOI18N
        lbl_esencialverde.setForeground(new java.awt.Color(255, 255, 255));
        lbl_esencialverde.setText("ESENCIAL VERDE");
        p_main.add(lbl_esencialverde, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 70, -1, -1));

        lbl_background.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        lbl_background.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/parque.png"))); // NOI18N
        lbl_background.setText("jLabel3");
        p_main.add(lbl_background, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 0, 320, 430));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(p_main, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(p_main, javax.swing.GroupLayout.PREFERRED_SIZE, 418, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tf_usuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tf_usuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tf_usuarioActionPerformed

    private void lbl_entrarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lbl_entrarMouseClicked
        if(!tf_usuario.getText().equals("") && !pf_contrasena.getText().equals("")){
            main mainFrame = new main();
            mainFrame.setVisible(true);
            this.dispose();
        }
    }//GEN-LAST:event_lbl_entrarMouseClicked

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JSeparator S_1;
    private javax.swing.JSeparator S_2;
    private javax.swing.JLabel lbl_background;
    private javax.swing.JLabel lbl_contrasena;
    private javax.swing.JLabel lbl_entrar;
    private javax.swing.JLabel lbl_esencialverde;
    private javax.swing.JLabel lbl_iniciarsesion;
    private javax.swing.JLabel lbl_usuario;
    private javax.swing.JPanel p_entrar;
    private javax.swing.JPanel p_main;
    private javax.swing.JPasswordField pf_contrasena;
    private javax.swing.JTextField tf_usuario;
    // End of variables declaration//GEN-END:variables
}
