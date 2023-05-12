package vista;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

public class main extends javax.swing.JFrame {
    int num = 0;
    public main() {
        initComponents();
        this.setLocationRelativeTo(null);
    }
    
    class ButtonRenderer extends JButton implements  TableCellRenderer{
        public ButtonRenderer() {
            setOpaque(true);
        }
        @Override
        public Component getTableCellRendererComponent(JTable table, Object obj,
            boolean selected, boolean focused, int row, int col) {
            setText((obj==null) ? "":obj.toString());
            return this;
        }
    }

    class ButtonEditor extends DefaultCellEditor{
        protected JButton btn;
        private String lbl;
        private Boolean clicked;
        
        public ButtonEditor(JTextField txt) {
            super(txt);
            
            btn=new JButton();
            btn.setOpaque(true);
            
            //WHEN BUTTON IS CLICKED
            btn.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    fireEditingStopped();
                }
            });
        }

         //OVERRIDE A COUPLE OF METHODS
        @Override
        public Component getTableCellEditorComponent(JTable table, Object obj,
            boolean selected, int row, int col) {
            lbl=(obj==null) ? "":obj.toString();
            btn.setText(lbl);
            clicked=true;
            return btn;
        }
        @Override
        public Object getCellEditorValue() {
            DefaultTableModel model = (DefaultTableModel) tCarrito.getModel();
            if(clicked){
                int rowIndex = tCarrito.getSelectedRow(); // Aquí obtienes el índice de la fila seleccionada
                if (rowIndex >= 0) {
                    model.removeRow(rowIndex);
                }
                if(tCarrito.getRowCount() <= 0)
                    model.addRow(new Object[]{"","","",""});
                else if(rowIndex != 0)
                    tCarrito.setEditingRow(rowIndex-1);
            }
            clicked=false;
            if(model.getValueAt(0,0).equals(""))
                if(tCarrito.getRowCount() <= 1)
                    return new String("");
            return new String(lbl);
        }
        @Override
        public boolean stopCellEditing() {
            clicked=false;
            return super.stopCellEditing();
        }
        @Override
        protected void fireEditingStopped() {
            super.fireEditingStopped();
        }
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        bg = new javax.swing.JPanel();
        lblProductor = new javax.swing.JLabel();
        lblCarrito = new javax.swing.JLabel();
        cbDesecho = new javax.swing.JComboBox<>();
        cbProductor = new javax.swing.JComboBox<>();
        lblDesecho = new javax.swing.JLabel();
        cbRecolector = new javax.swing.JComboBox<>();
        lblTipoRecipiente = new javax.swing.JLabel();
        cbTipoRecipiente = new javax.swing.JComboBox<>();
        lblCantidad = new javax.swing.JLabel();
        tfCantidad = new javax.swing.JTextField();
        pBtnRecolectar = new javax.swing.JPanel();
        lblBtnRecolectar = new javax.swing.JLabel();
        lblTipoRecipiente2 = new javax.swing.JLabel();
        cbTipoRecipiente2 = new javax.swing.JComboBox<>();
        lblCantidad2 = new javax.swing.JLabel();
        tfCantidad2 = new javax.swing.JTextField();
        pBtnEntregar = new javax.swing.JPanel();
        lblBtnEntregar = new javax.swing.JLabel();
        pBtnFinalizar = new javax.swing.JPanel();
        lblBtnFinalizar = new javax.swing.JLabel();
        lblRecolector = new javax.swing.JLabel();
        spCarrito = new javax.swing.JScrollPane();
        tCarrito = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(800, 600));
        setResizable(false);

        bg.setBackground(new java.awt.Color(255, 255, 255));
        bg.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblProductor.setFont(new java.awt.Font("Century Gothic", 1, 24)); // NOI18N
        lblProductor.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblProductor.setText("Productor");
        bg.add(lblProductor, new org.netbeans.lib.awtextra.AbsoluteConstraints(380, 30, 160, 40));

        lblCarrito.setFont(new java.awt.Font("Century Gothic", 1, 24)); // NOI18N
        lblCarrito.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblCarrito.setText("Carrito");
        bg.add(lblCarrito, new org.netbeans.lib.awtextra.AbsoluteConstraints(-10, 280, 175, 38));

        cbDesecho.setFont(new java.awt.Font("Century Gothic", 0, 12)); // NOI18N
        cbDesecho.setBorder(null);
        bg.add(cbDesecho, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 100, 240, -1));

        cbProductor.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        cbProductor.setBorder(null);
        bg.add(cbProductor, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 40, 200, -1));

        lblDesecho.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblDesecho.setText("Desecho:");
        bg.add(lblDesecho, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 100, -1, -1));

        cbRecolector.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        cbRecolector.setBorder(null);
        bg.add(cbRecolector, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 40, 200, -1));

        lblTipoRecipiente.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblTipoRecipiente.setText("Tipo de Recipiente:");
        bg.add(lblTipoRecipiente, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 140, -1, -1));

        cbTipoRecipiente.setFont(new java.awt.Font("Century Gothic", 0, 12)); // NOI18N
        cbTipoRecipiente.setBorder(null);
        bg.add(cbTipoRecipiente, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 140, 170, -1));

        lblCantidad.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblCantidad.setText("Cantidad:");
        bg.add(lblCantidad, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 190, -1, -1));

        tfCantidad.setFont(new java.awt.Font("Century Gothic", 0, 12)); // NOI18N
        bg.add(tfCantidad, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 190, 230, -1));

        pBtnRecolectar.setBackground(new java.awt.Color(204, 255, 204));

        lblBtnRecolectar.setBackground(new java.awt.Color(255, 255, 255));
        lblBtnRecolectar.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblBtnRecolectar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblBtnRecolectar.setText("Recolectar");
        lblBtnRecolectar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblBtnRecolectar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblBtnRecolectarMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout pBtnRecolectarLayout = new javax.swing.GroupLayout(pBtnRecolectar);
        pBtnRecolectar.setLayout(pBtnRecolectarLayout);
        pBtnRecolectarLayout.setHorizontalGroup(
            pBtnRecolectarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pBtnRecolectarLayout.createSequentialGroup()
                .addComponent(lblBtnRecolectar, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        pBtnRecolectarLayout.setVerticalGroup(
            pBtnRecolectarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pBtnRecolectarLayout.createSequentialGroup()
                .addComponent(lblBtnRecolectar, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        bg.add(pBtnRecolectar, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 230, 120, 30));

        lblTipoRecipiente2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblTipoRecipiente2.setText("Tipo de Recipiente:");
        bg.add(lblTipoRecipiente2, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 100, -1, -1));

        cbTipoRecipiente2.setFont(new java.awt.Font("Century Gothic", 0, 12)); // NOI18N
        cbTipoRecipiente2.setBorder(null);
        bg.add(cbTipoRecipiente2, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 100, 200, -1));

        lblCantidad2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblCantidad2.setText("Cantidad:");
        bg.add(lblCantidad2, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 140, -1, -1));

        tfCantidad2.setFont(new java.awt.Font("Century Gothic", 0, 12)); // NOI18N
        bg.add(tfCantidad2, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 140, 270, -1));

        pBtnEntregar.setBackground(new java.awt.Color(204, 255, 204));

        lblBtnEntregar.setBackground(new java.awt.Color(255, 255, 255));
        lblBtnEntregar.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblBtnEntregar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblBtnEntregar.setText("Entregar");
        lblBtnEntregar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        javax.swing.GroupLayout pBtnEntregarLayout = new javax.swing.GroupLayout(pBtnEntregar);
        pBtnEntregar.setLayout(pBtnEntregarLayout);
        pBtnEntregarLayout.setHorizontalGroup(
            pBtnEntregarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pBtnEntregarLayout.createSequentialGroup()
                .addComponent(lblBtnEntregar, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        pBtnEntregarLayout.setVerticalGroup(
            pBtnEntregarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pBtnEntregarLayout.createSequentialGroup()
                .addComponent(lblBtnEntregar, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        bg.add(pBtnEntregar, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 180, 120, 30));

        pBtnFinalizar.setBackground(new java.awt.Color(204, 255, 204));

        lblBtnFinalizar.setBackground(new java.awt.Color(255, 255, 255));
        lblBtnFinalizar.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        lblBtnFinalizar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblBtnFinalizar.setText("Finalizar Recolección");
        lblBtnFinalizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        javax.swing.GroupLayout pBtnFinalizarLayout = new javax.swing.GroupLayout(pBtnFinalizar);
        pBtnFinalizar.setLayout(pBtnFinalizarLayout);
        pBtnFinalizarLayout.setHorizontalGroup(
            pBtnFinalizarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 180, Short.MAX_VALUE)
            .addGroup(pBtnFinalizarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(pBtnFinalizarLayout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(lblBtnFinalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        pBtnFinalizarLayout.setVerticalGroup(
            pBtnFinalizarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 45, Short.MAX_VALUE)
            .addGroup(pBtnFinalizarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(pBtnFinalizarLayout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(lblBtnFinalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );

        bg.add(pBtnFinalizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 540, 180, 45));

        lblRecolector.setFont(new java.awt.Font("Century Gothic", 1, 24)); // NOI18N
        lblRecolector.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblRecolector.setText("Recolector:");
        bg.add(lblRecolector, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 30, 160, 40));

        tCarrito.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Desecho", "Recipiente", "Cantidad", ""
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, true
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        spCarrito.setViewportView(tCarrito);
        if (tCarrito.getColumnModel().getColumnCount() > 0) {
            tCarrito.getColumnModel().getColumn(0).setResizable(false);
            tCarrito.getColumnModel().getColumn(1).setResizable(false);
            tCarrito.getColumnModel().getColumn(2).setResizable(false);
            tCarrito.getColumnModel().getColumn(3).setResizable(false);
        }

        bg.add(spCarrito, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 320, 600, 270));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(bg, javax.swing.GroupLayout.PREFERRED_SIZE, 850, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.PREFERRED_SIZE, 600, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void lblBtnRecolectarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblBtnRecolectarMouseClicked
        DefaultTableModel model = (DefaultTableModel) tCarrito.getModel();
        if(model.getRowCount()!=0){
            if(model.getValueAt(0,0).equals("")){
                model.removeRow(0);
            }
        }

        model.addRow(new Object[]{"Prueba"+ num,"Prueba2","999","Eliminar"});
        num++;
        //SET CUSTOM RENDERER TO TEAMS COLUMN
	tCarrito.getColumnModel().getColumn(3).setCellRenderer(new ButtonRenderer());;
	
	//SET CUSTOM EDITOR TO TEAMS COLUMN
	tCarrito.getColumnModel().getColumn(3).setCellEditor(new ButtonEditor(new JTextField()));
        
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }//GEN-LAST:event_lblBtnRecolectarMouseClicked

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel bg;
    private javax.swing.JComboBox<String> cbDesecho;
    private javax.swing.JComboBox<String> cbProductor;
    private javax.swing.JComboBox<String> cbRecolector;
    private javax.swing.JComboBox<String> cbTipoRecipiente;
    private javax.swing.JComboBox<String> cbTipoRecipiente2;
    private javax.swing.JLabel lblBtnEntregar;
    private javax.swing.JLabel lblBtnFinalizar;
    private javax.swing.JLabel lblBtnRecolectar;
    private javax.swing.JLabel lblCantidad;
    private javax.swing.JLabel lblCantidad2;
    private javax.swing.JLabel lblCarrito;
    private javax.swing.JLabel lblDesecho;
    private javax.swing.JLabel lblProductor;
    private javax.swing.JLabel lblRecolector;
    private javax.swing.JLabel lblTipoRecipiente;
    private javax.swing.JLabel lblTipoRecipiente2;
    private javax.swing.JPanel pBtnEntregar;
    private javax.swing.JPanel pBtnFinalizar;
    private javax.swing.JPanel pBtnRecolectar;
    private javax.swing.JScrollPane spCarrito;
    private javax.swing.JTable tCarrito;
    private javax.swing.JTextField tfCantidad;
    private javax.swing.JTextField tfCantidad2;
    // End of variables declaration//GEN-END:variables
}
