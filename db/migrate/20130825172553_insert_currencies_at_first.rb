class InsertCurrenciesAtFirst < ActiveRecord::Migration
  def up
      execute "DELETE FROM NIMBOS_CURRENCIES;
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('TRY','TURK LIRASI','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('USD','US DOLLAR','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('EUR','EURO','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('GBP','POUND STERLING','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('CAD','CANADIAN DOLLAR','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('XDR','SPECIAL D.RIGHT','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('DKK','DANISH KRONE','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('SEK','SWEDISH KRONA','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('CHF','SWISS FRANK','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('NOK','NORWEGIAN KRONE','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('JPY','YEN','',100);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('SAR','SAUDI RIYAL','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('KWD','KUWAITI DINAR','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('AUD','AUSTRALIAN DOLL','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('RUB','RUSSIAN ROUBLE','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('RON','NEW LEU','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('IRR','RIAL','',100);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('BGN','BULGARIAN LEV','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('DEM','DEUTSCHE MARK','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('BEF','BELGIQUE FRANG','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('LUF','LETZEBUERG FRANG','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('ESP','ESPANA PESETAS','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('IEP','IRELAND LIRAS','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('FRF','FRANCE FRANG','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('ITL','ITALIA LIRE','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('NLG','NEDERLAND FLORIN','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('PTE','PORTUGAL ESKUDO','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('FIM','FIN MARKKA','',1);
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier) VALUES ('GRD','GREECE DRAHMI','',1);
                      "
  end

  def down
        execute "DELETE FROM NIMBOS_CURRENCIES;"
  end
end
